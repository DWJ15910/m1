<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/teacher/addTeacherAction.jsp">
		<table class="table">
				<tr>
					<td>강사 아이디</td>
					<td><input class="form-control" type ="text" name="teacherId"></td>
				</tr>
				<tr>
					<td>강사 이름</td>
					<td><input class="form-control" type ="text" name="teacherName"></td>
				</tr>
				<tr>
					<td>강사 기록</td>
					<td><input class="form-control" type ="text" name="teacherHistory"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-secondary" type="submit">전송</button>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>