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
	
	// teacherSubjectOne 에서 받아온 값 유효성 검사
	if(request.getParameter("teacherSubjectNo")==null
	||request.getParameter("teacherSubjectNo").equals("")){
		
		System.out.println("modifyTeacherSubject Null값 있음");
		msg = URLEncoder.encode("값을 입력해 주시기 바랍니다","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 값 받아오기
	int teacherSubjectNo = Integer.parseInt(request.getParameter("teacherSubjectNo"));
	
	// TecherSubjectDao 클래스에서 5) 담당과목 수정리스트 페이지 출력
	TeacherSubjectDao selUpdateList = new TeacherSubjectDao();
	TeacherSubject teachersubject = selUpdateList.selUpdateList(teacherSubjectNo);
	// TeacherSubjectDao 클래스에서 2) 과목 리스트 출력하는 메서드사용
	TeacherSubjectDao subjectDao = new TeacherSubjectDao();
	ArrayList<HashMap<String,Object>> list2 = subjectDao.setSubjectCnt();
	// TeacherSubjectDao 클래스에서 7) 강사한명 지목하는 메서드사용
	TeacherSubjectDao teacherNameDao = new TeacherSubjectDao();
	ArrayList<HashMap<String,Object>> list = teacherNameDao.selTeacherOne(teacherSubjectNo);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당과목 수정</title>
<style>
	th{
		width:200px;
		vertical-align: middle;
	}
</style>
</head>
<body>
	<!-- 메인메뉴 (가로) -->
	<div>
		<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	</div>
	
	<div style ="background-color: grey; height:100%;">
		<div style="background-color: #FFFFFF; height:800px" class="container">
		
			<form action="<%=request.getContextPath() %>/teacherSubject/modifyTeacherSubjectAction.jsp">
			
				<!-- 담당과목 수정리스트 제목 -->
				<h1 style="height: 100px; display: flex; align-items: center;">담당과목 상세 리스트</h1>
				
				<!-- 담당과목 수정리스트 -->
				<table class="table">
					<tr>
						<th>과정번호</th>
						<td>
							<input class="form-control" type="number" name="teacherSubjectNo" value="<%=teachersubject.getTeacherSubjectNo()%>" readonly="readonly">
							<!-- teacherNo 값 넘기기 용 -->
							<input type ="hidden" name="teacherNo" value="<%=teachersubject.getTeacherNo()%>">
						</td>
					</tr>
					<tr>	
						<th>강사 이름</th>
							<%
								for(HashMap<String,Object> m : list){
							%>
								<td>
									<%=(String)m.get("강사이름") %>
								</td>
							<%
								}
							%>
					</tr>
					<tr>	
						<th>과목 이름</th>
						<td>
							<select name="subjectNo" class="form-select">
								<%
									for(HashMap<String,Object> m2 : list2){
								%>
									<option value="<%=m2.get("과목번호")%>"><%=(String)m2.get("과목이름") %></option>
								<%
									}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<th>생성일</th>
						<td><%=teachersubject.getCreatedate()%></td>
					</tr>
					<tr>
						<th>수정일</th>
						<td><%=teachersubject.getUpdatedate()%></td>
					</tr>
				</table>
				<button class="btn btn-secondary" style="float:right;" type="submit">수정</button>
			</form>
		</div><!-- /container -->
	</div><!-- /grey -->
	
	<!-- copyright -->
	<div>
		<jsp:include page="/inc/copyright.jsp"></jsp:include>
	</div>
</body>
</html>