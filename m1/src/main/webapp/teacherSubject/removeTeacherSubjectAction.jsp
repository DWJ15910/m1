<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	//유효성 검사
	if(request.getParameter("teacherSubjectNo")==null
		||request.getParameter("teacherSubjectNo").equals("")){
		
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}

	//teacherSubjectOne.jsp 에서 값 받아오기
	int teacherSubjectNo = Integer.parseInt(request.getParameter("teacherSubjectNo"));

	// dao/TeacherSubjectDao.java/8번 TS삭제
	TeacherSubjectDao removeTSDao = new TeacherSubjectDao();
	int row = removeTSDao.removeTS(teacherSubjectNo);
	
	//디버깅
	if(row==1){
		System.out.println("TS 테이블 삭제성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	} else {
		System.out.println("TS 테이블 삭제실패");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
%>