<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	
	// 메세지 출력 설정
	String msg = null;
	
	// teacherSubject에서 받아온 값 유효성 검사
	if(request.getParameter("teacherSubjectNo")==null
		||request.getParameter("teacherSubjectNo").equals("")){
		
		System.out.println("removeTeacherSubjectAction Null값 있음");
		msg="값을 입력해 주시기 바랍니다";
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	//teacherSubjectOne.jsp 에서 값 받아오기
	int teacherSubjectNo = Integer.parseInt(request.getParameter("teacherSubjectNo"));

	// TeacherSubjectDao.java/8번 TS테이블 삭제 메서드 사용
	TeacherSubjectDao removeTSDao = new TeacherSubjectDao();
	int row = removeTSDao.removeTS(teacherSubjectNo);
	
	// row 디버깅
	if(row==1){
		System.out.println("담당과목 삭제 성공");
		msg = URLEncoder.encode("담당과목 삭제 성공","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	} else {
		System.out.println("담당과목 삭제실패");
		msg = URLEncoder.encode("담당과목 삭제 실패","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
%>