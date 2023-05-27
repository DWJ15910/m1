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
		
		//과정 리스트
		TeacherSubjectDao selTeacherSubject = new TeacherSubjectDao();
		ArrayList<HashMap<String,Object>> list = selTeacherSubject.selTeacherSubject(teacherNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<%
			for(HashMap<String,Object> m : list){
		%>
			<tr>
				<th><%=m.get("과정번호") %></th>
				<th><%=m.get("과목이름") %></th>
				<td><a href="<%=request.getContextPath()%>/teacherSubject/modifyTeacherSubject.jsp?teacherSubjectNo=<%=m.get("과정번호") %>">수정</a></td>
				<td><a href="<%=request.getContextPath()%>/teacherSubject/removeTeacherSubjectAction.jsp?teacherSubjectNo=<%=m.get("과정번호") %>">삭제</a></td>
			</tr>
		<%
			}
		%>
	</table>
</body>
</html>