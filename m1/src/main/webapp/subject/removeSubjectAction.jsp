<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	if(request.getParameter("subjectNo")==null
	||request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	SubjectDao remove = new SubjectDao();
	int row = remove.deleteSubject(subjectNo);
	
	if(row==1){
		System.out.println("subject삭제 성공");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}else{
		System.out.println("subject삭제 실패");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
%>