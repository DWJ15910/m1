<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");

	// 메시지 변수 선언
	String msg = null;
	
	// modifyTeacher에서 받아온 값 유효성 검사
	if(request.getParameter("teacherNo")==null
		||request.getParameter("teacherId")==null
		||request.getParameter("teacherName")==null
		||request.getParameter("teacherHistory")==null
		||request.getParameter("teacherNo").equals("")
		||request.getParameter("teacherId").equals("")
		||request.getParameter("teacherName").equals("")
		||request.getParameter("teacherHistory").equals("")){
		
		System.out.println("modifyTeacherAction NULL값 받아옴");
		msg = URLEncoder.encode("값을 입력해 주시기 바랍니다","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 값 받아오기
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	// Teacher 클래스에 teacher 변수 선언 후 받아온 값 set
	Teacher teacher = new Teacher();
	teacher.setTeacherNo(teacherNo);
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	// TeacherDao 클래스에 5) 강사 수정 사용
	TeacherDao updateTeacherDao = new TeacherDao();
	int row = updateTeacherDao.updateTeacher(teacher);
	
	// row값 분기 설정
	if(row==1){
		System.out.println("강사 변경 성공");
		msg = URLEncoder.encode("강사 정보 변경 성공","utf-8");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherOne.jsp?teacherNo="+teacherNo+"&msg="+msg);
		return;
	}else{
		System.out.println("강사 변경 실패");
		msg = URLEncoder.encode("다시 입력해 주시기 바랍니다","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
%>