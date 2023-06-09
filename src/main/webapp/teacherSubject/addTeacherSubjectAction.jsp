<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	
	// 메세지 출력 설정
	String msg = null;
	
	// addTeacherSubject.jsp 에서 받아온 값 유효성 검사
	if(request.getParameter("teacherNo")==null
		||request.getParameter("subjectNo")==null
		||request.getParameter("teacherNo").equals("")
		||request.getParameter("subjectNo").equals("")){
		
		System.out.println("addTeacherSubject Null값 있음");
		msg="값을 입력해 주시기 바랍니다";
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 받아온 값 넣기
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	// 클래스에 변수 선언 후 변수에 받아온 값 넣기
	TeacherSubject ts = new TeacherSubject();
	ts.setTeacherNo(teacherNo);
	ts.setSubjectNo(subjectNo);
	// TeacherSubject.java 3번 TS테이블 추가
	TeacherSubjectDao addTeacherSubject = new TeacherSubjectDao();
	int row = addTeacherSubject.addTeacherSubject(ts);
	
	// row값 분기 테스트
	if(row==1){
		System.out.println("담당과목 추가 성공");
		msg = URLEncoder.encode("담당과목 추가 성공","utf-8");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp?msg=" + msg);
		return;
	}else{
		System.out.println("담당과목 추가 실패");
		msg = URLEncoder.encode("담당과목 추가 실패","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
%>