<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	if(request.getParameter("teacherNo")==null
	||request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
	
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	TeacherDao removeTeacher = new TeacherDao();
	int row = removeTeacher.deleteTeacher(teacherNo);
	
	if(row==1){
		System.out.println("강사 삭제 성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}else{
		System.out.println("강사 삭제 실패");
		response.sendRedirect(request.getContextPath()+"/teacher /teacherList.jsp");
		return;
	}
%>