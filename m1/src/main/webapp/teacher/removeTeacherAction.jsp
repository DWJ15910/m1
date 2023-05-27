<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");

	// 메시지 변수 선언
	String msg = null;
	
	// teacherOne에서 받아온 값 유효성 검사
	if(request.getParameter("teacherNo")==null
	||request.getParameter("teacherNo").equals("")){
		
		System.out.println("removeTeacher Null값 있음");
		msg = URLEncoder.encode("값을 입력해 주시기 바랍니다","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 값 받아오기
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// TeacherDao 클래스 5) 강사 삭제 사용
	TeacherDao removeTeacher = new TeacherDao();
	int row = removeTeacher.deleteTeacher(teacherNo);
	
	// row 분기문 설정
	if(row==1){
		System.out.println("강사 삭제 성공");
		msg = URLEncoder.encode("강사 삭제 성공","utf-8");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp?msg=" + msg);
		return;
	}else{
		System.out.println("강사 삭제 실패");
		msg = URLEncoder.encode("강사 삭제 실패","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
%>