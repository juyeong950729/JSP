<%@page import="kr.co.farmstory.dao.UserDAO"%>
<%@page import="kr.co.farmstory.vo.TermsVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp" %>
<script>
	$(function(){
		$('.btnNext').click(function(){
			
			let isCheck1 = $('input[class=terms]').is(':checked');
			let isCheck2 = $('input[class=privacy]').is(':checked');
			
			if(isCheck1 && isCheck2){
				return true;
			} else {
				alert('동의 체크를 하셔아 합니다.');
				return false;
			}
		});
	});

</script>
<%
	TermsVO terms = UserDAO.INSTANCE.selectTerms();

%>
<main id="user">
	<section class="terms">
		<table border="1">
			<caption>사이트 이용약관</caption>
			<tr>
				<td>
					<textarea name="terms"><%= terms.getTerms() %></textarea>
					<label><input type="checkbox" class="terms">&nbsp;동의합니다.</label>
				</td>
			</tr>
			</table>
			<table border="1">
				<caption>개인정보 취급방침</caption>
	            <tr>
					<td>
						<textarea name="privacy"><%= terms.getPrivacy() %></textarea>
						<label><input type="checkbox" class="privacy">&nbsp;동의합니다.</label>
					</td>
				</tr>
			</table>
		<p>
			<a href="/FarmStory/user/login.jsp" class="btn btnCancel">취소</a>
			<a href="/FarmStory/user/register.jsp" class="btn btnNext">다음</a>
		</p>  
	</section>
</main>
<%@ include file="/_footer.jsp" %>