package tuanbtd.com.entity;

import java.io.Serializable;
import javax.persistence.*;

import tuanbtd.com.constant.AccountRole;

import java.util.List;

@Entity
@NamedQuery(name="ThanhVien.findAll", query="SELECT tv FROM ThanhVien tv")
public class ThanhVien implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maThanhVien;

    @Column(nullable = true, columnDefinition = "nvarchar(50)")
    private String username;

    @Column(nullable = true, columnDefinition = "nvarchar(50)")
    private String password;

    private boolean isEnabled = true;

    private String role = AccountRole.ROLE_USER;

    @Column(nullable = true, columnDefinition = "nvarchar(255)")
    private String diaChi;

    @Column(nullable = true, columnDefinition = "nvarchar(50)")
    private String email;

    @Column(nullable = true, columnDefinition = "nvarchar(100)")
    private String hoTen;

    @Column(nullable = true, columnDefinition = "nvarchar(15)")
    private String soDienThoai;

    @OneToMany(mappedBy = "thanhVien", cascade = CascadeType.ALL)
    private List<BinhLuan> binhLuans;

    @OneToMany(mappedBy = "thanhVien", cascade = CascadeType.ALL)
    private List<KhachHang> khachHangs;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaLoaiTV")
    private LoaiThanhVien loaiThanhVien;

    public ThanhVien() {
    }

    public int getMaThanhVien() {
        return this.maThanhVien;
    }

    public void setMaThanhVien(int maThanhVien) {
        this.maThanhVien = maThanhVien;
    }

    public String getDiaChi() {
        return this.diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHoTen() {
        return this.hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getSoDienThoai() {
        return this.soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return isEnabled;
    }

    public void setEnabled(boolean isEnabled) {
        this.isEnabled = isEnabled;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public List<BinhLuan> getBinhLuans() {
        return this.binhLuans;
    }

    public void setBinhluans(List<BinhLuan> binhLuans) {
        this.binhLuans = binhLuans;
    }

    public BinhLuan addBinhluan(BinhLuan binhLuan) {
        getBinhLuans().add(binhLuan);
        binhLuan.setThanhVien(this);

        return binhLuan;
    }

    public BinhLuan removeBinhluan(BinhLuan binhLuan) {
        getBinhLuans().remove(binhLuan);
        binhLuan.setThanhVien(null);

        return binhLuan;
    }

    public List<KhachHang> getKhachHangs() {
        return this.khachHangs;
    }

    public void setKhachhangs(List<KhachHang> khachHangs) {
        this.khachHangs = khachHangs;
    }

    public KhachHang addKhachhang(KhachHang khachHang) {
        getKhachHangs().add(khachHang);
        khachHang.setThanhvien(this);

        return khachHang;
    }

    public KhachHang removeKhachhang(KhachHang khachHang) {
        getKhachHangs().remove(khachHang);
        khachHang.setThanhvien(null);

        return khachHang;
    }

    public LoaiThanhVien getLoaiThanhVien() {
        return this.loaiThanhVien;
    }

    public void setLoaithanhvien(LoaiThanhVien loaiThanhVien) {
        this.loaiThanhVien = loaiThanhVien;
    }

    public void setBinhLuans(List<BinhLuan> binhLuans) {
        this.binhLuans = binhLuans;
    }

    public void setKhachHangs(List<KhachHang> khachHangs) {
        this.khachHangs = khachHangs;
    }

    public void setLoaiThanhVien(LoaiThanhVien loaiThanhVien) {
        this.loaiThanhVien = loaiThanhVien;
    }

}