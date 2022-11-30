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
    <section class="view">
        <table border="0">
            <caption>글보기</caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="테스트 제목입니다." readonly/></td>
            </tr>
            <tr>
                <th>파일</th>
                <td><a href="/FarmStory2/board/download.do">상반기 결산자료</a>&nbsp;<span>7</span>회 다운로드</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" readonly>테스트 내용입니다.</textarea>
                </td>
            </tr>                    
        </table>
        
        <div>
            <a href="/FarmStory2/board/delete.do" class="btn btnRemove">삭제</a>
            <a href="/FarmStory2/board/modify.do" class="btn btnModify">수정</a>
            <a href="/FarmStory2/board/list.do" class="btn btnList">목록</a>
        </div>

        <!-- 댓글목록 -->
        <section class="commentList">
            <h3>댓글목록</h3>                   

            <article>
                <span class="nick">홍길동</span>
                <span class="date">22-11-29</span>
                <p class="content">테스트 댓글입니다.</p>                        
                <div>
                    <a href="#" class="remove">삭제</a>
                    <a href="#" class="modify">수정</a>
                </div>
            </article>
            
            <p class="empty">등록된 댓글이 없습니다.</p>


        </section>

        <!-- 댓글쓰기 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="#">
                <textarea name="content">댓글내용 입력</textarea>
                <div>
                    <a href="#" class="btn btnCancel">취소</a>
                    <input type="submit" value="작성완료" class="btn btnComplete"/>
                </div>
            </form>
        </section>
    </section>
</main>
<jsp:include page="/_footer.jsp"/>