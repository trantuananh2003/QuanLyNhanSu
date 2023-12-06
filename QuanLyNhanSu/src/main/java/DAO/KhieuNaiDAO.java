package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.io.Console;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.KhieuNai;
import Util.HandleException;
import Util.JDBCUtils;

public class KhieuNaiDAO {
	private static final String querySelectAll =  "";
	
	public List<KhieuNai> LayKNChuaDuyet(){
		List<KhieuNai> arrayKN = new ArrayList<>();	
		try{
			Connection con =  JDBCUtils.getConnection();
			PreparedStatement pre  =  con.prepareStatement(querySelectAll);
			System.out.print(querySelectAll);
			ResultSet result = pre.executeQuery();
			while(result.next()) {
				String makn =  result.getString("MaKN");
				String nd =  result.getString("NoiDungKhieuNai");
				Date ngaygui =  result.getDate("NgayGui");
				arrayKN.add(new KhieuNai(makn,nd,ngaygui));												
			}								
		} catch (SQLException e) {
			HandleException.printSQLException(e);
		}				
		return arrayKN;
	}
	
	public List<KhieuNai> LayKNDaDuyet(){
		List<KhieuNai> arrayKN = new ArrayList<>();	
		try{
			Connection con =  JDBCUtils.getConnection();
			PreparedStatement pre  =  con.prepareStatement(querySelectAll);
			System.out.print(querySelectAll);
			ResultSet result = pre.executeQuery();
			while(result.next()) {
				String makn =  result.getString("MaKN");
				String noidung =  result.getString("NoiDungPhanHoi");
				Date ngaygui =  result.getDate("NgayGui");
				Date ngayduyet =  result.getDate("NgayDuyet");
				String nguoiduyet = result.getString("MaNguoiNhan");
				
				arrayKN.add(new KhieuNai(makn,noidung,ngaygui,ngayduyet,nguoiduyet));						
			}								
		} catch (SQLException e) {
			HandleException.printSQLException(e);
		}
				
		return arrayKN;
	}
	public List<KhieuNai> LayKNChoDuyet(){
		List<KhieuNai> arrayKN = new ArrayList<>();	
		try{
			Connection con =  JDBCUtils.getConnection();
			PreparedStatement pre  =  con.prepareStatement(querySelectAll);
			System.out.print(querySelectAll);
			ResultSet result = pre.executeQuery();
			while(result.next()) {
				String makn =  result.getString("MaKN");
				String manv =  result.getString("MaNgGui");
				String noidung =  result.getString("NoiDungKhieuNai");
				Date ngaygui =  result.getDate("NoiDungKhieuNai");		
				arrayKN.add(new KhieuNai(makn,manv,noidung,ngaygui));	
			}								
		} catch (SQLException e) {
			HandleException.printSQLException(e);
		}
				
		return arrayKN;
	}
	
	
	

}
