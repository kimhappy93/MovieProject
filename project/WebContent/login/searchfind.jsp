<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="svc.SearchService" %>
<%
String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/common.css"> 
<style>
#main h1{
  margin-top: 80px;
  text-align:center;
}

#findid{
	margin: 0 auto;
  width: 400px;
  height: 200px;
  padding-top:50px;
  margin-bottom:300px;
  text-align: center;
  border-top:1px solid #333;
  border-bottom:1px solid #333;
}

#findid span{
	font-size:16px;
	font-weight:bold;
}

.findbtn{
	width:140px;
	height:30px;
	margin:13px;
	margin-top:30px;
	font-size:13px;
	font-weight:200;
	cursor:pointer;
	background-color:#333;
	color:white;
}
</style>
</head>
<%
   request.setCharacterEncoding("euc-kr");
   String name = request.getParameter("Name");
   String email = request.getParameter("Email");
   SearchService searchService = SearchService.getInstance();
   String userId = searchService.searchId(name, email);
%>

<body>
<header id="header">
              <h1 class="title" onclick="javascript:location.href='../main/main.jsp'">MOVIEMOA</h1>
            <form method="post" action="../main/search.jsp" class="login">
               <%if (id != null) {%>
                 <span id="hi"><%=id %> 님, 반갑습니다.</span>
                 <button type="button" class="login" onclick="javascript:location.href='logout.jsp'">Logout</button>
              <%} else {%>
              <button type="button" class="login" onclick="javascript:location.href='login.jsp'">Login</button>	
              <button type="button" class="login" onclick="javascript:location.href='agree.jsp'">Sign in</button><% } %>
              
	              <input type="text" name="search"  id="search" class="login" placeholder="Search...">
	              <input type="submit" id="searchBtn">
              </form>
                  
             <nav id="nav">
                  <span class="btn" onclick="javascript:location.href='../movieList.mo'">MovieInfo</span>
                  <span class="btn" onclick="javascript:location.href='../subpage/boardList.bo?boardtype=BOARDALL'">MovieTalk</span>
                  <span class="btn" onclick="javascript:location.href='../newsList.mo'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='../main/loc.jsp'">Theater</span> 
              </nav>
                  
         </header>
         
<div id="main" align="center">  
   <form method="post" action="login.jsp">
   <%if(userId!= null){ %>
   <h1>아이디 찾기</h1>
		<div id="findid">
		<p>
			<span><%=name %></span>&nbsp;님의 아이디는 <span><%=userId %></span>&nbsp;입니다.
		</p>
		<input type="submit" name="search" value="로그인하기" class="findbtn">
		 <%} else{%>
		 <%=name %>님의 가입정보가 없습니다. 
		 
		 <input type="button" value="회원가입하기" class="findbtn" onclick="location.href='member.jsp'">
        <input type="button" value="처음으로" class="findbtn" onclick="location.href='searchid.jsp'">
        <%} %>
        
		</div>
	</form>
</div>
 <div id="footer">
       <article>
     copyright@<br><br><hr><br>MOVIE주식회사: 인천광역시 서구 서곶로 284 새터빌딩 4층 연희직업전문학교<p/>대표전화: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com 
       </article>      
    </div>
</body>
</html>

