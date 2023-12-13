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
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<link href="<%=url%>/css/sidebar.css" rel="stylesheet" type="text/css" />
<link href="<%=url%>/css/profile.css" rel="stylesheet" type="text/css" />

<title>Thêm nhân viên</title>
</head>
<body>
	<div class="main-container d-flex">
		<jsp:include page="../layout/sidebar.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../layout/navbar.jsp"></jsp:include>
			<main class="content px-3 py-2">
				<div class="container-fluid">
					<div class="container-xl px-4 mt-4">
						<caption>
							<h2>
								<c:if
									test="${nhanvien != null and hanhdongthemnhanvien == null}">
					            	Chỉnh sửa thông tin nhân viên - ${nhanvien.hoTen} | ${nhanvien.maNV} 
					        	</c:if>
								<c:if test="${nhanvien == null}">
					            	Thêm nhân viên
					        	</c:if>
							</h2>
						</caption>
						<c:if test="${empty hanhdongthemnhanvien}">
							<jsp:include page="./nhanvien_thongtincoban.jsp"></jsp:include>
						</c:if>

						<c:if test="${hanhdongthemnhanvien == 'hosoForm'}">
							<jsp:include page="./nhanvien_hoso.jsp"></jsp:include>
						</c:if>

						<c:if test="${hanhdongthemnhanvien == 'hopdong'}">
							<jsp:include page="./nhanvien_hopdong.jsp"></jsp:include>
						</c:if>
						
						<c:if test="${hanhdongthemnhanvien == 'quatrinhcongtac'}">
							<jsp:include page="./nhanvien_quatrinhcongtac.jsp"></jsp:include>
						</c:if>
						
						<hr class="mt-0 mb-4">
					</div>
				</div>
			</main>
		</div>
	</div>
	<script src="<%=url%>/js/jsSwitch.js">
	</script>
	<script src="<%=url%>/js/validate_form.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"
		type="text/javascript"></script>
 		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</body>
</html>