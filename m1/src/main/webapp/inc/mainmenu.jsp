<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	a{
		text-decoration: none;
		color: #000000;
		font-weight: bold;
	}
</style>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid container">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/teacher/teacherList.jsp">강사리스트</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/teacher/addTeacher.jsp">강사추가</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/subject/subjectList.jsp">과목리스트</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/subject/addSubject.jsp">과목추가</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/teacherSubject/addTeacherSubject.jsp">담당과목추가</a>
			</li>
		</ul>
	</div>
</nav>