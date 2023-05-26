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
		<form action="<%=request.getContextPath() %>/teacher/modifyTeacherAction.jsp">
			<table class="table">
				<tr>
					<td>강사번호</td>
					<td><input type="number" name="teacherNo" readonly="readonly" value="<%=teacher.getTeacherNo()%>"></td>
				</tr>
				<tr>
					<td>강사 아이디</td>
					<td><input type="text" name="teacherId" value="<%=teacher.getTeacherId() %>"></td>
				</tr>
				<tr>
					<td>강사 이름</td>
					<td><input type="text" name="teacherName" value="<%=teacher.getTeacherName() %>"></td>
				</tr>
				<tr>
					<td>강사 기록</td>
					<td><input type="text" name="teacherHistory" value="<%=teacher.getTeacherHistory() %>"></td>
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
					<td colspan="2">
						<button type="submit">수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>