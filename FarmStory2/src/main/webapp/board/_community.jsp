<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub">
    <div>
        <img src="/FarmStory2/img/sub_top_tit5.png" alt="COMMUNITY">
    </div>
    <section class="cate5">
        <aside>
            <img src="/FarmStory2/img/sub_aside_cate5_tit.png" alt="공지사항">
            <ul class="lnb">
                <li class="${cate.equals('notice') ? 'on' : 'off'}">
                    <a href="/FarmStory2/board/list.do?group=community&cate=notice&pg=1">공지사항</a>
                </li>
                <li class="${cate.equals('menu') ? 'on' : 'off'}">
                    <a href="/FarmStory2/board/list.do?group=community&cate=menu&pg=1">오늘의식단</a>
                </li>
                <li class="${cate.equals('chef') ? 'on' : 'off'}">
                    <a href="/FarmStory2/board/list.do?group=community&cate=chef&pg=1">나도요리사</a>
                </li>
                <li class="${cate.equals('qna') ? 'on' : 'off'}">
                    <a href="/FarmStory2/board/list.do?group=community&cate=qna&pg=1">1:1고객문의</a>
                </li>
                <li class="${cate.equals('faq') ? 'on' : 'off'}">
                    <a href="/FarmStory2/board/list.do?group=community&cate=faq&pg=1">자주묻는질문</a>
                </li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="/FarmStory2/img/sub_nav_tit_cate5_${cate}.png" alt="공지사항">
                <p>
                    HOME > 커뮤니티 > 
                    <c:choose>
                    	<c:when test="${cate.equals('notice')}">
                    		<em>공지사항</em>
                    	</c:when>
                    	<c:when test="${cate.equals('grow')}">
                    		<em>오늘의식단</em>
                    	</c:when>
                    	<c:when test="${cate.equals('chef')}">
                    		<em>나도요리사</em>
                   		</c:when>
                    	<c:when test="${cate.equals('qna')}">
                    		<em>1:1고객문의</em>
                    	</c:when>
                    	<c:when test="${cate.equals('faq')}">
                    		<em>자주묻는질문</em>
                    	</c:when>
                    </c:choose>
                </p>
            </nav>