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
	
	// addTeacherSubject.jsp 에서 받아온 값 유효성 검사
	if(request.getParameter("subjectName")==null
		||request.getParameter("subjectTime")==null
		||request.getParameter("subjectName").equals("")
		||request.getParameter("subjectTime").equals("")){
		
		System.out.println("addSubject Null값 있음");
		msg = URLEncoder.encode("값을 입력해 주시기 바랍니다","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 값 받아오기
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	// Subject 클래스의 subject 변수 선언 후 변수에 받아온 데이터 값 set
	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	// SubjectDao 클래스에 2) 과목추가 사용
	SubjectDao insert = new SubjectDao();
	int row = insert.insertSubject(subject);
	
	// row값 분기 설정
	if(row==1){
		System.out.println("subject추가 성공");
		msg = URLEncoder.encode("과목 추가 성공","utf-8");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp?msg=" + msg);
		return;
	}else{
		System.out.println("subject추가 실패");
		msg = URLEncoder.encode("과목 추가 실패","utf-8");
		response.sendRedirect(request.getContextPath()+"/subject/addSubject.jsp?msg=" + msg);
		return;
	}
%>