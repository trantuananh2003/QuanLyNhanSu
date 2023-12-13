package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KhenThuongKyLuatDAO;
import Models.KhenThuongKyLuat;

@WebServlet("/ktkl")
public class KhenthuongKyluatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private KhenThuongKyLuatDAO dao;

	public void init(ServletConfig config) throws ServletException {	
		dao = new KhenThuongKyLuatDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.print(action);
		
		try {
			switch (action) {
			case "insert":
				break;
			case "delete":
				break;
			case "edit":
				break;
			case "update":

				break;
			case "listKT":	
				listKT(request,response);
				break;
			case "listKL":	
				listKL(request,response);
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
		doGet(request, response);
	}
	
	private void listKT(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<KhenThuongKyLuat> listKT = dao.LayKT();
		request.getSession().setAttribute("listKT", listKT);
	    response.sendRedirect(request.getContextPath() + "/pages/KhenThuong.jsp");
	}
	private void listKL(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<KhenThuongKyLuat> listKL = dao.LayKL();
		request.getSession().setAttribute("listKL", listKL);
	    response.sendRedirect(request.getContextPath() + "/pages/KyLuat.jsp");
	}

}
