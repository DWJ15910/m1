<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	int currentPage = 1;

	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println("home.currentPage 유효성검사 실패");
	}
	
	int rowPerPage = 10;
	int startRow = (currentPage-1)*rowPerPage;
	
	
	
	SubjectDao subjectDao = new SubjectDao();
	ArrayList<Subject> list = subjectDao.selectSubjectListByPage(startRow, rowPerPage);
	
	SubjectDao totalRowDao = new SubjectDao();
	int row = totalRowDao.selectSubjectCnt();
	
	int lastPage = row/rowPerPage;
	if(row%rowPerPage!=0){
		lastPage++;
	}
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
		
		<!-- 페이징 설정 -->
		<div style="text-align: center">
		<%
			int startPage = ((currentPage-1)/10)*10+1;
			int endPage = Math.min(startPage+9,lastPage);
			
			if(startPage>10){
		%>
				<a class="btn btn-secondary" href="<%=request.getContextPath()%>/home.jsp?currentPage=<%=startPage-10%>">이전</a>
		<%
			}
			for(int i = startPage; i<=endPage; i++){				
		%>
				<a class="<%=currentPage==i ? "btn btn-primary":"btn btn-secondary"%>" href=""><%=i %></a>
		<%
			}
			if(endPage<lastPage){
		%>
				<a class="btn btn-secondary" href="<%=request.getContextPath()%>/home.jsp?currentPage=<%=endPage+1%>">다음</a>
		<%
			}
		%>
		</div>
	</div>
</body>
</html>