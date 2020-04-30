$(function(){
    const nick_title = $(".nick");
    const main_btn = $(".log_box");
    //우
    const $logout_btn = $(".gnb_my_list_last");

    const log_out =$(".gnb_my_list_last").on("click", function(){
        console.log('g');
        window.location.href="/HelloMarket/login/logout.jsp";
        
     })
    $(main_btn).on('click',function(){
        location.href="/HelloMarket/Main.jsp"
    })
    //오른쪽 상단 닉네임 클릭하면 nav 나옴 
    function slide_nick(){
        $('.gnb_my_lyr').parent().show()
        console.log('hi')
        
    }

    //다른곳 클릭시 사라짐 
    function silde_up_nick(){
        $('body').on('click',function(e){
            if($(".gnb_my_lyr").parent().css('display')=="block"){
                if(!$(".gnb_my_lyr, .nick").has(e.target).length){
                    $(".gnb_my_lyr").parent().hide()
                }
            }
        });
    }


    // 카테고리 클릭했을시 실행할 함수 
    const open_cat = $("#open_cat");
    let open_cat_type = false;
    
//   카테고리 클릭하면 카테고리를 보여줌 
    function open_category(){
        if(!open_cat_type){
            if($("#category_display").css('display')=='none'){
                $("#category_display").css('display','block');
                $(open_cat).addClass('active');
                open_cat_type = true;
                close_category()
            }
        }
    }

    // 카테고리 오픈이 됐을시 다른곳 클릭하면 카테고리 사라짐 
    function close_category(){
        if(open_cat_type){
            $('body').on('click',function(e){
               if(!$(open_cat).has(e.target).length){
                    $("#category_display").css('display','none');
                    $(open_cat).removeClass('active');
                    open_cat_type = false;
               }
            })
        }
        
    }

    // 검색박스 포커스 되면 최근검색어, 인기검색어 보여줌 
    function searchbox(){
        const search = $('.com_search');
        search.focus(function(){
            $(".w_search_modal").css('display','block');
            $(search).css('border-bottom','1px solid rgb(0, 0, 0)')
            $(".search_circle").css('border-color','rgb(0, 0, 0)')
            $(".search_rectangle").css('border-color','rgb(0,0,0)')
        })
        search.focusout(function(){
            console.log('e')
            $(".w_search_modal").css('display','none');
            $(search).css('border-bottom','1px solid rgb(158, 164, 170)')
            $(".search_circle").css('border-color','rgb(158, 164, 170)')
            $(".search_rectangle").css('border-color','rgb(158, 164, 170)')
        })
    }

    function log_join(){
        const login= $(".login_btn").on('click',function(){
            location.href = "login/login.html"
        })
        const sign_up = $(".signup_btn").on('click',function(){
            location.href = "join/signup.html"
        })
    }
    function alarm_open(){ //알람 클릭하면 알람 페이지로 넘어가는거 
    	$("#alarm_btn").on('click',function(){
    		location.href = "/HelloMarket/alarm.jsp"; //href = alarm.jsp?alarm_count =<%=alarm_count%> 이렇게 넣는게 최종목표
    	})
    }
    $(".gnb_my_list_first").on('click',function(){ //얘는 자기 상점으로 
    	location.href = "/HelloMarket/mystore/index.jsp"
    })
    $(".gnb_my_list_second").on('click',function(){ //쿠폰으로
    	location.href = "/HelloMarket/mystore/coupon.jsp"
    })
    $(".gnb_my_member_level").on('click',function(){ //레벨로
    	location.href= "/HelloMarket/mystore/level.jsp"
    })
    
    
    function sell(userId) { //이건 판매하기 넘어가는거 

		if (userId != null) {
	
			location.href = "/HelloMarket/sell/sell.jsp";
	
		} else {
	
			alert("로그인해주세요!");
			location.href = "/HelloMarket/login/login.html";
	
		}

}
    
   
    function init(){
    	$(".gnb_my_lyr").css('cursor','pointer');
    	$(main_btn).css('cursor','pointer');
    	$(".gnb_my_list_first").css('cursor','pointer');
    	$(".gnb_my_list_second").css('cursor','pointer');
        silde_up_nick();
        $(nick_title).on('click',slide_nick)
        $(open_cat).on('click',open_category);
        searchbox()
        log_join()
        alarm_open()
    }
    $(document)
    init();
})