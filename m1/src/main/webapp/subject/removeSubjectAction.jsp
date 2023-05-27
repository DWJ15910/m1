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
	
	// subjectList에서 온 값 유효성 검사
	if(request.getParameter("subjectNo")==null
	||request.getParameter("subjectNo").equals("")){
		
		System.out.println("removeSubject Null값 있음");
		msg = URLEncoder.encode("값을 입력해 주시기 바랍니다","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 값 받아오기
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	// SubjectDao클래스 remove변수 선언 3) 과목삭제 사용
	SubjectDao remove = new SubjectDao();
	int row = remove.deleteSubject(subjectNo);
	
	//row 분기 설정
	if(row==1){
		System.out.println("subject삭제 성공");
		msg = URLEncoder.encode("과목 삭제 성공","utf-8");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp?msg=" + msg);
		return;
	}else{
		System.out.println("subject삭제 실패");
		msg = URLEncoder.encode("과목 삭제 실패","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
%>