package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KhieuNaiDAO;
import Models.KhieuNai;
import Models.LoginBean;

@WebServlet("/khieunai")
public class KhieuNaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private KhieuNaiDAO khieunaidao;
   
	public void init(ServletConfig config) throws ServletException {
		khieunaidao = new KhieuNaiDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.print(action);
		
		try {
			switch (action) {
			case "insertkn":
				createkn_choduyet(request, response);
				break;
			case "deletekn":
				deletekn_choduyet(request, response);
				break;
			case "editkn":
				updatekn_choduyet(request, response);
				break;
			case "updatePH":
				updatePH(request, response);
				break;
			case "listKNchuaD":	
				listKhieunai_chuaduyet(request, response);				
				break;
			case "listKNdaD":	
				listKhieunai_daduyet(request, response);	
				break;
			case "listKNchoD":	
				listKhieunai_choduyet(request, response);	
				break;
			default:
				response.sendRedirect(request.getContextPath() + "/pages/khieunaiChuaDuyet.jsp");
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void listKhieunai_chuaduyet(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		LoginBean acc =(LoginBean) request.getSession().getAttribute("accLogin");
		List<KhieuNai> listKN = khieunaidao.LayKNChuaDuyet(acc);
		request.getSession().setAttribute("listKhieunaiChuaduyet", listKN);
	    response.sendRedirect(request.getContextPath() + "/pages/khieunaiChuaDuyet.jsp");
	}
	private void listKhieunai_daduyet(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		LoginBean acc =(LoginBean) request.getSession().getAttribute("accLogin");
		List<KhieuNai> listKN = khieunaidao.LayKNDaDuyet(acc);
		request.getSession().setAttribute("listKhieunaiDaduyet", listKN);
	    response.sendRedirect(request.getContextPath() + "/pages/khieunaiDaDuyet.jsp");
	}
	private void listKhieunai_choduyet(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		LoginBean acc = (LoginBean) request.getSession().getAttribute("accLogin");
		List<KhieuNai> listKN = khieunaidao.LayKNChoDuyet(acc);
		request.getSession().setAttribute("listKhieunaiChoduyet", listKN);
	    response.sendRedirect(request.getContextPath() + "/pages/khieunaiChoDuyet.jsp");
	}
	
	private void updatekn_choduyet(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String id =  request.getParameter("maKNInput");
        String content = request.getParameter("noidungKNInput");       
        khieunaidao.capnhatKhieunai(id,content); 
 
	}
	private void deletekn_choduyet(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String id =  request.getParameter("maKNInput"); 
        khieunaidao.xoaKhieunai(id);    
     
	}
	private void createkn_choduyet(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		LoginBean acc = (LoginBean) request.getSession().getAttribute("accLogin");
		String email =  request.getParameter("email_send");
		String noidung =  request.getParameter("content_send");
		
        khieunaidao.taoKhieunai(acc.getMaNhanvien(),email,noidung);       
        response.sendRedirect(request.getContextPath() + "/pages/khieunaiChoDuyet.jsp");
	}
	
	private void updatePH(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String id =  request.getParameter("maKNInput");
        String content = request.getParameter("noidungKNInput");       
        khieunaidao.capnhatPH(id,content); 
 
	}
	
	

}
