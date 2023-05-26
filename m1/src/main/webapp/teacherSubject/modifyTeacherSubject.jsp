<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	if(request.getParameter("teacherSubjectNo")==null
	||request.getParameter("teacherSubjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}

	int teacherSubjectNo = Integer.parseInt(request.getParameter("teacherSubjectNo"));
	
	//과정 리스트
	TeacherSubjectDao selUpdateList = new TeacherSubjectDao();
	TeacherSubject teachersubject = selUpdateList.selUpdateList(teacherSubjectNo);
	
	TeacherSubjectDao subjectDao = new TeacherSubjectDao();
	ArrayList<HashMap<String,Object>> list2 = subjectDao.setSubjectCnt();
	
	TeacherSubjectDao teacherNameDao = new TeacherSubjectDao();
	ArrayList<HashMap<String,Object>> list = teacherNameDao.selTeacherOne(teacherSubjectNo);
	

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
		<form action="<%=request.getContextPath() %>/teacherSubject/modifyTeacherSubjectAction.jsp">
			<table>
				<input type ="hidden" name="teacherNo" value="<%=teachersubject.getTeacherNo()%>">
				<tr>
					<th>과정번호</th>
					<td><input type="number" name="teacherSubjectNo" value="<%=teachersubject.getTeacherSubjectNo()%>" readonly="readonly"></td>
				</tr>
				<tr>	
					<th>강사 이름</th>
						<%
							for(HashMap<String,Object> m : list){
						%>
							<td>
								<%=(String)m.get("강사이름") %>
							</td>
						<%
							}
						%>
				</tr>
				<tr>	
					<th>과목 이름</th>
					<td>
						<select name="subjectNo">
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
				<tr>
					<th>생성일</th>
					<td><%=teachersubject.getCreatedate()%></td>
				</tr>
				<tr>
					<th>수정일</th>
					<td><%=teachersubject.getUpdatedate()%></td>
				</tr>
			</table>
			<button type="submit">수정</button>
		</form>
	</div>
</body>
</html>