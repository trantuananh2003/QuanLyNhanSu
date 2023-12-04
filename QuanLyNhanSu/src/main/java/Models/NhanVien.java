package Models;

import java.io.Serializable;

public class NhanVien implements Serializable {
    private static final long serialVersionUID = 1L;
    private String maNV;
	private String hoTen;
    private float luongCoBan;
    private String emailCongViec;
    private String trangThai;
    private byte[] anhCaNhan;  


    public NhanVien(String maNV, String hoTen, float luongCoBan, String emailCongViec, byte[] anhCaNhan) {
        this.maNV = maNV;
        this.hoTen = hoTen;
        this.luongCoBan = luongCoBan;
        this.emailCongViec = emailCongViec;
        this.anhCaNhan = anhCaNhan;
    }
    
    public NhanVien(String maNV, String hoTen, float luongCoBan, String emailCongViec, String trangThai) {
        this.maNV = maNV;
        this.hoTen = hoTen;
        this.luongCoBan = luongCoBan;
        this.emailCongViec = emailCongViec;
        this.trangThai = trangThai;
    }
    
    public String getMaNV() {
        return maNV;
    }

    public void setMaNV(String maNV) {
        this.maNV = maNV;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public float getLuongCoBan() {
        return luongCoBan;
    }

	public void setLuongCoBan(float luongCoBan) {
		this.luongCoBan = luongCoBan;
	}
	
    public String getEmailCongViec() {
        return emailCongViec;
    }

    public void setEmailCongViec(String emailCongViec) {
        this.emailCongViec = emailCongViec;
    }
    
    public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

    public byte[] getAnhCaNhan() {
        return anhCaNhan;
    }

    public void setAnhCaNhan(byte[] anhCaNhan) {
        this.anhCaNhan = anhCaNhan;
    }
}
