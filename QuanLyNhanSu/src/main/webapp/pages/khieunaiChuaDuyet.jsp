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
	
	<link rel="stylesheet"
		href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

					<h1 class="text-center mb-5">Khiếu nại</h1>
					<table id="employeeTable"
						class="table table-bordered border-primary table-fixed">
						<thead class="table-dark">
							<tr>
								<th>Mã khiếu nại</th>
								<th>Nội dung khiếu nại</th>
								<th>Ngày gửi</th>
								<th style="width: 300px;">Thao tác</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="khieunai" items="${listKhieunaiChuaduyet}">
								<tr>
									<td><c:out value="${khieunai.maKN}" /></td>
									<td><c:out value="${khieunai.noidungKN}" /></td>

									<td><fmt:parseDate value="${khieunai.ngayGui}"
											pattern="yyyy-MM-dd" var="parsedDate" type="date" /> <fmt:formatDate
											value="${parsedDate}" pattern="dd-MM-yyyy" /></td>
									<td><a href="#"
										onclick="openXemModal('${khieunai.maKN}','${khieunai.ngayGui}','${khieunai.noidungKN}')">Xem
											khiếu nại</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#"
										onclick="openModal('${khieunai.maKN}')">Tạo Phản Hồi</a>
										&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"
										onclick="openHuyModal('${khieunai.maKN}')">Từ Chối</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
					<a class="btn btn-primary btn-lg btnSize" data-mdb-ripple-init
						href="#" role="button">Xóa</a>



				</div>
			</main>
		</div>
	</div>

	<!-- Modal tạo phản hồi -->
	<div class="modal fade" id="taophanhoiKN" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg " role="document">
			<div class="modal-content custom-modal">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Phản hồi</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Mã
								khiếu nại:</label> <input type="text" class="form-control"
								id="maKNInputPH" disabled>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Nội dung
								phản hồi:</label>
							<textarea class="form-control" id="contentPH"
								style="height: 450px"></textarea>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-primary" onclick="GuiPH()"
						data-dismiss="modal">Gửi</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal xem khiếu nại -->
	<div class="modal fade" id="xemKN" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg " role="document">
			<div class="modal-content custom-modal">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Xem khiếu nại</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Người
								gửi:</label> <input type="text" class="form-control" id="idNguoigui"
								disabled>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Ngày
								gửi:</label> <input type="date" class="form-control" id="idNgayGui"
								value="${formattedDate}" readonly>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Nội dung
								khiếu nại:</label>
							<textarea class="form-control" id="content" style="height: 450px"
								disabled></textarea>
						</div>

					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal xác nhận xóa -->
	<div class="modal fade" id="xacnhanhuyKN" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Xác nhận hủy
						phản hồi</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					Bạn có chắc chắn sẽ hủy phản hồi này? <input type="hidden"
						id="idKH">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
					<button type="button" class="btn btn-primary" onclick="XoaKN()">Xác
						nhận</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="../js/main.js"></script>
	<script src="<%=duongDanIndex%>/js/jsSwitch.js"></script>
	<script src="../js/KNchuaduyet.js" type="text/javascript"></script>
	
	
	
	<script type="text/javascript">
		function GuiPH() {
			var maKNValue = document.getElementById('maKNInputPH').value;
			var content = document.getElementById('contentPH').value;
			$.ajax({
				type : "POST",
				url : "/QuanLyNhanSu/khieunai",
				data : {
					action : "updatePH",
					maKNInput : maKNValue,
					noidungKNInput : content
				},
				success : function(data) {
					location.reload();
				},
				error : function() {
					alert("Lỗi xóa khiếu nại.");
				}
			});
			$.ajax({
				type : "POST",
				url : "/QuanLyNhanSu/khieunai",
				data : {
					action : "listKNdaD"
				},
				success : function(data) {
					location.reload();
				},
				error : function() {
					alert("Lỗi load khiếu nại.");
				}
			});
			location.reload();
		};
	</script>


</body>
</html>