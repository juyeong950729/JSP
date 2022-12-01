<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/_header.jsp"/>
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
<main id="board">
    <section class="modify">
        <form action="/FarmStory2/board/modify.do" method="post">
        	<input type="hidden" name="uid" value="${sessUser.uid}"/>
        	<input type="hidden" name="cate" value="${cate}"/>
        	<input type="hidden" name="no" value="${article.no}"/>
        	<input type="hidden" name="group" value="${group}"/>
        	<input type="hidden" name="pg" value="${pg}"/>
            <table border="0">
                <caption>글수정</caption>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" placeholder="제목을 입력해주세요." value="${article.title}"/></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content">${article.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td>
                        <input type="file" name="fname"/>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/FarmStory2/board/view.do?group=${group}&cate=${cate}&pg=${pg}&no=${no}" class="btn btnCancel">취소</a>
                <input type="submit" value="작성완료" class="btn btnComplete"/>
            </div>
        </form>
    </section>
</main>
		</article>
	</section>
</div>
<jsp:include page="/_footer.jsp"/>