<%@include file="include/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<section>
  <div class="container">
    <div class="row flex-lg-row-reverse align-items-center g-5 mt-2 py-5">
      <div class="col-lg-10 col-xl-9 mx-auto">
          <div class="card-img-left-signup d-none d-md-flex">
          </div>
          <br>
          <div class="card-body p-2 p-sm-3">
            <h5 class="card-title text-center mb-2 fw-light h2 fw-bold">Đăng Ký</h5>
            <h6 class="card-title text-center mb-2 fw-light h2 fw-bold">Vui lòng nhập toàn bộ thông tin để đăng ký</h6>
            <br />
            <form action="signUpServlet" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
              <input type="hidden" name="action2" value="shippingRegister">
              <div class="form-floating mb-3">
                <%--@declare id="firstname"--%><input type="text" class="form-control" id="fistName" name="firstName" placeholder="Họ" required autofocus>
                <label for="firstName">First Name:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="middleName" name="middleName" placeholder="Tên đêm">
                <label for="middleName">Middle Name:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Tên" required autofocus>
                <label for="lastName">Last Name:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="number" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Số điện thoại" required autofocus>
                <label for="phoneNumber">Số điện thoại</label>
              </div>

              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required autofocus>
                <label for="password">Mật khẩu</label>
              </div>

              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="floatingPasswordConfirm" name="passwordConfirm" placeholder="Xác nhận mật khẩu" required autofocus>
                <label for="floatingPasswordConfirm">Xác nhận mật khẩu</label>
              </div>

              <div class="form-floating mb-3">
                <input type="email" id="email" name="email" class="form-control" placeholder="email" required autofocus>
                <label for="email" class="label">Email:</label>
                <small class="form-text hint-text">Vui lòng nhập địa chỉ email hợp lệ (ví dụ: example@gmail.com).</small>
              </div>

              <div class="form-floating mb-3">
                <select id="sex" name="sex" class="form-control" required autofocus>
                  <option value="">-- Select an option --</option>
                  <c:forEach items="${listSex}" var="option">
                    <option value="${option.sign}"><c:out value="${option.gender}"/></option>
                  </c:forEach>
                </select>
                <label for="sex" class="label">Sex:</label>
              </div>

              <div class="form-floating mb-3">
                <select id="idTypeVehicle" name="idTypeVehicle" class="form-control" required autofocus>
                  <option value="">-- Select an option --</option>
                  <c:forEach items="${listType}" var="option">
                    <option value="${option.idTypeVehicle}"><c:out value="${option.nameTablePermission}"/></option>
                  </c:forEach>
                </select>
                <label for="idTypeVehicle" class="label">Type Vehicle:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" placeholder="Ngày Sinh" required autofocus>
                <label for="dateOfBirth" class="form-label">Ngày Sinh:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="number" class="form-control" id="cccd" name="cccd" placeholder="Căn cước công dân" required autofocus>
                <label for="cccd">CCCD:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageSelfie" name="imageSelfie" accept="image/*" placeholder="Hình Selfie" required autofocus>
                <label for="imageSelfie">Image Selfie:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageCccdFront" name="imageCccdFront" accept="image/*" placeholder="Hình CCCD mặt trước" required autofocus>
                <label for="imageCccdFront">Image CCCD Front:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageCccdBack" name="imageCccdBack" accept="image/*" placeholder="Hình CCCD mặt sau" required autofocus>
                <label for="imageCccdBack">Image CCCD Back:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageDriverLicense" name="imageDriverLicense" accept="image/*" placeholder="Hình bằng lái xe mặt trước" required autofocus>
                <label for="imageDriverLicense">Image Driver License:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageVehicleRegistration" name="imageVehicleRegistration" accept="image/*" placeholder="Hình cavet xe" required autofocus>
                <label for="imageVehicleRegistration">Image Vehicle Registration:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageCurriculumVitae" name="imageCurriculumVitae" accept="image/*" placeholder="Hình sơ yếu lý lịch" required autofocus>
                <label for="imageCurriculumVitae">Image Curriculum Vitae:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageCivilGuaranteeLetter" name="imageCivilGuaranteeLetter" accept="image/*" placeholder="hình ảnh giấy bảo lãnh dân sự" required autofocus>
                <label for="imageCivilGuaranteeLetter">Image Civil Guarantee Letter:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageCertificateOfNoCriminalRecord" name="imageCertificateOfNoCriminalRecord" accept="image/*" placeholder="hình ảnh giấy xác nhận không có tiền án, tiền sự" required autofocus>
                <label for="imageCertificateOfNoCriminalRecord">Image Certificate Of No Criminal Record:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageBirthCertificate" name="imageBirthCertificate" accept="image/*" placeholder="hình ảnh giấy khai sinh" required autofocus>
                <label for="imageBirthCertificate">Image Birth Certificate:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageHouseholdRegistration" name="imageHouseholdRegistration" accept="image/*" placeholder="hình ảnh sổ hộ khẩu" required autofocus>
                <label for="imageHouseholdRegistration">Image Household Registration:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageHealthExaminationCertificate" name="imageHealthExaminationCertificate" accept="image/*" placeholder="hình ảnh giấy khám sức khoẻ" required autofocus>
                <label for="imageHealthExaminationCertificate">Image Health Examination Certificate:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageVehicleFront" name="imageVehicleFront" accept="image/*" placeholder="hình ảnh phương tiện ( phía trước )" required autofocus>
                <label for="imageVehicleFront">Image Vehicle Front:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageVehicleLeft" name="imageVehicleLeft" accept="image/*" placeholder="hình ảnh phương tiện ( bên trái )" required autofocus>
                <label for="imageVehicleLeft">Image Vehicle Left:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageVehicleRight" name="imageVehicleRight" accept="image/*" placeholder="hình ảnh phương tiện ( bên phải )" required autofocus>
                <label for="imageVehicleRight">Image Vehicle Right:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="file" class="form-control" id="imageVehicleBehind" name="imageVehicleBehind" accept="image/*" placeholder="hình ảnh phương tiện ( phía sau )" required autofocus>
                <label for="imageVehicleBehind">Image Vehicle Behind:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="number" class="form-control" id="length" name="length" placeholder="chiều dài thùng hàng ( cm )" required autofocus>
                <label for="length">Container Length</label>
              </div>

              <div class="form-floating mb-3">
                <input type="number" class="form-control" id="width" name="width" placeholder="chiều rộng thùng hàng ( cm )" required autofocus>
                <label for="width">Container width</label>
              </div>

              <div class="form-floating mb-3">
                <input type="number" class="form-control" id="height" name="height" placeholder="chiều cao thùng hàng ( cm )" required autofocus>
                <label for="height">Container Height</label>
              </div>

              <div class="form-floating mb-3">
                <input type="number" class="form-control" id="weight" name="weight" placeholder="Cân nặng có thể vận chuyển" required autofocus>
                <label for="weight">Transportable Weight</label>
              </div>

              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="licensePlate" name="licensePlate" placeholder="Biển số xe" required autofocus>
                <label for="licensePlate">license Plate:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="apartmentNumber" name="apartmentNumber" placeholder="Số nhà, Kiệt" required autofocus>
                <label for="apartmentNumber">Số nhà, Kiệt:</label>
              </div>

              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="streetName" name="streetName" placeholder="Tên Đường" required autofocus>
                <label for="streetName">Tên Đường:</label>
              </div>

              <div class="form-floating mb-3">
                <select id="provinces" onchange="getDistricts()" name="district" class="form-control" required autofocus>
                  <option value="">Chọn Tỉnh/Thành phố</option>
                </select>
              </div>

              <div class="form-floating mb-3">
                <select id="districts" onchange="getWards()" name="ward" class="form-control" required autofocus>
                  <option value="">Chọn Quận/Huyện</option>
                </select>
              </div>

              <div class="form-floating mb-3">
                <select id="wards" name="city" class="form-control" required autofocus>
                  <option value="">Chọn Xã/Phường</option>
                </select>
              </div>

              <div class="d-grid mb-2">
                <button class="btn btn-lg btn-primary btn-login fw-bold text-uppercase" type="submit">Đăng kí</button>
              </div>

              <a class="d-block text-center mt-2 small" href="login.jsp">Bạn đã có tài. Đăng Nhập</a>
              <br />
              <hr class="my-2">
              <br />
            </form>
          </div>
      </div>
    </div>
  </div>
  <script src="js/font-awesome-free-5.14.0.js"></script>
</section>
<script src='js/main.js'></script>
<script>
  function validateForm() {
    var selectedOption = document.getElementById("sex").value;
    if (selectedOption === "") {
      alert("Please select an option");
      return false; // Ngăn form được gửi đi
    }
    return true; // Cho phép form được gửi đi
  }
</script>
<script>
  document.getElementById('passwordConfirm').addEventListener('input', function () {
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('passwordConfirm').value;

    if (password === confirmPassword) {
      document.getElementById('passwordConfirm').setCustomValidity('');
    } else {
      document.getElementById('passwordConfirm').setCustomValidity('Xác nhận mật khẩu phải giống với mật khẩu đã nhập.');
    }
  });
</script>

</html>
<%@ include file="/include/footer.jsp" %>