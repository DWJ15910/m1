<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));

	TeacherDao teacherone = new TeacherDao();
	Teacher teacher = teacherone.selectTeacherOne(teacherNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>과목 상세 및 수정페이지</h1>
		<form action="<%=request.getContextPath() %>/subject/modifySubjectAction.jsp">
			<table class="table">
				<tr>
					<td>강사번호</td>
					<td><%=teacher.getTeacherNo() %></td>
				</tr>
				<tr>
					<td>강사 아이디</td>
					<td><%=teacher.getTeacherId() %></td>
				</tr>
				<tr>
					<td>강사 이름</td>
					<td><%=teacher.getTeacherName() %></td>
				</tr>
				<tr>
					<td>강사 기록</td>
					<td><%=teacher.getTeacherHistory() %></td>
				</tr>
				<tr>
					<td>최초 작성 시간</td>
					<td><%=teacher.getCreatedate()%></td>
				</tr>
				<tr>
					<td>마지막 수정 시간</td>
					<td><%=teacher.getUpdatedate()%></td>
				</tr>
				<tr>
					<td>담당과목</td>
					<td>
						<%
							if(teacher.getSubject().equals("없음")){
						%>
								<%=teacher.getSubject()%>
						<%
							}else{
						%>
								<a href="<%=request.getContextPath() %>/teacherSubject/teacherSubjectOne.jsp?teacherNo=<%=teacher.getTeacherNo() %>">
									<%=teacher.getSubject()%>
								</a>
						<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="<%=request.getContextPath() %>/teacher/modifyTeacher.jsp?teacherNo=<%=teacher.getTeacherNo() %>">수정</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="<%=request.getContextPath() %>/teacher/removeTeacherAction.jsp?teacherNo=<%=teacher.getTeacherNo() %>">삭제</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>