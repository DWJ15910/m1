<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	if(request.getParameter("teacherNo")==null
		||request.getParameter("teacherNo").equals("")){
			response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
			return;
		}
	
		int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
		
		TeacherDao selTeacher = new TeacherDao();
		Teacher teacher = selTeacher.selectTeacherOne(teacherNo);
		
		//과정 리스트
		TeacherSubjectDao selTeacherSubject = new TeacherSubjectDao();
		ArrayList<HashMap<String,Object>> list = selTeacherSubject.selTeacherSubject(teacherNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당과목 상세</title>
<style>
	th{
		vertical-align: middle;
		width:200px;
	}
</style>
</head>
<body>
	<!-- 메인메뉴 (가로) -->
	<div>
		<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	</div>
	
	<div style ="background-color: grey; height:100%;">
		<div style="background-color: #FFFFFF; height:800px" class="container">
		
			<!-- 담당과목 상세리스트 제목 -->
			<h1 style="height: 100px; display: flex; align-items: center;">담당과목 상세 리스트</h1>
			
			<!-- 강사 정보 -->
			<h3 style="height: 100px; display: flex; align-items: center;">강사: <%=teacher.getTeacherName() %></h3>
			
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
			
			<!-- 담당과목 상세리스트 -->
			<table class="table table-hover">
				<thead style="background-color: grey; color:#FFFFFF;">
					<tr>
						<th>과정번호</th>
						<th>과목이름</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<%
					for(HashMap<String,Object> m : list){
				%>
					<tr>
						<th><%=m.get("과정번호") %></th>
						<th><%=m.get("과목이름") %></th>
						<td><a class="btn btn-secondary" href="<%=request.getContextPath()%>/teacherSubject/modifyTeacherSubject.jsp?teacherSubjectNo=<%=m.get("과정번호") %>">수정</a></td>
						<td><a class="btn btn-secondary" href="<%=request.getContextPath()%>/teacherSubject/removeTeacherSubjectAction.jsp?teacherSubjectNo=<%=m.get("과정번호") %>">삭제</a></td>
					</tr>
				<%
					}
				%>
			</table>
		</div><!-- /container -->
	</div><!-- /grey -->
	
	<!-- copyright -->
	<div>
		<jsp:include page="/inc/copyright.jsp"></jsp:include>
	</div>
</body>
</html>