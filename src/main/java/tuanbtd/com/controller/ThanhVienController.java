package tuanbtd.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tuanbtd.com.entity.ThanhVien;
import tuanbtd.com.service.ThanhVienService;
import tuanbtd.com.validator.ThanhVienValidator;

@Controller
public class ThanhVienController {

    @Autowired
    ThanhVienService thanhVienService;

    @Autowired
    ThanhVienValidator thanhVienValidator;

    private final Logger logger = Logger.getLogger(ThanhVienController.class);
    private static final String LOGIN = "login";
    private static final String HOME = "home";
    private static final String REGISTER = "register";

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showSignUpPage(Model model, HttpServletRequest request, HttpSession session,
            @RequestParam(value = "isError", required = false) boolean isError) {
        model.addAttribute("thanhVien", new ThanhVien());
//        cartService.showCartOnHeader(model, request);
//        categoryService.showDropDownInHeader(model);                        

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            return HOME;
        }

        if (isError) {
            model.addAttribute("errorSignIn", "Login failed. Incorrect user name or password");
            return LOGIN;
        }
        return LOGIN;
    }

    @GetMapping("/logOut")
    public String logOut(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            authentication.setAuthenticated(false);
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerTVGetMethod(Model model) {
        model.addAttribute("thanhVien", new ThanhVien());
        return REGISTER;
    }

    @RequestMapping(value = "/register-action", method = RequestMethod.POST)
    public String registerThanhVien(@ModelAttribute("thanhVien") ThanhVien thanhVien, BindingResult bindingResult, Model model) {
        thanhVienValidator.validate(thanhVien, bindingResult);
        if (bindingResult.hasErrors()) {
            logger.error("Register fail");
            return REGISTER;
        }
        boolean isUserNameExisting = thanhVienService.isUserNameExisting(thanhVien.getUsername());
        boolean isEmailExisting = thanhVienService.isEmailExisting(thanhVien.getEmail());

        if (isUserNameExisting) {
            model.addAttribute("errorSignUp", "Username '" + thanhVien.getUsername() + "' already existing");
            thanhVien.setUsername("");
            model.addAttribute("thanhVien", thanhVien);
            return "register";
        }

        if (isEmailExisting) {
            model.addAttribute("errorSignUp", "Email '" + thanhVien.getEmail() + "' already existing");
            thanhVien.setEmail("");
            model.addAttribute("customer", thanhVien);
            return "register";
        }

        thanhVienService.registerThanhVien(thanhVien);

//            ConfirmationTokenEntity confirmationToken = new ConfirmationTokenEntity(thanhVien);
//            confirmationTokenRepository.save(confirmationToken);
//            
//            customerService.sendActivationEmail(thanhVien, confirmationToken);   
//            model.addAttribute("message", "Thanks for your registration. Please go to your mailbox to activate your account.");
//            model.addAttribute("cssBootstrap", "alert-success");
        model.addAttribute("RegisterSuccess", "Account registration successful");
        return LOGIN;
    }
}
