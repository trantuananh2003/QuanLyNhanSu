<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String duongDanHoSo = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<form id="hoso-form" name="hoso_form"
	action="<%=duongDanHoSo%>/hosocontrol">
	<div class="row">
		<div class="col-xl-8">
			<div class="card mb-4">

				<c:if test="${hanhdongtacdong == 'edit'}">
					<input type="hidden" name="action" value="updateHS" />
					<h1>Sửa thông tin</h1>
				</c:if>
				<c:if test="${empty hanhdongtacdong}">
					<input type="hidden" name="action" value="insertHS" />
					<h1>Thêm nhân viên</h1>
				</c:if>

				<div class="card-header">Hồ sơ nhân viên</div>
				<div class="card-body">
					<div class="row gx-3 mb-3">
						<div class="col-md-6">
							<label class="small mb-1 " for="inputMaNV">Mã nhân viên</label> <input
								class="form-control " id="inputMaNV" name="inputMaNV"
								type="text" placeholder="Nhập mã nhân viên"
								value="<c:out value='${nhanvien.maNV}' />" readonly />
						</div>
						<div class="col-md-6">
							<label class="small mb-1" for="inputMaHS">Mã hồ sơ</label> <input
								class="form-control" id="inputMaHS" type="text" name="inputMaHS"
								placeholder="Nhập mã hồ sơ"
								value="HS<c:out value='${nhanvien.maNV}'/>" readonly>
						</div>
					</div>
					<!-- Form Row-->
					<div class="row gx-3 mb-3">
						<div class="mb-3">
							<label class="small mb-1" for="inputHoTen">Họ và Tên</label> <input
								class="form-control" id="inputHoTen" name="inputHoTen" readonly
								type="text" placeholder="Nhập Họ và Tên"
								value="<c:out value='${nhanvien.hoTen}'/>">
						</div>
					</div>
					<div class="row gx-3 mb-3">
						<div class="col-md-6">
							<label class="small mb-1" for="cbbGioiTinh">Giới tính</label> <select
								class="form-control" id="cbbGioiTinh" name="cbbGioiTinh">
								<option value="1" ${hoso.gioiTinh eq '1' ? 'selected' : ''}>Nam</option>
								<option value="0" ${hoso.gioiTinh eq '0' ? 'selected' : ''}>Nữ</option>
							</select>
						</div>

						<div class="col-md-6">
							<label class="small mb-1" for="inputNgaySinh">Ngày sinh</label> <input
								class="form-control" id="inputNgaySinh" type="date"
								name="inputNgaySinh" placeholder=""
								value="<c:out value='${hoso.ngaySinh}' />">
						</div>
					</div>

					<div class="row gx-3 mb-3">
						<div class="col-md-6">
							<label class="small mb-1" for="inputSDT">Số điện thoại</label> <input
								class="form-control" id="inputSDT" type="number" name="inputSDT"
								placeholder="" value="<c:out value='${hoso.soDienThoai}' />">
						</div>
					</div>

					<div class="row gx-3 mb-3">
						<div class="col-md-3">
							<label class="small mb-1" for="inputQuocTich">Quốc tịch </label>
							<input class="form-control" id="inputQuocTich" type="text"
								name="inputQuocTich" placeholder=""
								value="<c:out value='${hoso.quocTich}' />">
						</div>
						<div class="col-md-6">
							<label class="small mb-1" for="inputNoiSinh">Nơi sinh</label> <input
								class="form-control" id="inputNoiSinh" type="text"
								name="inputNoiSinh" placeholder=""
								value="<c:out value='${hoso.noiSinh}' />">
						</div>
					</div>

					<div class="row gx-3 mb-3">
						<div class="mb-3">
							<label class="small mb-1" for="inputDiaChi">Địa chỉ</label> <input
								class="form-control" id="inputDiaChi" type="text"
								name="inputDiaChi" placeholder="Nhập địa chỉ"
								value="<c:out value='${hoso.diaChi}'/>">
						</div>
					</div>

					<div class="row gx-3 mb-3">
						<div>
							<select id="city" name="city">
								<option value="" selected>Chọn tỉnh thành</option>
							</select> <select id="district" name="district">
								<option value="" selected>Chọn quận huyện</option>
							</select> <select id="ward" name="ward">
								<option value="" selected>Chọn phường xã</option>
							</select>
						</div>
					</div>

					<div class="row gx-3 mb-3">
						<div class="col-md-6">
							<label class="small mb-1" for="inputDanToc">Dân tộc</label> <input
								class="form-control" id="inputDanToc" type="text" placeholder=""
								name="inputDanToc" value="<c:out value='${hoso.danToc}'/>">
						</div>
						<div class="col-md-6">
							<label class="small mb-1" for="inputTonGiao">Tôn giáo</label> <input
								class="form-control" id="inputTonGiao" type="text"
								name="inputTonGiao" placeholder=""
								value="<c:out value='${hoso.tonGiao}'/>">
						</div>
					</div>
					<div class="row gx-3 mb-3">

						<!-- Form Group (location)-->
						<div class="col-md-6">
							<label class="small mb-1" for="cbbTinhTrangHonNhan">Tình
								trạng hôn nhân</label> <select class="form-control"
								id="cbbTinhTrangHonNhan" name="cbbTinhTrangHonNhan">
								<option value="kethon"
									${hoso.tinhTrangHN eq 'kethon' ? 'selected' : ''}>Chưa
									kết hôn</option>
								<option value="dangco"
									${hoso.tinhTrangHN eq 'dangco' ? 'selected' : ''}>Đang
									có vợ/chồng</option>
								<option value="goa"
									${hoso.tinhTrangHN eq 'goa' ? 'selected' : ''}>Góa</option>
								<option value="lythan"
									${hoso.tinhTrangHN eq 'lythan' ? 'selected' : ''}>Ly
									thân</option>
							</select>
						</div>

					</div>

					<!-- Form Row -->
					<div class="row gx-3 mb-3">
						<div class="col-md-6">
							<label class="small mb-1" for="inputCCCD">Số CMND/CCCD</label> <input
								class="form-control" id="inputCCCD" type="number"
								name="inputCCCD" placeholder="Nhập số CMND/CCCD"
								value="<c:out value='${hoso.cCCD}'/>">
						</div>
					</div>
					<div class="row gx-3 mb-3">
						<div class="col-md-6">
							<label class="small mb-1" for="inputNoiCapCCCD">Nơi cấp
								CMND/CCCD</label> <input class="form-control" id="inputNoiCapCCCD"
								type="text" name="inputNoiCapCCCD"
								placeholder="Nơi cấp CMND/CCCD"
								value="<c:out value='${hoso.noiCapCCCD}'/>">
						</div>
						<div class="col-md-6">
							<label class="small mb-1" for="inputNgayCapCCCD">Ngày cấp
								CMND/CCCD</label> <input class="form-control" id="inputNgayCapCCCD"
								type="date" name="inputNgayCapCCCD"
								placeholder="Ngày cấp CMND/CCCD"
								value="<c:out value='${hoso.ngayCapCCCD}'/>">
						</div>
					</div>
					<div class="row gx-3 mb-3">
						<div class="col-md-6">
							<label class="small mb-1" for="inputMSThue">Mã số thuế</label> <input
								class="form-control" id="inputMSThue" name="inputMSThue"
								type="text" placeholder=""
								value="<c:out value='${hoso.maSoThue}'/>">
						</div>
						<div class="col-md-6">
							<label class="small mb-1" for="inputNgayCapMSThue">Ngày
								cấp mã số thuế</label> <input class="form-control"
								id="inputNgayCapMSThue" name="inputNgayCapMSThue" type="date"
								placeholder="" value="<c:out value='${hoso.ngayCapMST}'/>">
						</div>
					</div>

					<div class="row gx-3 mb-3">
						<div class="col-md-6">
							<label class="small mb-1" for="cbbTrinhDoHV">Trình độ học
								vấn</label> <label class="small mb-1" for="cbbTrinhDoHV">Trình
								độ học vấn</label> <select class="form-control" id="cbbTrinhDoHV"
								name="cbbTrinhDoHV">
								<option value="tieuhoc"
									<c:if test="${hoso.trinhDoHocVan eq 'tieuhoc'}">selected</c:if>>Tiểu
									học</option>
								<option value="trunghoc"
									<c:if test="${hoso.trinhDoHocVan eq 'trunghoc'}">selected</c:if>>Trung
									học</option>
								<option value="thpt"
									<c:if test="${hoso.trinhDoHocVan eq 'thpt'}">selected</c:if>>Trung
									học phổ thông</option>
								<option value="caodang"
									<c:if test="${hoso.trinhDoHocVan eq 'caodang'}">selected</c:if>>Cao
									đẳng</option>
								<option value="daihoc"
									<c:if test="${hoso.trinhDoHocVan eq 'daihoc'}">selected</c:if>>Đại
									học</option>
								<option value="thacsi"
									<c:if test="${hoso.trinhDoHocVan eq 'thacsi'}">selected</c:if>>Thạc
									sĩ</option>
								<option value="tiensi"
									<c:if test="${hoso.trinhDoHocVan eq 'tiensi'}">selected</c:if>>Tiến
									sĩ</option>
								<option value="phogiaosu"
									<c:if test="${hoso.trinhDoHocVan eq 'phogiaosu'}">selected</c:if>>Phó
									giáo sư</option>
								<option value="giangvien"
									<c:if test="${hoso.trinhDoHocVan eq 'giangvien'}">selected</c:if>>Giáo
									sư</option>
							</select>
						</div>
						<div class="col-md-6">
							<label class="small mb-1" for="inputTrinhDoVH">Trình độ
								văn hóa</label> <select class="form-control" id="inputTrinhDoVH"
								name="inputTrinhDoVH">
								<option value="cap1"
									${hoso.trinhDoVanHoa eq 'cap1' ? 'selected' : ''}>5/12</option>
								<option value="cap2"
									${hoso.trinhDoVanHoa eq 'cap2' ? 'selected' : ''}>10/12</option>
								<option value="cap3"
									${hoso.trinhDoVanHoa eq 'cap3' ? 'selected' : ''}>12/12</option>
							</select>
						</div>

					</div>

					<div class="mb-3">
						<label class="small mb-1" for="inputEmailCN">Email cá nhân</label>
						<input class="form-control" id="inputEmailCN" name="inputEmailCN"
							type="email" placeholder=""
							value="<c:out value='${hoso.emailCaNhan}'/>">
					</div>
					<div class="d-flex justify-content-end">
						<button type="submit" class="btn btn-primary">Xác nhận</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script src="<%=duongDanHoSo%>/js/api_tinhthanh.js"></script>
