package tuanbtd.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import tuanbtd.com.entity.SanPham;
import tuanbtd.com.service.SanPhamService;

@Controller
public class HomeController {
    
    private static final String HOME = "home";
    private static final String ABOUT = "about";
    private static final String CONTACT_US = "contact_us";
    
    @Autowired
    SanPhamService sanPhamService;
    
    @GetMapping("/")
    public String home(Model model) {
        List<SanPham> top3New =  sanPhamService.getTop3SanPhamNew();
        List<SanPham> top3GiamGia =  sanPhamService.getTop3GiamGia();
        model.addAttribute("top3New", top3New);
        model.addAttribute("top3GiamGia", top3GiamGia);
        return HOME;
    }
    
    @GetMapping("/about")
    public String about() {
        return ABOUT;
    }
    
    @GetMapping("/contact_us")
    public String contact_us() {
        return CONTACT_US;
    }
    
}
