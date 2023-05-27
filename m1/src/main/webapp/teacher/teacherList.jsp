<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	// 페이지
	int currentPage = 1;
	// 페이지 값 받아오기, 유효성 검사
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//한 페이지 당 보여줄 게시물의 수
	int rowPerPage = 10;
	//시작 행의 번호
	int startRow = (currentPage-1)*rowPerPage;

	//강사 리스트 출력
	TeacherDao teacherDao = new TeacherDao();
	ArrayList<HashMap<String,Object>> list = teacherDao.selectTeacherListByPage(startRow, rowPerPage);
	
	//강사 리스트 총 행의 수
	TeacherDao totalRowDao = new TeacherDao();
	int totalRow = totalRowDao.selectTeacherCount();
	
	//마지막 페이지 몇페이지 까지 출력할 건지
	int lastPage = totalRow/rowPerPage;
	if(totalRow%rowPerPage!=0){
		lastPage++;
	}
	
	//1~10에서 8번 눌러도 여전히 1~10나오도록 설정 변수 선언
	//첫번째 번호
	int startPage = ((currentPage-1)/10)*10+1;
	//페이지의 마지막 번호
	int endPage = Math.min(startPage+9,lastPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 리스트</title>
</head>
<body>
	<!-- 메인메뉴 (가로) -->
	<div>
		<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	</div>
	
	<div style ="background-color: grey; height:100%;">
		<div style="background-color: #FFFFFF; height:800px" class="container">
		
			<!-- 강사 리스트 제목 -->
			<h1 style="height: 100px; display: flex; align-items: center;">강사 리스트</h1>
			
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
			
			<!-- 강사 리스트 출력 테이블 -->
			<table class="table table-hover">
				<thead style="background-color: grey; color:#FFFFFF;">
					<tr>
						<th style="width:100px;">강사번호</th>
						<th style="width:200px;">강사아이디</th>
						<th style="width:200px;">강사이름</th>
						<th style="width:200px;">담당과목</th>
					</tr>
				</thead>
				<%
					for(HashMap<String,Object> m : list){
				%>
					<tr onclick="location.href='<%=request.getContextPath()%>/teacher/teacherOne.jsp?teacherNo=<%=m.get("강사번호")%>'" style="cursor: pointer;">
						<th><%=m.get("강사번호") %></th>
						<th><%=(String)m.get("강사아이디") %></th>
						<th><%=(String)m.get("강사이름") %></th>
						<th><%=(String)m.get("담당과목") %></th>
					</tr>
				<%
					}
				%>
			</table>
		
			<!-- 페이징 설정 -->
			<div style="text-align: center;">
				<%
					//이전 버튼 출력
					//스타트 페이지가 10보다 클경우에만 이전버튼 출력
					if(startPage>10){
				%>
						<a class="btn btn-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=startPage-10%>">이전</a>
				<%
					}
					//페이징 버튼출력
					for(int i = startPage; i<=endPage; i++){
				%>
					<!-- 해당페이지는 파랑 아닌것은 회색 표현 -->
						<a class="<%=currentPage==i ? "btn btn-dark":"btn btn-secondary"%>" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=i%>"><%=i %></a>
				<%
					}
					//다음 버튼 출력
					//출력될수 있는 마지막 페이지가 last페이지보다 작을때만 다음버튼출력
					if(endPage<lastPage){
				%>
						<a class="btn btn-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=startPage+10%>">다음</a>
				<%
					}
				%>
			</div><!-- 페이징 설정 종료 -->
		</div><!-- container 종료 -->
	</div><!-- BG grey 종료 -->
	
	<!-- copyright -->
	<div>
		<jsp:include page="/inc/copyright.jsp"></jsp:include>
	</div>
</body>
</html>