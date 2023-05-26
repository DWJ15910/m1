<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	TeacherSubjectDao teacherDao = new TeacherSubjectDao();
	ArrayList<HashMap<String,Object>> list = teacherDao.selTeacherCnt();
	
	TeacherSubjectDao subjectDao = new TeacherSubjectDao();
	ArrayList<HashMap<String,Object>> list2 = subjectDao.setSubjectCnt();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="addTeacherSubjectAction.jsp">
		<h1>강사에 담당 과목 추가</h1>
		<table>
			<tr>	
				<th>강사 이름</th>
				<td>
					<select name="teacherNo">
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
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>