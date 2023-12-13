<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

 <%
 String duongDanIndex = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ request.getContextPath();
 %>
<link href="<%=duongDanIndex%>/css/sidebar.css" rel="stylesheet">

<title>Quản lý nhân viên</title>
</head>
<body>
	<div class="main-container d-flex">
		<jsp:include page="../layout/sidebar.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../layout/navbar.jsp"></jsp:include>
			<main class="content px-3 py-2">
				<div class="container-fluid">
					<h1 class="text-center mb-5">Khen thưởng</h1>

					<table id="employeeTable"
						class="table table-bordered border-primary table-fixed">
						<thead class="table-dark">
							<tr>
								<th>Mã số</th>
								<th>Số quyết định</th>
								<th>Nội dung khen thưởng</th>
								<th>Số tiền thưởng</th>
								<th>Ngày gửi</th>
								<th style="width: 100px;">Thao tác</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="khenthuong" items="${listKT}">
								<tr>
									<td id="${khenthuong.maDG}"><c:out
											value="${khenthuong.maDG}" /></td>
									<td id="${khenthuong.soQD}"><c:out
											value="${khenthuong.soQD}" /></td>
									<td id="${khenthuong.noiDung}"><c:out
											value="${khenthuong.noiDung}" /></td>
									<td id="${khenthuong.soTienThuong}"><c:out
											value="${khenthuong.soTienThuong}" /></td>
									<td><fmt:parseDate value="${khenthuong.ngayGui}"
											pattern="yyyy-MM-dd" var="parsedDate" type="date" /> <fmt:formatDate
											value="${parsedDate}" pattern="dd-MM-yyyy" /></td>


									<td><a href="#">Xóa</a></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
					<!-- thanh đếm trang -->
					<nav aria-label="Page navigation pagePos"
						style="display: flex; float: left;">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1">Previous</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</main>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>


	<script type="text/javascript" src="../js/main.js"></script>
	<script type="text/javascript" src="../js/KNchophanhoi.js"></script>
	<script src="<%=duongDanIndex%>/js/jsSwitch.js"></script>

</body>
</html>