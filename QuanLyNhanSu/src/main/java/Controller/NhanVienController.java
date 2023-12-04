package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NhanVienDAO;
import Models.NhanVien;

@WebServlet("/nhanviencontrol")
public class NhanVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NhanVienDAO nhanvienDAO;

	public NhanVienController() {
		super();
		nhanvienDAO = new NhanVienDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = "/list";

		try {
			switch (action) {
			case "/new":
				// listUser(request,response);
				// showNewForm(request, response);
				break;
			case "/insert":
				// insertTodo(request, response);
				break;
			case "/delete":
				// deleteTodo(request, response);
				break;
			case "/edit":
				// listUser(request,response);
				// showEditForm(request, response);
				break;
			case "/update":
				// updateTodo(request, response);
				break;
			case "/list":
				listNhanVien(request, response);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void listNhanVien(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<NhanVien> listNhanVien = nhanvienDAO.selectAllNhanVien();
		request.setAttribute("listNhanVien", listNhanVien);
		RequestDispatcher dispatcher = request.getRequestDispatcher("pages/danhsachnhanvien.jsp");
		dispatcher.forward(request, response);
	}

}
