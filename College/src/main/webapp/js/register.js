/**
 * 
 */
 
 function register() {

	$(function(){
		
		$.get('./data.register.jsp', function(data){
			
			let table = "table <border='1'>";
				table += "<tr>";
				table += "<th>학번</th>";
				table += "<th>이름</th>";
				table += "<th>강좌명</th>";
				table += "<th>강좌코드</th>";
				table += "<th>중간시험</th>";
				table += "<th>기말시험</th>";
				table += "<th>총점</th>";
				table += "<th>등급</th>";
				table += "</tr>";
				table += "</table>";
				
				$('div').empty().append(table);
				
				for (let register of data){
					let tr = "<tr>";
						tr += "<td>"+register.RegStdNo+"</td>";
						tr += "<td>"+register.StdName+"</td>";
						tr += "<td>"+register.LecName+"</td>";
						tr += "<td>"+register.RegLecNo+"</td>";
						tr += "<td>"+register.RegMidScore+"</td>";
						tr += "<td>"+register.RegFinalScore+"</td>";
						tr += "<td>"+register.RegTotalScore+"</td>";
						tr += "<td>"+register.RegGrade+"</td>";
						tr += "</tr>";
						
						$('table').append(tr);
				}
			
		});
		
	});
	
}