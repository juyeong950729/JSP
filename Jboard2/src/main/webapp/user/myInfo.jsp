<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script src="/Jboard2/js/validation.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Jboard2/js/zipcode.js"></script>
<script>

	$(function(){
		
		$('#btnPassChange').click(function(e){
			
			e.preventDefault();
			
			let pass1 = $('input[name=pass1]').val();
			let pass2 = $('input[name=pass2]').val();
				
			if (pass1 == pass2){
				let uid = $('#uid').text();
				let jsonData = {
						"uid" : uid,
						"pass" : pass2
				};
				
				$.ajax({
					url: '/Jboard2/user/findPwChange.do',
					method: 'post',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						if(data.result > 0){
							alert('비밀번호가 변경되었습니다.');
						}
					}
				});
				
			} if (pass1 == null || pass2 == null) {
				alert('변경할 비밀번호를 입력해주세요.');
			} if (pass1 != pass2) {
				alert('비밀번호가 일치하지 않습니다.');
			}
			
		});
		
		$('#btnDropUser').click(function(e){
			
			e.preventDefault();
			
			confirm('정말로 탈퇴하시겠습니까?');
			
			if (confirm == true){
				let uid = $('#uid').text();
				let jsonData = {"uid" : uid};
				
				$.ajax({
					url: '/Jboard2/user/dropUser.do',
					method: 'get',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						if (data.result > 0){
							alert('탈퇴 완료 되었습니다.');
							location.href = '/Jboard2/user/logout.do';
						}
					}
				});
			}
			
		});
		
		$('.btnRegister').click(function(e){
			e.preventDefault();
			
			let uid = $('#uid').text();
			let name = $('input[name=name]').val();
			let nick = $('input[name=nick]').val();
			let email = $('input[name=email]').val();
			let hp = $('input[name=hp]').val();
			let zip = $('input[name=zip]').val();
			let addr1 = $('input[name=addr1]').val();
			let addr2 = $('input[name=addr2]').val();
			
			let jsonData = {
					"uid" : uid,
					"name" : name,
					"nick" : nick,
					"email" : email,
					"hp" : hp,
					"zip" : zip,
					"addr1" : addr1,
					"addr2" : addr2
			};
			
			$.ajax({
				url: '/Jboard2/user/updateUser.do',
				method: 'post',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					if (data.result > 0){
						alert('수정 완료되었습니다.');
						location.href = '/Jboard2/list.do';
					}
				}
			});
			
		});
		
	});
</script>
<main id="user">
    <section class="register">
        <form action="#" method="post">
            <table border="1">
                <caption>회원정보 설정</caption>
                <tr>
                    <td>아이디</td>
                    <td id="uid">${sessUser.uid}</td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pass1" placeholder="비밀번호 입력"/></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/>
                    <button type="button" id="btnPassChange" style="padding: 4px; background: #4374D9; color: #fff;">비밀번호 수정</button>
                    </td>
                </tr>
                <tr>
                	<td>회원가입일</td>
                	<td>${sessUser.rdate}</td>
                </tr>
            </table>

            <table border="1">
                <caption>개인정보 수정</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" placeholder="${sessUser.name}"/>                        
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" placeholder="${sessUser.nick}"/>
                        <button type="button" id="btnNickCheck"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        
                        <input type="email" name="email" placeholder="${sessUser.email}"/>
                        <span class="emailResult"></span>
                        <button type="button" id="btnEmailAuth"><img src="../img/chk_auth.gif" alt="인증번호 받기"/></button>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" id="btnEmailConfirm"><img src="../img/chk_confirm.gif" alt="확인"/></button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="hp" placeholder="${sessUser.hp}"/></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" id="zip" placeholder="${sessUser.zip}" readonly="readonly"/>
                        <button type="button" onclick="zipcode()"><img src="/Jboard2/img/chk_post.gif" alt="우편번호찾기"/></button>
                        <input type="text" name="addr1" id="addr1" placeholder="${sessUser.addr1}"/>
                        <input type="text" name="addr2" id="addr2" placeholder="${sessUser.addr2}"/>
                    </td>
                </tr>
                <tr>
                	<td>회원탈퇴</td>
                	<td>
                		<button type="button" id="btnDropUser" style="padding: 6px; background: #de2f2f; color: #fff;">탈퇴하기</button>
                	</td>
                </tr>
            </table>
            <div>
                <a href="/Jboard2/list.do" class="btn btnCancel">취소</a>
                <input type="submit" value="수정완료" class="btn btnRegister"/>
            </div>

        </form>

    </section>
</main>
<jsp:include page="./_footer.jsp"/>