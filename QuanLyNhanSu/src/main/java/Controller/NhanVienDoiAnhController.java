package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import DAO.NhanVienDAO;
import Models.NhanVien;

@WebServlet("/NhanVienDoiAnhController")
public class NhanVienDoiAnhController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NhanVienDAO nhanvienDAO;

    public NhanVienDoiAnhController() {
		super();
		nhanvienDAO = new NhanVienDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("123");
		NhanVien nv = null;
		nv = nhanvienDAO.selectNhanVien("NV002");
		System.out.println(nv.getMaNV());
		
		try {
			String folder = getServletContext().getRealPath("AnhCaNhan");
			System.out.println(folder);
			File file;
			int maxFileSize = 5000 * 1024;
			int maxMemSize = 5000 * 1024;
			
			System.out.println( request.getContentType().indexOf(maxMemSize));
			String contentType = request.getContentType();

			if (contentType.indexOf(contentType) >= 0) {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(maxMemSize);
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setSizeMax(maxFileSize);
				List<FileItem> files = upload.parseRequest(request);

				for (FileItem fileItem : files) {
					if(!fileItem.isFormField()) {
						String fileName = System.currentTimeMillis() + fileItem.getName();
						String path = folder + "\\" + fileName;
						System.out.println("In thử đường dẫn của folder" + folder);

						file = new File(path);
						fileItem.write(file);
						
						nv.setDuongDanAnh(fileName);
						NhanVienDAO nvDao = new NhanVienDAO();
						nvDao.updateImage(nv);
					}else {
						String name = fileItem.getFieldName();
						String value = fileItem.getString();
						System.out.println(name+" : "+value);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Bổ sung
	private void insertNhanVien(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		String maNv = request.getParameter("inputMaNV");
		String hoTen = request.getParameter("inputHoTen");
		float luongCoBan = Float.parseFloat(request.getParameter("inputLuongCoBan"));
		String emailCV = request.getParameter("inputEmailCV");
		String trangThai = request.getParameter("cbbTrangThai");

		NhanVien newNV = new NhanVien(maNv, hoTen, luongCoBan, emailCV, trangThai);
		nhanvienDAO.insertNhanVien(newNV);
	}
}
