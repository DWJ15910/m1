<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%
	// 메세지 변수 선언
	String msg = null;

	// teacherOne 유효성 검사
	if(request.getParameter("teacherNo")==null
		||request.getParameter("teacherNo").equals("")){
		
		System.out.println("teacherOne Null값 있음");
		msg = URLEncoder.encode("강사번호 데이터 오류","utf-8");
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
<title>강사 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- 메인메뉴 (가로) -->
	<div>
		<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	</div>
	<div style ="background-color: grey; height:100%;">
		<div style="background-color: #FFFFFF; height:800px" class="container">
			<form action="<%=request.getContextPath() %>/subject/modifySubjectAction.jsp">
			
				<!-- 강사 상세페이지 제목 -->
				<h1 style="height: 100px; display: flex; align-items: center;">강사 상세 정보</h1>
				
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
			
				<!-- 강사 상세페이지 테이블 -->
				<table class="table">
					<tr>
						<th style="width:200px;">강사번호</th>
						<td><%=teacher.getTeacherNo() %></td>
					</tr>
					<tr>
						<th>강사 아이디</th>
						<td><%=teacher.getTeacherId() %></td>
					</tr>
					<tr>
						<th>강사 이름</th>
						<td><%=teacher.getTeacherName() %></td>
					</tr>
					<tr>
						<th>강사 기록</th>
						<td><%=teacher.getTeacherHistory() %></td>
					</tr>
					<tr>
						<th>최초 작성 시간</th>
						<td><%=teacher.getCreatedate()%></td>
					</tr>
					<tr>
						<th>마지막 수정 시간</th>
						<td><%=teacher.getUpdatedate()%></td>
					</tr>
					<tr>
						<th>담당과목</th>
						<td><%=teacher.getSubject()%></td>
					</tr>
				</table>
				<!-- 수정,삭제,담당과목수정 이동 버튼 -->
				<a class="btn btn-secondary" href="<%=request.getContextPath() %>/teacher/modifyTeacher.jsp?teacherNo=<%=teacher.getTeacherNo() %>">수정</a>
				<a class="btn btn-secondary" href="<%=request.getContextPath() %>/teacher/removeTeacherAction.jsp?teacherNo=<%=teacher.getTeacherNo() %>">삭제</a>
				<a class="btn btn-secondary" href="<%=request.getContextPath() %>/teacherSubject/teacherSubjectOne.jsp?teacherNo=<%=teacher.getTeacherNo() %>">담당과목 관리</a>
			</form>
		</div><!-- /container -->
	</div><!-- /grey -->
	
	<!-- copyright -->
	<div>
		<jsp:include page="/inc/copyright.jsp"></jsp:include>
	</div>
</body>
</html>