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
	
	// modifyTeacherSubject에서 받아온 값 유효성 검사
	if(request.getParameter("teacherSubjectNo")==null
		||request.getParameter("teacherNo")==null
		||request.getParameter("subjectNo")==null
		||request.getParameter("teacherSubjectNo").equals("")
		||request.getParameter("teacherNo").equals("")
		||request.getParameter("subjectNo").equals("")){
		
		System.out.println("modifyTeacherSubjectAction Null값 있음");
		msg="값을 입력해 주시기 바랍니다";
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 값 받아오기
	int teacherSubjectNo = Integer.parseInt(request.getParameter("teacherSubjectNo"));
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));

	
	// 과목 수정을 위해 ? 값을 받아서 teacher변수에 저장
	TeacherSubject ts = new TeacherSubject();
	ts.setTeacherSubjectNo(teacherSubjectNo);
	ts.setTeacherNo(teacherNo);
	ts.setSubjectNo(subjectNo);
	// TeacherSubjectDao 4번 강사-과목 수정 사용
	TeacherSubjectDao updateTsDao = new TeacherSubjectDao();
	int row = updateTsDao.updateTeacherSubject(ts);
	
	// row 분기 설정
	if(row==1){
		System.out.println("담당과목 변경 성공");
		msg = URLEncoder.encode("담당과목 변경 성공","utf-8");
		response.sendRedirect(request.getContextPath()+"/teacherSubject/teacherSubjectOne.jsp?teacherNo="+teacherNo+"&msg=" + msg);
		return;
	}else{
		System.out.println("담당과목 변경 실패");
		msg = URLEncoder.encode("담당과목 변경 실패","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
%>