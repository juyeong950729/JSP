<%@page import="kr.co.farmstory.vo.ArticleVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String pg = request.getParameter("pg");
	
	int start = 0;
	int total = 0;
	int lastPageNum = 0;
	int currentPage = 1;
	int currentPageGroup = 1;
	int PageGroupStart = 0;
	int PageGroupEnd = 0;
	int PageStartNum = 0;

	
	// 현재 페이지 게시물 limit 시작값 계산
	if (pg != null) {
		currentPage = Integer.parseInt(pg);
	}
	start = (currentPage - 1) * 10;
	
	// 페이지 그룹 계산
	currentPageGroup = (int) Math.ceil(currentPage / 10.0);
	PageGroupStart = (currentPageGroup - 1) * 10 + 1;
	PageGroupEnd = currentPageGroup * 10;
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	total = dao.selectCountTotal(cate);
	
	// 페이지 마지막 번호 계산
	if(total % 10 == 0) {
		lastPageNum = (total / 10);
	} else{
		lastPageNum = (total / 10) + 1;
	}
	
	if (PageGroupEnd > lastPageNum){
		PageGroupEnd = lastPageNum;
	}
	
	// 페이지 시작 번호 계산
	PageStartNum = total - start;
	
	// 현재 페이지 게시물 가져오기
	List<ArticleVO> articles = ArticleDAO.getInstance().selectArticles(cate, start);
	
	pageContext.include("/board/_"+group+".jsp");

%>
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
            <% for(ArticleVO art : articles){ %>
            <tr>
                <td><%= art.getNo() %></td>
                <td><a href="./view.jsp?group=<%= group %>&cate=<%= cate %>&no<%= art.getNo() %>&pg=<%= currentPage %>"><%= art.getTitle() %>[<%= art.getComment() %>]</a></td>
                <td><%= art.getNick() %></td>
                <td><%= art.getRdate().substring(2, 10) %></td>
                <td><%= art.getHit() %></td>
            </tr>
            <% } %>
        </table>
        <div class="page">
            <% if(PageGroupStart > 1){ %>
            <a href="/FarmStory/board/list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= PageGroupStart - 1 %>" class="prev">이전</a>
            <% } %>
            <% for (int i=PageGroupStart; i<=PageGroupEnd; i++){ %>
            <a href="/FarmStory/board/list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= i %>" class="num <%= (currentPage == i)?"current":"off"%>"><%= i %></a>
            <% } %>
            <% if(PageGroupEnd < lastPageNum){ %>
            <a href="/FarmStory/board/list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= PageGroupEnd + 1 %>" class="next">다음</a>
            <% } %>
        </div>

        <a href="./write.jsp?group=<%= group %>&cate=<%= cate %>" class="btn btnWrite">글쓰기</a>
    </section>
</main>
		</article>
	</section>
</div>
<%@ include file="/_footer.jsp" %>