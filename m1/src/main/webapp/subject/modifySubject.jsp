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
	
	// subjectList에서 받아온 값 유효성 검사
	if(request.getParameter("subjectNo")==null
	||request.getParameter("subjectNo").equals("")){
		
		System.out.println("modifySubject Null값 있음");
		msg = URLEncoder.encode("값을 입력해 주시기 바랍니다","utf-8");
		response.sendRedirect(request.getHeader("Referer") + "?msg=" + msg);
		return;
	}
	// 값 받아오기
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	// SubjectDao 클래스에 sujectDao 변수 선언 후 변수에 받아온 값 넣기
	SubjectDao subjectDao = new SubjectDao();
    Subject subject = subjectDao.selectSubjectOne(subjectNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 수정</title>
<style>
	th{
		vertical-align: middle;
		width: 200px;
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
			<form action="<%=request.getContextPath() %>/subject/modifySubjectAction.jsp">
			
				<!-- 과목 추가 리스트 제목 -->
				<h1 style="height: 100px; display: flex; align-items: center;">과목 정보 수정</h1>
				
				<!-- 메시지 출력 -->
				<div style="color: red;">
					<%
						if(request.getParameter("msg") != null){
					%>
							<div><%=request.getParameter("msg") %></div>
					<%
						}
					%>
				</div>
					
				<!-- 과목 수정 리스트 -->
				<table class="table">
					<tr>
						<th>과목 번호</th>
						<td><input class="form-control" type ="number" name="subjectNo" readonly="readonly" value="<%=subject.getSubjectNo()%>"></td>
					</tr>
					<tr>
						<th>과목 이름</th>
						<td><input class="form-control" type ="text" name="subjectName" value="<%=subject.getSubjectName() %>" required="required"></td>
					</tr>
					<tr>
						<th>과목 시간</th>
						<td><input class="form-control" type ="number" name="subjectTime" value="<%=subject.getSubjectTime() %>" required="required"></td>
					</tr>
					<tr>
						<th>최초 작성 시간</th>
						<td><input class="form-control" type ="text" name="createdate" readonly="readonly" value="<%=subject.getCreatedate()%>"></td>
					</tr>
					<tr>
						<th>마지막 수정 시간</th>
						<td><input class="form-control" type ="text" name="updatedate" readonly="readonly" value="<%=subject.getUpdatedate()%>"></td>
					</tr>
				</table>
				<button style="float:right;" class="btn btn-secondary" type="submit">수정</button>
			</form>
		</div><!-- /container -->
	</div><!-- /grey -->
	
	<!-- copyright -->
	<div>
		<jsp:include page="/inc/copyright.jsp"></jsp:include>
	</div>
</body>
</html>