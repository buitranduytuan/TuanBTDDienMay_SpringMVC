package tuanbtd.com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import tuanbtd.com.entity.ChiTietDonDatHang;
import tuanbtd.com.entity.DonDatHang;
import tuanbtd.com.entity.KhachHang;
import tuanbtd.com.entity.SanPham;
import tuanbtd.com.entity.ThanhVien;
import tuanbtd.com.model.OrderDTO;
import tuanbtd.com.model.OrderItemDTO;
import tuanbtd.com.service.DatHangService;
import tuanbtd.com.service.KhachHangService;

@Controller
public class DatHangController {

    @Autowired
    KhachHangService khachHangService;

    @Autowired
    DatHangService datHangService;

    @PostMapping("/DatHang")
    public String datHang(KhachHang khachHang, Model model, HttpSession session) {

        if (session.getAttribute("order") != null) {
            khachHangService.saveInfoKH(khachHang);
            OrderDTO orderDTO = (OrderDTO) session.getAttribute("order");
            saveInfoDatHang(orderDTO, khachHang);
            session.removeAttribute("order");
            model.addAttribute("msg", "You have successfully placed an order!");

        } else {
            return "redirect:/giohang/xemgiohang";
        }

        return "chitietgiohang";
    }

    @GetMapping("/DatHang")
    public String datHangGet(Model model, HttpSession session) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            if (session.getAttribute("order") != null) {
                ThanhVien tv = (ThanhVien) authentication.getPrincipal();
                KhachHang khachHang = new KhachHang();
                khachHang.setTenKH(tv.getHoTen());
                khachHang.setEmail(tv.getEmail());
                khachHang.setDiaChi(tv.getDiaChi());
                khachHang.setSoDienThoai(tv.getSoDienThoai());
                khachHang.setThanhvien(tv);
                khachHangService.saveInfoKH(khachHang);

                OrderDTO orderDTO = (OrderDTO) session.getAttribute("order");
                saveInfoDatHang(orderDTO, khachHang);
                session.removeAttribute("order");
                model.addAttribute("msg", "You have successfully placed an order!");
                return "chitietgiohang";
            } else {
                return "redirect:/giohang/xemgiohang";
            }

        } else {
            return "redirect:/login";
        }

    }

    public void saveInfoDatHang(OrderDTO orderDTO, KhachHang khachHang) {
        DonDatHang donDatHang = new DonDatHang();
        donDatHang.setNgayDat(new Date());
        donDatHang.setDaThanhToan(false);
        donDatHang.setKhachhang(khachHang);
        donDatHang.setTinhTrangGiaoHang(false);
        donDatHang.setUuDai(0);
        datHangService.saveDonDatHang(donDatHang);

        List<OrderItemDTO> orderItems = orderDTO.getOrderItems();
        for (OrderItemDTO orderItemDTO : orderItems) {
            SanPham sanPham = orderItemDTO.getSanPham();
            ChiTietDonDatHang chiTietDonDatHang = new ChiTietDonDatHang();
            chiTietDonDatHang.setSanpham(sanPham);
            chiTietDonDatHang.setDonDatHang(donDatHang);
            chiTietDonDatHang.setDonGia(sanPham.getDonGia());
            chiTietDonDatHang.setSoLuong(orderItemDTO.getNumber());
            chiTietDonDatHang.setTenSP(sanPham.getTenSP());
            datHangService.saveChiTietDonDatHang(chiTietDonDatHang);
        }
    }
}
