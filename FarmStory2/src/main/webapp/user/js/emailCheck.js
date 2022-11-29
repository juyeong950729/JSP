/**
 * 
 */
 let preventDoubleClick = false;
 let isEmailAuthOk = false;
 
 $(function(){
	
	// 이메일 인증 검사하기
		let emailCode = 0;
		
		$('#btnEmailAuth').click(function(){
			
			let email = $('input[name=email]').val();
			$('.emailResult').css('color', 'black').text('잠시만 기다려주세요.');
			
			$.ajax({
				url: '/FarmStory2/user/emailCheck.do',
				method: 'get',
				data: {"email":email},
				dataType: 'json',
				success: function(data){
					
					if(data.status == 1){
						// 메일 발송 성공
						emailCode = data.code;
						
						$('.emailResult').text('인증코드를 전송했습니다. 이메일을 확인하세요.');
						$('.auth').show();
					}else{
						// 메일 발송 실패
						$('.emailResult').text('이메일 전송을 실패했습니다. 이메일을 확인 후 다시 시도하시길 바랍니다.');
					}
				}
			});
			
		});
		
		// 이메일 인증코드 확인
		$('#btnEmailConfirm').click(function(){
			
			let code = $('input[name=auth]').val();
			
			if(code == emailCode){
				isEmailAuthOk = true;
				$('.emailResult').text('이메일이 인증되었습니다.');
			} else {
				isEmailAuthOk = false;
				$('.emailResult').text('인증번호가 틀렸습니다.');
			}
			
		});
	
});