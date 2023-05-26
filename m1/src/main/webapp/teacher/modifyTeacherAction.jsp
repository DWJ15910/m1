<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	if(request.getParameter("teacherNo")==null
	||request.getParameter("teacherId")==null
	||request.getParameter("teacherName")==null
	||request.getParameter("teacherHistory")==null
	||request.getParameter("teacherNo").equals("")
	||request.getParameter("teacherId").equals("")
	||request.getParameter("teacherName").equals("")
	||request.getParameter("teacherHistory").equals("")){
		System.out.println("modifyTeacherAction NULL값 받아옴");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
	
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	Teacher teacher = new Teacher();
	teacher.setTeacherNo(teacherNo);
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	
	TeacherDao updateTeacherDao = new TeacherDao();
	int row = updateTeacherDao.updateTeacher(teacher);
	
	if(row==1){
		System.out.println("강사 변경 성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}else{
		System.out.println("강사 변경 실패");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
%>