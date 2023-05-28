<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");

	// 상태 메세지 변수 선언
	String msg = null;

	// addTeacher.jsp 에서 오는 값 유효성 검사
	if(request.getParameter("teacherId")==null
		||request.getParameter("teacherName")==null
		||request.getParameter("teacherHistory")==null
		||request.getParameter("teacherId").equals("")
		||request.getParameter("teacherName").equals("")
		||request.getParameter("teacherHistory").equals("")){
	
		System.out.println("addTeacher Null값 있음");
		msg = URLEncoder.encode("값을 입력해 주시기 바랍니다","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 값 받아오기
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	// 클래스 변수 선언 후 받아온 값 set
	Teacher teacher = new Teacher();
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	// TeacherDao 클래스 3) 강사추가 메서드 사용
	TeacherDao addTeacher = new TeacherDao();
	int row = addTeacher.addTeacher(teacher);
	
	// row값 분기 설정
	if(row==1){
		System.out.println("강사 추가 성공");
		msg = URLEncoder.encode("강사 추가 성공","utf-8");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp?msg=" + msg);
		return;
	}else{
		//실패시 이전 페이지 이동
		System.out.println("강사 추가 실패");
		msg = URLEncoder.encode("강사 추가 실패","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
%>