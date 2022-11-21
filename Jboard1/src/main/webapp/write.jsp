<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<script>
	let oEditors = []
	
	smartEditor = function() {
	  console.log("Naver SmartEditor")
	  nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "editorTxt",
	    sSkinURI: "/Jboard1/smarteditor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	  });
	}
	
	$(document).ready(function() {
	  smartEditor()
	});
	
</script>
<main id="board">
    <section class="write">
       <form action="/Jboard1/proc/writeProc.jsp" method="post" enctype="multipart/form-data" id="form">
           <input type="hidden" name="uid" value="<%= ub.getUid() %>"/>
           <table border="0">
               <caption>글쓰기</caption>
               <tr>
                   <th>제목</th>
                   <td><input type="text" name="title" placeholder="제목을 입력하세요."></td>
               </tr>
               <tr>
                   <th>내용</th>
                   <td>
                       <textarea name="content" id="editorTxt" rows="10" cols="100" style="width: 100%"></textarea>
                   </td>
               </tr>
               <tr>
                   <th>첨부</th>
                   <td>
                       <input type="file" name="fname"/>
                   </td>
               </tr>
           </table>
           <div>
               <a href="/Jboard1/list.jsp" class="btn btnCancel">취소</a>
               <input type="submit" value="작성완료" class="btn btnComplete"/>
           </div>
       </form>
    </section>
</main>
<%@ include file="./_footer.jsp" %>