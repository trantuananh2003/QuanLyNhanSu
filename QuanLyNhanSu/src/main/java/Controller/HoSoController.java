package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.HoSoDAO;
import DAO.NhanVienDAO;
import Models.HoSo;
import Models.NhanVien;
@WebServlet("/hosocontrol")
public class HoSoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HoSoDAO hsDAO;
	NhanVienDAO nvDAO;
	
	public HoSoController() {
		super();
		hsDAO = new HoSoDAO();
		nvDAO = new NhanVienDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		System.out.println("Action: " + action);
		try {
			switch (action) {
			case "insertHS":
				insertHoSo(request, response);
				break;
			case "updateHS":
				updateHoSo(request,response);
				break;
			case "edit":
				showEditForm(request,response);
				break;
			default:
				RequestDispatcher dispatcher = request.getRequestDispatcher("pages/login.jsp");
				dispatcher.forward(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void updateHoSo(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	    try {
	        String maHS = request.getParameter("inputMaHS");
	        String maNV = request.getParameter("inputMaNV");
	        String cccd = request.getParameter("inputCCCD");
	        String noiCapCCCD = request.getParameter("inputNoiCapCCCD");
	        LocalDate ngayCapCCCD = LocalDate.parse(request.getParameter("inputNgayCapCCCD"));
	        String maSoThue = request.getParameter("inputMSThue");
	        LocalDate ngayCapMST = LocalDate.parse(request.getParameter("inputNgayCapMSThue"));
	        String soDienThoai = request.getParameter("inputSDT");
	        Boolean gioiTinh = "1".equals(request.getParameter("cbbGioiTinh"));
	        String quocTich = request.getParameter("inputQuocTich");
	        String danToc = request.getParameter("inputDanToc");
	        String tonGiao = request.getParameter("inputTonGiao");
	        LocalDate ngaySinh = LocalDate.parse(request.getParameter("inputNgaySinh"));
	        String noiSinh = request.getParameter("inputNoiSinh");
	        String diaChi = request.getParameter("inputDiaChi");
	        String tinhThanh = request.getParameter("city");
	        String quanHuyen = request.getParameter("district");
	        String phuongXa = request.getParameter("ward");
	        String emailCaNhan = request.getParameter("inputEmailCN");
	        String tinhTrangHN = request.getParameter("cbbTinhTrangHonNhan");
	        String trinhDoVanHoa = request.getParameter("cbbTrinhDoHV");
	        String trinhDoHocVan = request.getParameter("inputTrinhDoVH");

	        HoSo updateHoSo = new HoSo(maHS, maNV, cccd, noiCapCCCD, ngayCapCCCD, maSoThue, ngayCapMST, soDienThoai,
	                gioiTinh, quocTich, danToc, tonGiao, ngaySinh, noiSinh, diaChi, tinhThanh, quanHuyen, phuongXa,
	                emailCaNhan, tinhTrangHN, trinhDoVanHoa, trinhDoHocVan);

	        hsDAO.updateHoSo(updateHoSo);
	        response.sendRedirect("/nhanviencontrol");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	

	private void insertHoSo(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		try {
			String maHS = request.getParameter("inputMaHS");
			String maNV = request.getParameter("inputMaNV");
			String cccd = request.getParameter("inputCCCD");
			String noiCapCCCD = request.getParameter("inputNoiCapCCCD");
			LocalDate ngayCapCCCD = LocalDate.parse(request.getParameter("inputNgayCapCCCD"));
			String maSoThue = request.getParameter("inputMSThue");
			LocalDate ngayCapMST = LocalDate.parse(request.getParameter("inputNgayCapMSThue"));
			String soDienThoai = request.getParameter("inputSDT");
			Boolean gioiTinh = "1".equals(request.getParameter("cbbGioiTinh"));
			String quocTich = request.getParameter("inputQuocTich");
			String danToc = request.getParameter("inputDanToc");
			String tonGiao = request.getParameter("inputTonGiao");
			LocalDate ngaySinh = LocalDate.parse(request.getParameter("inputNgaySinh"));
			String noiSinh = request.getParameter("inputNoiSinh");
			String diaChi = request.getParameter("inputDiaChi");
			String tinhThanh = request.getParameter("city");
			String quanHuyen = request.getParameter("district");
			String phuongXa = request.getParameter("ward");
			String emailCaNhan = request.getParameter("inputEmailCN");
			String tinhTrangHN = request.getParameter("cbbTinhTrangHonNhan");
			String trinhDoVanHoa = request.getParameter("cbbTrinhDoHV");

			String trinhDoHocVan = request.getParameter("inputTrinhDoVH");
			System.out.println("trinhDoHocVan: " + trinhDoHocVan);

			HoSo newHoSo = new HoSo(maHS, maNV, cccd, noiCapCCCD, ngayCapCCCD, maSoThue, ngayCapMST, soDienThoai,
					gioiTinh, quocTich, danToc, tonGiao, ngaySinh, noiSinh, diaChi, tinhThanh, quanHuyen, phuongXa,
					emailCaNhan, tinhTrangHN, trinhDoVanHoa, trinhDoHocVan);

			hsDAO.insertHoSo(newHoSo);
			request.setAttribute("hoso", newHoSo);
			request.setAttribute("hanhdongthemnhanvien", "hopdong");

			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/themnhanvien.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String maNV = request.getParameter("manv");
		System.out.println("Action from session: " + maNV);

		HoSo existingHS = hsDAO.selectHoSoByMaNV(maNV);
		request.setAttribute("hoso", existingHS);
		NhanVien existingNV = nvDAO.selectNhanVien(maNV);
		request.setAttribute("nhanvien", existingNV);
		request.setAttribute("hanhdongthemnhanvien", "hosoForm");
		request.setAttribute("hanhdongtacdong", "edit");

		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/themnhanvien.jsp");
		dispatcher.forward(request, response);
	}
	



}
