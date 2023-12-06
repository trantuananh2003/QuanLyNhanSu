package Models;

import java.io.Serializable;
import java.util.Date;

public class KhieuNai implements Serializable {
	private static final long serialVersionUID = 1L;
	private String maKN;
	private String maNggui;
	private String maNgnhan;
	private String noidungKN;
	private String noidungPH;
	private Date ngayDuyet;
	private Date ngayGui;
	
	public KhieuNai(String makn, String manggui, String mangnhan, String noidungKN,String noidungPH, Date ngayDuyet, Date ngayGui) {
		this.maKN = makn;
		this.maNggui = manggui;
		this.maNgnhan = mangnhan;
		this.noidungKN = noidungKN;
		this.noidungPH = noidungPH;
		this.ngayDuyet = ngayDuyet;
		this.ngayGui = ngayGui;
	}
	public KhieuNai(String makn, String noidungKN, Date ngayGui) {
		this.maKN = makn;
		this.noidungKN = noidungKN;
		this.ngayGui = ngayGui;
	}
	public KhieuNai(String makn, String noidungKN, Date ngayGui, Date ngayDuyet, String mangnhan) {
		this.maKN = makn;
		this.noidungKN = noidungKN;
		this.ngayDuyet= ngayDuyet;			
		this.ngayGui = ngayGui;
		this.maNgnhan= mangnhan;
	}
	public KhieuNai(String makn, String manggui, String noidungKN, Date ngayGui) {
		this.maKN = makn;
		this.maNggui = manggui;
		this.noidungKN = noidungKN;
		this.ngayGui = ngayGui;
	}
	
	public KhieuNai() {
		
	}
	
	public String getMaKN() {
		return maKN;
	}
	public void setMaKN(String maKN) {
		this.maKN = maKN;
	}
	public String getMaNggui() {
		return maNggui;
	}
	public void setMaNggui(String maNggui) {
		this.maNggui = maNggui;
	}
	public String getMaNgnhan() {
		return maNgnhan;
	}
	public void setMaNgnhan(String maNgnhan) {
		this.maNgnhan = maNgnhan;
	}
	public String getNoidungKN() {
		return noidungKN;
	}
	public void setNoidungKN(String noidungKN) {
		this.noidungKN = noidungKN;
	}
	public String getNoidungPH() {
		return noidungPH;
	}
	public void setNoidungPH(String noidungPH) {
		this.noidungPH = noidungPH;
	}
	public Date getNgayDuyet() {
		return ngayDuyet;
	}
	public void setNgayDuyet(Date ngayDuyet) {
		this.ngayDuyet = ngayDuyet;
	}
	public Date getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(Date ngayGui) {
		this.ngayGui = ngayGui;
	}
		
}
