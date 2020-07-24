package tuanbtd.com.admin.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tuanbtd.com.entity.SanPham;
import tuanbtd.com.service.SanPhamAdminService;

@Controller
@RequestMapping("/admin")
public class ProductController {

    @Autowired
    SanPhamAdminService sanPhamAdminService;

    @ModelAttribute("listAdminProduct")
    public List<SanPham> getAllProduct() {
        return sanPhamAdminService.getAllAdminProduct();
    }

    @GetMapping("/index")
    public String getProduct() {
        return "admin/index";
    }

    @GetMapping("/product")
    public String listProduct() {
        return "admin/product";
    }

    @GetMapping("/editProduct")
    public String editProduct(@RequestParam("maSP") int maSP, Model model) {
        model.addAttribute("sanPham", sanPhamAdminService.getSanPhamById(maSP));
        model.addAttribute("listLoaiSP", sanPhamAdminService.getAllLoaiSanPham());
        model.addAttribute("listNSX", sanPhamAdminService.getAllNSX());
        model.addAttribute("listNCC", sanPhamAdminService.getAllNCC());
        return "admin/editProduct";
    }

    @PostMapping("/editProductAction")
    public String editProduct_action(Model model, @ModelAttribute("sanPham") SanPham sanPham) {
        boolean check = sanPhamAdminService.editSanPham(sanPham);
        model.addAttribute("listLoaiSP", sanPhamAdminService.getAllLoaiSanPham());
        model.addAttribute("listNSX", sanPhamAdminService.getAllNSX());
        model.addAttribute("listNCC", sanPhamAdminService.getAllNCC());
        model.addAttribute("check", check);
        return "admin/editProduct";
    }

    @GetMapping("/addProduct")
    public String addProduct(Model model) {
        model.addAttribute("listLoaiSP", sanPhamAdminService.getAllLoaiSanPham());
        model.addAttribute("listNSX", sanPhamAdminService.getAllNSX());
        model.addAttribute("listNCC", sanPhamAdminService.getAllNCC());
        SanPham sanPham = new SanPham();
        sanPham.setNgapCapNhat(new Date());
        model.addAttribute("sanPham", sanPham);
        return "admin/addProduct";
    }
    
    @PostMapping("/addProductAction")
    public String addProductAction(Model model, @ModelAttribute("sanPham") SanPham sanPham) {
        boolean check = sanPhamAdminService.addSanPham(sanPham);
        model.addAttribute("check", check);
        return "admin/addProduct";
    }

    @GetMapping("/deleteProduct/{maSP}")
    public String deleleProduct(@PathVariable(name = "maSP", required = true) int maSP) {
        sanPhamAdminService.deleteSanPham(maSP);
        return "redirect:/admin/product";
    }
}
