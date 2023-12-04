<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="sidebar" id="side_nav">
	<div class="header-box px-2 pt-3 pb-4 d-flex justify-content-between">
		<h1 class="fs-4">
			<span class="bg-white text-dark rounded shadow px-2 me-2">CL</span> <span
				class="text-white">Coding League</span>
		</h1>
		<button class="btn d-md-none d-block close-btn px-1 py-0 text-white">
			<i class="fal fa-stream"></i>
		</button>
	</div>
	<ul class="list-unstyled px-2">
		<li class="active"><a href="#"
			class="text-decoration-none px-3 py-2 d-block"><i
				class="fal fa-home"></i> Thông tin cá nhân</a></li>
		<li class="has-submenu"><a href="#"
			class="text-decoration-none px-3 py-2 d-block"> <i
				class="fal fa-users"></i> Nhân sự trực thuộc
		</a>
			<ul class="submenu">
				<!-- Submenu -->
				<li><a href="#" class="text-decoration-none px-3 py-2 d-block"><i
						class="fal fa-sub-item-icon"></i> none</a></li>
				<li><a href="#" class="text-decoration-none px-3 py-2 d-block"><i
						class="fal fa-sub-item-icon"></i> none</a></li>
			</ul></li>
		<li class="has-submenu"><a href="#"
			class="text-decoration-none px-3 py-2 d-block"> <i
				class="fal fa-users"></i> Khen thưởng - Kỷ luật
		</a>
			<ul class="submenu">
				<!-- Submenu -->
				<li><a href="#" class="text-decoration-none px-3 py-2 d-block"><i
						class="fal fa-sub-item-icon"></i> Khen thưởng</a></li>
				<li><a href="#" class="text-decoration-none px-3 py-2 d-block"><i
						class="fal fa-sub-item-icon"></i> Kỷ luật</a></li>
			</ul></li>
		<li class=""><a href="#"
			class="text-decoration-none px-3 py-2 d-block"><i
				class="fal fa-envelope-open-text"></i> Khiếu nại</a></li>
		<li class="has-submenu"><a href="#"
			class="text-decoration-none px-3 py-2 d-block"> <i
				class="fal fa-users"></i> Chi nhánh - Phòng ban
		</a>
			<ul class="submenu">
				<!-- Submenu -->
				<li><a href="#" class="text-decoration-none px-3 py-2 d-block"><i
						class="fal fa-sub-item-icon"></i> Chi nhánh</a></li>
				<li><a href="#" class="text-decoration-none px-3 py-2 d-block"><i
						class="fal fa-sub-item-icon"></i> Phòng ban</a></li>
			</ul></li>
		<li class="has-submenu"><a href="#"
			class="text-decoration-none px-3 py-2 d-block"> <i
				class="fal fa-users"></i> Quản lý nhân viên
		</a>
			<ul class="submenu">
				<!-- Submenu -->
				<li id="dsnv"><a href="<%=request.getContextPath()%>/nhanviencontrol"
					class="text-decoration-none px-3 py-2 d-block"><i
						class="fal fa-sub-item-icon"></i>Danh sách nhân viên</a></li>
				<li id="themnv"><a href="#"
					class="text-decoration-none px-3 py-2 d-block"><i
						class="fal fa-sub-item-icon"></i> Thêm nhân viên</a></li>
			</ul></li>
		<li class=""><a href="#"
			class="text-decoration-none px-3 py-2 d-block"><i
				class="fal fa-envelope-open-text"></i>Phân quyền</a></li>
	</ul>
</div>

