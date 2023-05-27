<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");

	// 메시지 변수 선언
	String msg = null;
	
	// teacherOne에서 받아온 값 유효성 검사
	if(request.getParameter("teacherNo")==null
	||request.getParameter("teacherNo").equals("")){
		
		System.out.println("modifyTeacher Null값 있음");
		msg = URLEncoder.encode("값을 입력해 주시기 바랍니다","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 값 받아오기
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));

	// TeacherDao 클래스 3) 강사 상세보기 메서드 사용
	TeacherDao teacherone = new TeacherDao();
	Teacher teacher = teacherone.selectTeacherOne(teacherNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 수정</title>
</head>
<body>
	<!-- 메인메뉴 (가로) -->
	<div>
		<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	</div>
	
	<div style ="background-color: grey; height:100%;">
		<div style="background-color: #FFFFFF; height:800px" class="container">
			<form action="<%=request.getContextPath() %>/teacher/modifyTeacherAction.jsp">
			
				<!-- 강사 상세페이지 제목 -->
				<h1 style="height: 100px; display: flex; align-items: center;">강사 정보 수정</h1>
				
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
				
				<!-- 강사 수정 테이블 -->
				<table class="table">
					<tr>
						<th style="width:200px;">강사번호</th>
						<td><input class="form-control" type="number" name="teacherNo" readonly="readonly" value="<%=teacher.getTeacherNo()%>"></td>
					</tr>
					<tr>
						<th>강사 아이디</th>
						<td><input class="form-control" type="text" name="teacherId" value="<%=teacher.getTeacherId() %>" required="required"></td>
					</tr>
					<tr>
						<th>강사 이름</th>
						<td><input class="form-control" type="text" name="teacherName" value="<%=teacher.getTeacherName() %>" required="required"></td>
					</tr>
					<tr>
						<th>강사 기록</th>
						<td><input class="form-control" type="text" name="teacherHistory" value="<%=teacher.getTeacherHistory() %>" required="required"></td>
					</tr>
					<tr>
						<th>최초 작성 시간</th>
						<td><%=teacher.getCreatedate()%></td>
					</tr>
					<tr>
						<th>마지막 수정 시간</th>
						<td><%=teacher.getUpdatedate()%></td>
					</tr>
				</table>
				<button style="float: right;" class="btn btn-secondary" type="submit">수정</button>
			</form>
		</div><!-- /container -->
	</div><!-- /grey -->
	
	<!-- copyright -->
	<div>
		<jsp:include page="/inc/copyright.jsp"></jsp:include>
	</div>
</body>
</html>