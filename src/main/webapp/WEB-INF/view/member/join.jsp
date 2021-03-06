<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/css/member/info.css" type="text/css" rel="stylesheet" />
<script src="/js/member/join.js" type="text/javascript"></script>

<section class="main-container">
	<div class="content-box  join-container">

		<h3 class="title">회원 가입</h3>
		<form action="join" name="member" method="post" class="joinForm">
			<div class="form-group">
				<div class="id-box input-box">
					<label>아이디<span class="required-text">*</span></label> <input
						type="text" name="loginId" class="loginId input w400" placeholder="영문자로 시작하는 영문자 또는 숫자  6~14자를 입력하세요."
						pattern="^[A-za-z][A-za-z0-9]{5,13}$" required >
				</div>
				<div class="pw-box input-box">
					<label>비밀번호<span class="required-text ">*</span></label> <input class="pw input w400"
						type="password" pattern="(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}$" placeholder="숫자, 영문, 특수문자를 조합한 8자리 이상의 문자를 입력하세요." required>
				</div>
				<div class="pw-box input-box">
					<label>비밀번호 확인<span class="required-text">*</span></label> <input  class="pw-conf  input w400"
						type="password" name="pw" placeholder="비밀번호 확인" required>
				</div>
				<div class="input-box">
					<label>이름<span class="required-text">*</span></label> <input  class=" input w400"
						type="text" name="name" placeholder="이름" required>
				</div>

				<div class="input-box">
					<label>닉네임<span class="required-text">*</span></label> <input
						type="text" name="nickname" class="nickname input w400" placeholder="닉네임"
						required>
				</div>


				<div class="input-box">
					<label>생년월일</label>
					<div class="birth-box">
						<input type="number" name="year" class="input w130" list="year" placeholder="2000" min="1930" max="2021">
						<datalist id="year"  onresize="50px">
							<c:forEach var="year" begin="1900" end="2021">
								<option value="${year}">${year}</option>
							</c:forEach>
						</datalist>

						<input type="number" name="month"class="input w130" list="month" pattern="[1-12]"
							placeholder="1" min="1" max="12">
						<datalist id="month">
							<c:forEach var="month" begin="1" end="12">
								<option value="${month}">${month}</option>
							</c:forEach>
						</datalist>

						<input type="number" name="day" class="input w130" list="day" placeholder="1" min="1" max="31">
						<datalist id="day">
							<c:forEach var="day" begin="1" end="31">
								<option value="${day}">${day}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>

				<div class="input-box">
					<label>성별</label>
					<div class="radio-group align-l w400">
						<input type="radio" value="man" name="gender" class="radio-item"> 남자</input>
						<input type="radio" value="girl" name="gender" class="radio-item"> 여자</input>
						<input type="radio" value="none" name="gender" class="radio-item" checked="checked"> 선택안함</input>
					</div>
				</div>

				<div class="input-box">
					<label>이메일<span class="required-text">*</span></label>
					<div class="email-box">
						<input type="text" name="emailId" placeholder="이메일"
							list="emailAddress" class="input w130" required> @ <select
							name="emailAddress" class="input w120">
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="none">직접입력</option>
						</select> <input type="text" name="customAddress" class="customAddress input w120"
							placeholder="gmail.com" disabled="true">
					</div>
				</div>

				<div class="input-box">
					<label>휴대전화<span class="required-text">*</span></label> <input
						type="text" name="phone" class="phone input w400" pattern="01[016789]\d{3,4}\d{4}"
						placeholder="01012341234" required>
				</div>
				<div class="align-r">
					<input type="text" class="phoneConfirm input"> <input class=" btn-s able confirm-btn"
						type="button" value="인증번호 발송">
				</div>


			<div class="button-area ">
				<input type="submit" value="회원가입"
					class="disabled submit-button  btn-s">
			</div>

			</div>

		</form>
	</div>
</section>