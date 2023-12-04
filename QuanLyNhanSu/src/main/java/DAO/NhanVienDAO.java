package DAO;

import java.sql.Connection;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.NhanVien;
import Util.HandleException;
import Util.JDBCUtils;

public class NhanVienDAO {
	
	private static final String SELECT_ALL_TODOS = "select * from nhanvien";

	
	public List<NhanVien> selectAllNhanVien() {

		List<NhanVien> nhanviens = new ArrayList<>();

		try (Connection connection = JDBCUtils.getConnection();

			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TODOS);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String maNv = rs.getString("MaNV");
				String hoTen = rs.getString("HoTen");
			    BigDecimal luongCoBanDecimal = rs.getBigDecimal("LuongCoBan");
			    float luongCoBanFloat = luongCoBanDecimal.floatValue();
				String emailCV = rs.getString("EmailCongViec");
				String trangThai = rs.getString("TrangThai");
				//boolean isDone = rs.getBoolean("AnhCaNhan");
				nhanviens.add(new NhanVien(maNv, hoTen, luongCoBanFloat, emailCV, trangThai));
			}
		} catch (SQLException exception) {
			HandleException.printSQLException(exception);
		}
		return nhanviens;
	}
}
