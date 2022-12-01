<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/_header.jsp"/>
<main id="board">
	<c:choose>
		<c:when test="${group.equals('community')}">
			<jsp:include page="/board/_community.jsp"/>
		</c:when>
		<c:when test="${group.equals('croptalk')}">
			<jsp:include page="/board/_croptalk.jsp"/>
		</c:when>
		<c:when test="${group.equals('event')}">
			<jsp:include page="/board/_event.jsp"/>
		</c:when>
		<c:when test="${group.equals('market')}">
			<jsp:include page="/board/_market.jsp"/>
		</c:when>
	</c:choose>
	    <section class="list">                
	        <form action="/FarmStory2/board/list.do">
	            <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
	            <input type="submit" value="검색">
	        </form>
	        <table border="0">
	            <caption>글목록</caption>
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>글쓴이</th>
	                <th>날짜</th>
	                <th>조회</th>
	            </tr> 
	            <c:forEach var="article" items="${articles}">         
	            <tr>
	                <td>${PageStartNum = PageStartNum - 1}</td>
	                <td><a href="/FarmStory2/board/view.do?group=${group}&cate=${cate}&no=${article.no}&pg=${currentPage}">${article.title} [${article.comment}]</a></td>
	                <td>${article.nick}</td>
	                <td>${article.rdate.substring(2, 10)}</td>
	                <td>${article.hit}</td>
	            </tr>
	            </c:forEach>
	        </table>
	
	        <div class="page">
	        	<c:if test="${PageGroupStart > 1}">
	            	<a href="/FarmStory2/board/list.do?group=${group}&cate=${cate}&pg=${PageGroupStart - 1}" class="prev">이전</a>
	            </c:if>
	            <c:forEach var="i" begin="${PageGroupStart}" end="${PageGroupEnd}">
	            	<a href="/FarmStory2/board/list.do?group=${group}&cate=${cate}&pg=${i}" class="num ${(currentPage == i) ? 'current' : 'off'}">${i}</a>
	            </c:forEach>
	            <c:if test="${PageGroupEnd < lastPageNum}">
	            	<a href="/FarmStory2/board/list.do?group=${group}&cate=${cate}&pg=${PageGroupEnd + 1}" class="next">다음</a>
	            </c:if>
	        </div>
	        <a href="./write.do?group=${group}&cate=${cate}&pg=${pg}" class="btn btnWrite">글쓰기</a>
	    </section>
	  </article>
  </section>
</div>
</main>
<jsp:include page="/_footer.jsp"/>