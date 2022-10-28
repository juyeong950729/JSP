<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");

	int limitStart = 0;
	int currentPage = 1;
	int total = 0;
	int lastPageNum = 0;
	int PageGroupCurrent = 1;
	int PageGroupStart = 1;
	int PageGroupEnd = 0;
	int PageStartNum = 0;
	
	// 게시물 DAO 객체 가져오기
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 전체 게시물 갯수 구하기
	total = dao.selectCountTotal();
	
	// 페이지 마지막 번호 계산
	if(total % 10 == 0) {
		lastPageNum = (total / 10);
	} else{
		lastPageNum = (total / 10) + 1;
	}
	
	// 현재 페이지 게시물 limit 시작값 계산
	if (pg != null){
		currentPage = Integer.parseInt(pg);
	}
	limitStart = (currentPage - 1) * 10;
	
	// 페이지 그룹 계산
	PageGroupCurrent = (int) Math.ceil(currentPage / 10.0);
	PageGroupStart = (PageGroupCurrent - 1) * 10 + 1;
	PageGroupEnd = PageGroupCurrent * 10;
	
	if(PageGroupEnd > lastPageNum){
		PageGroupEnd = lastPageNum;
	}
	
	// 페이지 시작 번호 계산
	PageStartNum = total - limitStart;
	
	// 현재 페이지 게시물 가져오기
	List<ArticleBean> articles = dao.selectArticles(limitStart);

%>
<%@ include file="./_header.jsp" %>
<main id="board">
	<section class="list">   
		<table border="0">
			<caption>글목록</caption>
                   <tr>
                       <th>번호</th>
                       <th>제목</th>
                       <th>글쓴이</th>
                       <th>날짜</th>
                       <th>조회</th>
                   </tr>
                   <% for (ArticleBean ab : articles) { %>
                   <tr>
                       <td><%= PageStartNum-- %></td>
                       <td><a href="/Jboard1/view.jsp?no=<%= ab.getNo() %>&pg=<%= currentPage %>"><%= ab.getTitle() %>[<%= ab.getComment() %>]</a></td>
                       <td><%= ab.getNick() %></td>
                       <td><%= ab.getRdate().substring(2, 10) %></td>
                       <td><%= ab.getHit() %></td>
                   </tr>
                   <% } %>
           </table>
              <div class="page">
               	  <% if(PageGroupStart > 1){ %>
                  <a href="/Jboard1/list.jsp?pg=<%= PageGroupStart - 1 %>" class="prev">이전</a>
                  <% } %>
                  <% for (int i=PageGroupStart; i<=PageGroupEnd; i++){ %>
                  <a href="/Jboard1/list.jsp?pg=<%= i %>" class="num <%= (currentPage == i)?"current":"off" %>"><%= i %></a>
                  <% } %>
                  <% if(PageGroupEnd < lastPageNum){ %>
                  <a href="/Jboard1/list.jsp?pg=<%= PageGroupEnd + 1 %>" class="next">다음</a>
              	  <% } %>
              </div>
              <a href="/Jboard1/write.jsp" class="btn btnWrite">글쓰기</a>
	</section>
</main>
<%@ include file="./_footer.jsp" %>