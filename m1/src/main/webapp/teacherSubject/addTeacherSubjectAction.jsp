<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	TeacherSubject ts = new TeacherSubject();
	ts.setTeacherNo(teacherNo);
	ts.setSubjectNo(subjectNo);
	
	TeacherSubjectDao addTeacherSubject = new TeacherSubjectDao();
	int row = addTeacherSubject.addTeacherSubject(ts);
	
	if(row==1){
		System.out.println("과정 추가 성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}else{
		System.out.println("과정 추가 실패");
		response.sendRedirect(request.getContextPath()+"/teacherSubject/addTeacherSubject.jsp");
		return;
	}
%>