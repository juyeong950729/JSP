/**
 * 
 */
function register(){
 
	 $(function(){
		
		$('section')
					$('nav').append("<h4>주문하기</h4>")
					
					let table = "<table border='1'>";
						table += "<tr>"
						table += "<td>상품번호</td>"
						table += "<td><input type='text' name='orderProduct'/></td>"
						table += "</tr>"
						table += "<tr>"
						table += "<td>수량</td>"
						table += "<td><input type='text' name='orderCount'/></td>"
						table += "</tr>"
						table += "<tr>"
						table += "<td>주문자</td>"
						table += "<td><input type='text' name='orderId'/></td>"
						table += "</tr>"
						table += "<td colspan='2' align='right'><input type='submit' id='btnRegister' value='주문하기'/></td>"
						table += "</tr>"
						table += "</table>"
					
					$('section').append(table);
				});

}