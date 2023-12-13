package Models;

import java.io.Serializable;
import java.time.LocalDate;

public class KhenThuongKyLuat implements Serializable {
	private static final long serialVersionUID = 1L;
	private String maDG;
	private String maNV;
	private String soQD;
	private String noiDung;
	private LocalDate ngayGui;
	private String trangThai;
	private Float soTienThuong;
	private String loaiDG;
	
	public KhenThuongKyLuat(){
		
	}
	public KhenThuongKyLuat(String madg,String soQD,String noidung, Float sotien, LocalDate ngayGui){
			this.maDG = madg;
			this.noiDung= noidung;
			this.soTienThuong = sotien;
			this.ngayGui = ngayGui;
			this.soQD = soQD;
	}
	public KhenThuongKyLuat(String madg,String soQD ,String noidung, LocalDate ngayGui){
			this.maDG = madg;
			this.noiDung= noidung;
			this.ngayGui = ngayGui;
			this.soQD = soQD;
	}
	
	
	public String getMaDG() {
		return maDG;
	}
	public void setMaDG(String maDG) {
		this.maDG = maDG;
	}
	public String getMaNV() {
		return maNV;
	}
	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}
	public String getSoQD() {
		return soQD;
	}
	public void setSoQD(String soQD) {
		this.soQD = soQD;
	}
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	public LocalDate getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(LocalDate ngayGui) {
		this.ngayGui = ngayGui;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	public Float getSoTienThuong() {
		return soTienThuong;
	}
	public void setSoTienThuong(Float soTienThuong) {
		this.soTienThuong = soTienThuong;
	}
	public String getLoaiDG() {
		return loaiDG;
	}
	public void setLoaiDG(String loaiDG) {
		this.loaiDG = loaiDG;
	}
	
}
