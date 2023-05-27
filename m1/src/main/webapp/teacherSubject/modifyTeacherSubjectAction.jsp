<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	if(request.getParameter("teacherSubjectNo")==null
	||request.getParameter("teacherNo")==null
	||request.getParameter("subjectNo")==null
	||request.getParameter("teacherSubjectNo").equals("")
	||request.getParameter("teacherNo").equals("")
	||request.getParameter("subjectNo").equals("")){
		System.out.println("modifyTeacherAction NULL값 받아옴");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
	
	int teacherSubjectNo = Integer.parseInt(request.getParameter("teacherSubjectNo"));
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));

	
	TeacherSubject ts = new TeacherSubject();
	ts.setTeacherSubjectNo(teacherSubjectNo);
	ts.setTeacherNo(teacherNo);
	ts.setSubjectNo(subjectNo);
	
	//TeacherSubjectDao 4번 강사-과목 수정 사용
	TeacherSubjectDao updateTsDao = new TeacherSubjectDao();
	int row = updateTsDao.updateTeacherSubject(ts);
	
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