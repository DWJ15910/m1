<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 추가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	th{
		vertical-align: middle;
		width: 200px;
	}
</style>
</head>
<body>
	<!-- 메인메뉴 (가로) -->
	<div>
		<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	</div>
	
	<div style ="background-color: grey; height:100%;">
		<div style="background-color: #FFFFFF; height:800px" class="container">
			<form action="<%=request.getContextPath()%>/teacher/addTeacherAction.jsp">
			
				<!-- 강사 추가 페이지 제목 -->
				<h1 style="height: 100px; display: flex; align-items: center;">강사 추가</h1>
				
				<!-- 메시지 출력 -->
				<div style="color: red;">
					<%
						if(request.getParameter("msg") != null){
					%>
							<div><%=request.getParameter("msg") %></div>
					<%
						}
					%>
				</div>
				
				<!-- 강사 추가 테이블 폼 -->
				<table class="table">
					<tr>
						<th>강사 아이디</th>
						<td><input class="form-control" type ="text" name="teacherId" required="required"></td>
					</tr>
					<tr>
						<th>강사 이름</th>
						<td><input class="form-control" type ="text" name="teacherName" required="required"></td>
					</tr>
					<tr>
						<th>강사 기록</th>
						<td><input class="form-control" type ="text" name="teacherHistory" required="required"></td>
					</tr>
				</table>
				<button style="float: right;" class="btn btn-secondary" type="submit">추가</button>
			</form>
		</div><!-- /container -->
	</div><!-- /grey -->
	
	<!-- copyright -->
	<div>
		<jsp:include page="/inc/copyright.jsp"></jsp:include>
	</div>
</body>
</html>