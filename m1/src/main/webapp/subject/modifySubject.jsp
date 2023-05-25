<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	if(request.getParameter("subjectNo")==null
	||request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	SubjectDao subjectDao = new SubjectDao();
    Subject subject = subjectDao.selectSubjectOne(subjectNo);
%>
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
		<h1>과목 상세 및 수정페이지</h1>
		<form action="<%=request.getContextPath() %>/subject/modifySubjectAction.jsp">
			<table class="table">
				<tr>
					<td>과목 번호</td>
					<td><input class="form-control" type ="number" name="subjectNo" readonly="readonly" value="<%=subject.getSubjectNo()%>"></td>
				</tr>
				<tr>
					<td>과목 이름</td>
					<td><input class="form-control" type ="text" name="subjectName" value="<%=subject.getSubjectName() %>"></td>
				</tr>
				<tr>
					<td>과목 시간</td>
					<td><input class="form-control" type ="number" name="subjectTime" value="<%=subject.getSubjectTime() %>"></td>
					
				</tr>
				<tr>
					<td>최초 작성 시간</td>
					<td><input class="form-control" type ="text" name="createdate" readonly="readonly" value="<%=subject.getCreatedate()%>"></td>
				</tr>
				<tr>
					<td>마지막 수정 시간</td>
					<td><input class="form-control" type ="text" name="updatedate" readonly="readonly" value="<%=subject.getUpdatedate()%>"></td>
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