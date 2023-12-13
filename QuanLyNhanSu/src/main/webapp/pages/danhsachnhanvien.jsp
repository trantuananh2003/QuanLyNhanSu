<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="Util.JDBCUtils"%>
<%@ page import="Models.NhanVien"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link href="../css/sidebar.css" rel="stylesheet" type="text/css" />
<link href="./css/sidebar.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%
	String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>
	<div class="main-container d-flex">
		<jsp:include page="../layout/sidebar.jsp"></jsp:include>
		<div class="content">
			<main class="content px-3 py-2">
				<jsp:include page="../layout/navbar.jsp"></jsp:include>
				<div class="container-fluid">
					<h1>Danh sách nhân viên</h1>
					<div class="row my-3">
						<div class="col">
							<a
								href="<%=request.getContextPath()%>/nhanviencontrol?action=themnhanvien"
								class="btn btn-primary" tabindex="-1" role="button"
								aria-disabled="true">Thêm nhân viên</a>
						</div>
						<div class="col-md-4 offset-md-4 d-flex">
							<div class="ms-auto">
								<button type="button" class="btn btn-outline-success">Import
									Excel</button>
							</div>
						</div>
					</div>
					<div class="row">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Mã nhân viên</th>
									<th>Họ Tên</th>
									<th>Lương cơ bản</th>
									<th>Email công việc</th>
									<th>Trạng thái</th>
									<th>Chi tiết thông tin</th>
									<th>Ảnh cá nhân</th>
									<th>Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="nhanvien" items="${listNhanVien}">
									<tr>
										<td><c:out value="${nhanvien.maNV}" /></td>
										<td><c:out value="${nhanvien.hoTen}" /></td>
										<td><fmt:formatNumber value="${nhanvien.luongCoBan}"
												type="number" pattern="#,##0 VNĐ" /></td>
										<td><c:out value="${nhanvien.emailCongViec}" /></td>
										<td><c:out value="${nhanvien.trangThai}" /></td>
										<td>
											<a href="<%=url %>/hosocontrol?action=edit&manv=<c:out value='${nhanvien.maNV}'/>">Hồ sơ</a>
												<br>
											<a href="<%=url %>/hopdongcontrol?action=edit&manv=<c:out value='${nhanvien.maNV}'/>">Hợp đồng</a>
												<br>
											<a href="<%=url %>/quatrinhcongtaccontrol?action=edit&manv=<c:out value='${nhanvien.maNV}'/>">Quá trình công tác</a>	
												<br>
											<a href="Xem?id=<c:out value='${nhanvien.maNV}' />">Tài khoản</a>	
												<br>											
										</td>
										<td><img
											src="<%=url%>/AnhCaNhan/<c:out value='${nhanvien.duongDanAnh}' />"
											width="100" height="80" /></td>
										<td><a
											href="<%=url %>/nhanviencontrol?action=edit&manv=<c:out value='${nhanvien.maNV}' />">Edit</a>
											&nbsp;&nbsp;&nbsp;&nbsp; <a
											href="<%=url %>/nhanviencontrol?action=delete&manv=<c:out value='${nhanvien.maNV}' />">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="../js/jsSwitch.js"></script>
	<script src="./js/jsSwitch.js"></script>
</body>
</html>