<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	if(request.getParameter("subjectName")==null
	||request.getParameter("subjectTime")==null
	||request.getParameter("subjectNo")==null
	||request.getParameter("subjectName").equals("")
	||request.getParameter("subjectTime").equals("")
	||request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}

	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	subject.setSubjectNo(subjectNo);
	
	SubjectDao modify = new SubjectDao();
	int row = modify.updateSubject(subject);
	
	if(row==1){
		System.out.println("subject수정 성공");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}else{
		System.out.println("subject수정 실패");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	
%>