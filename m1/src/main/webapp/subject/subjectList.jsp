<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	int startRow = 0;
	int rowPerPage = 10;
	SubjectDao subjectDao = new SubjectDao();
	ArrayList<Subject> list = subjectDao.selectSubjectListByPage(startRow, rowPerPage);
	
	SubjectDao totalRowDao = new SubjectDao();
	int row = totalRowDao.selectSubjectCnt();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>과목 리스트</h1>
		<h3>전체 행 갯수: <%=row %></h3>
		<table class="table table-hover">
			<tr>
				<th>과목번호</th>
				<th>과목이름</th>
				<th>과목시간</th>
				<th>CREATEDATE</th>
				<th>UPDATEDATE</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
				for(Subject s : list){
			%>
			<tr>
				<th><%=s.getSubjectNo()%></th>
				<th><%=s.getSubjectName()%></th>
				<th><%=s.getSubjectTime()%></th>
				<th><%=s.getCreatedate()%></th>
				<th><%=s.getUpdatedate()%></th>
				<th><a class="btn btn-secondary" href="<%=request.getContextPath() %>/subject/modifySubject.jsp?subjectNo=<%=s.getSubjectNo()%>">수정</a></th>
				<th><a class="btn btn-secondary" href="<%=request.getContextPath() %>/subject/removeSubjectAction.jsp?subjectNo=<%=s.getSubjectNo()%>">삭제</a></th>
			</tr>
			<%
				}
			%>
		</table>
		<a class="btn btn-secondary" href="<%=request.getContextPath() %>/subject/addSubject.jsp">과목추가</a>
	</div>
</body>
</html>