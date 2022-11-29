<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/_header.jsp"/>
<main id="board">
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
            <tr>
                <td>1</td>
                <td><a href="/FarmStory2/board/view.do}">테스트 제목입니다. [3]</a></td>
                <td>홍길동</td>
                <td>22-11-29</td>
                <td>15</td>
            </tr>
        </table>

        <div class="page">
            	<a href="/FarmStory2/board/list.do" class="prev">이전</a>
            	<a href="/FarmStory2/board/list.do" class="num">1</a>
            	<a href="/FarmStory2/board/list.do" class="next">다음</a>
        </div>
        <a href="./write.do" class="btn btnWrite">글쓰기</a>
        
    </section>
</main>
<jsp:include page="/_footer.jsp"/>