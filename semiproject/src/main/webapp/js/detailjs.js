
window.addEventListener('DOMContentLoaded',function(){ 





    $(document).ready(function() {

       

        var start_price = $('.goods_price').text()  // 개당가격 표시할 변수!
        
        var number = $('.inp').val();                  //구매 수량을 조절할 변수 ! (inp클래스 초기 value값은 1로 헸음! 시작 수량이 1이니깐)
        var cost =   $(".price1").val(); // 상품의 가격을 설정해줘야됨.  goods_price안에있는 input의 value값에 탬플릿 언어로 반찬 가격을 불러와야됨 
       // console.log(cost);
       

        $('.price .num').text(start_price);             // 첫 화면의 총 상품금액 (.price 안에 .num) 에다가 초기 가격을 출력!
        
    
        

        //수량 조절 함수 시작
        $('.down').click(function(){               // 수량 내리기 버튼을 클릭할 때 발동!  
            if(number >= 1){                        // 만약에 수량이 1보다 많으면 ?
                number--;                          // 목적대로 수량을 1 깍음
                $(".inp").val(number);  			   // 깍았으니 수량클래스(.inp)의 값을 바꿔줌
                 
                         
                
                }   
             else if(number > 0){             //0 이하면 false 반환
              return false;
            }
    		        $(".num").text(new Intl.NumberFormat('ko-KR').format(parseInt(number*cost))+"원")-cost;
            
            
        });
    
    
    
        $('.up').click(function(){            // 수량올리기 버튼 클릭하면?
            number++;// 수량을 1 올려줌
            $(".inp").val(number);  // 올렸으니 수량클래스(.inp)의 값을 바꿔줌
         
            $(".num").text(new Intl.NumberFormat('ko-KR').format(parseInt(number*cost))+"원");
    
    
    i
            
           
            
    
            
        });
        
        
        
       



       





        function comma(num){                       //콤마찍는 함수
            var len, point, str; 
               
            num = num + ""; 
            point = num.length % 3 ;
            len = num.length; 
           
            str = num.substring(0, point); 
            while (point < len) { 
                if (str != "") str += ","; 
                str += num.substring(point, point + 3); 
                point += 3; 
            } 
             
            return str;
         
        }











    });

});

