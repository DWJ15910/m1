<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	// TeacherSubjectDao클래스에서 1)강사리스트 출력 메서드 사용
	TeacherSubjectDao teacherDao = new TeacherSubjectDao();
	ArrayList<HashMap<String,Object>> list = teacherDao.selTeacherCnt();
	
	// TeacherSubjectDao클래스에서 2)과목 리스트 출력 메서드 사용
	TeacherSubjectDao subjectDao = new TeacherSubjectDao();
	ArrayList<HashMap<String,Object>> list2 = subjectDao.setSubjectCnt();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당과목 추가</title>
<style>
	th{
		vertical-align: middle;
		width: 200px;
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
			<form action="addTeacherSubjectAction.jsp">
			
				<!-- 강사 리스트 제목 -->
				<h1 style="height: 100px; display: flex; align-items: center;">담당과목 추가</h1>
						
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
			
				<!-- 담당과목 추가 테이블 -->
				<table class="table">
					<tr>	
						<th>강사 이름</th>
						<td>
							<select name="teacherNo" class="form-select">
							<%
								for(HashMap<String,Object> m : list){
							%>
								<option value="<%=m.get("강사번호")%>"><%=(String)m.get("강사이름") %></option>
							<%
								}
							%>
							</select>
						</td>
					</tr>
					<tr>	
						<th>과목 이름</th>
						<td>
							<select name="subjectNo" class="form-select">
								<%
									for(HashMap<String,Object> m2 : list2){
								%>
									<option value="<%=m2.get("과목번호")%>"><%=(String)m2.get("과목이름") %></option>
								<%
									}
								%>
							</select>
						</td>
					</tr>
				</table>
				<button style="float: right;" class="btn btn-secondary" type="submit">추가</button>
			</form>
		</div><!--/container -->
	</div><!-- /grey -->
	
	<!-- copyright -->
	<div>
		<jsp:include page="/inc/copyright.jsp"></jsp:include>
	</div>
</body>
</html>