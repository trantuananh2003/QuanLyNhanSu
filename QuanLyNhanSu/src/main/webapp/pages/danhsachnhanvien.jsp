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
	<div class="main-container d-flex">
		<jsp:include page="../layout/sidebar.jsp"></jsp:include>
		<div class="content">
			<main class="content px-3 py-2">
				<jsp:include page="../layout/navbar.jsp"></jsp:include>
				<div class="container-fluid">
					<h1>Danh sách nhân viên</h1>
					<h1>
						<a href="<%=request.getContextPath()%>/list" class="nav-link">load</a>
					</h1>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Mã nhân viên</th>
								<th>Họ Tên</th>
								<th>Lương cơ bản</th>
								<th>Email công việc</th>
								<th>Trạng thái</th>
								<th>Tài khoản</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="nhanvien" items="${listNhanVien}">
								<tr>
									<td><c:out value="${nhanvien.maNV}" /></td>
									<td><c:out value="${nhanvien.hoTen}" /></td>
									<td><fmt:formatNumber value="${nhanvien.luongCoBan}"
											type="number" pattern="#,##0.00" /></td>
									<td><c:out value="${nhanvien.emailCongViec}" /></td>
									<td><c:out value="${nhanvien.trangThai}" /></td>
									<td><a href="edit?id=<c:out value='${nhanvien.maNV}' />">Edit</a>
										&nbsp;&nbsp;&nbsp;&nbsp; <a
										href="delete?id=<c:out value='${nhanvien.maNV}' />">Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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