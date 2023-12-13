package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import Models.KhenThuongKyLuat;
import Util.HandleException;
import Util.JDBCUtils;

public class KhenThuongKyLuatDAO {
	private static final String querySelectAll =  "select * from danhgiaktkl";	
	private static final String queryDelete =  "update danhgiaktkl set TrangThai=?  where MaKN =?;";
	private static final String queryUpdate =  "update danhgiaktkl set NoiDungKhieuNai =? where MaKN =?;";	
	private static final String queryCreate =  "insert into danhgiaktkl() values()";	
	
	public List<KhenThuongKyLuat> LayKT(){
		List<KhenThuongKyLuat> arrayKT = new ArrayList<>();	
		try{
			Connection con =  JDBCUtils.getConnection();
			PreparedStatement pre  =  con.prepareStatement(querySelectAll);
			System.out.print(querySelectAll);
			ResultSet result = pre.executeQuery();
			while(result.next()) {
				
				if ("khenthuong".equals(result.getString("LoaiDG"))) {
					
					String maDG =  result.getString("MaDG");
					String soQD = result.getString("SoQuyetDinh");	
					String nd =  result.getString("NoiDung");	
					Float sotien = result.getFloat("SoTienThuong");					
					LocalDate ngaygui =  result.getDate("NgayGui").toLocalDate(); 
					
					arrayKT.add(new KhenThuongKyLuat( maDG,soQD,nd,sotien,ngaygui));		
				}	
															
			}								
		} catch (SQLException e) {
			HandleException.printSQLException(e);
		}				
		return arrayKT;
	}
	
	public List<KhenThuongKyLuat> LayKL(){
	List<KhenThuongKyLuat> arrayKL = new ArrayList<>();	
		try{
			Connection con =  JDBCUtils.getConnection();
			PreparedStatement pre  =  con.prepareStatement(querySelectAll);
			System.out.print(querySelectAll);
			ResultSet result = pre.executeQuery();
			while(result.next()) {
				
				if ("kyluat".equals(result.getString("LoaiDG"))) {
					
					String maDG =  result.getString("MaDG");
					String soQD = result.getString("SoQuyetDinh");	
					String nd =  result.getString("NoiDung");					
					LocalDate ngaygui =  result.getDate("NgayGui").toLocalDate(); 
					
					arrayKL.add(new KhenThuongKyLuat( maDG,soQD,nd,ngaygui));		
				}	
															
			}								
		} catch (SQLException e) {
			HandleException.printSQLException(e);
		}				
		return arrayKL;
	}
}
