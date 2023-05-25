<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>과목 추가</h1>
		<form action = "<%=request.getContextPath() %>/subject/addSubjectAction.jsp">
			<table class="table">
				<tr>
					<td>과목 이름</td>
					<td><input class="form-control" type ="text" name="subjectName"></td>
				</tr>
				<tr>
					<td>과목 시간</td>
					<td><input class="form-control" type ="number" name="subjectTime"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-secondary" type="submit">전송</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>