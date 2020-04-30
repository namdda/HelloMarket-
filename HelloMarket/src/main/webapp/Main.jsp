<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="User.*" %>   <!-- 페이지 import 하는거 잊지 말자 -->
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name = "viewport" content= "width-device-width", initial-scale="1">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>안녕마켓 - 100% 안전한 중고거래 장터</title>
  <link href="css/chunk.css" rel="stylesheet" type="text/css">
  <link href="css/slide.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<!--바디 부분이다!!!!-->
<body>
<%
	String userId = null;
	String userNick = null;
	int sellerLevel = 0;
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
		userNick = (String) session.getAttribute("userNick");
		sellerLevel = (int)session.getAttribute("sellerLevel");
	}
	
	%>
<%	
	
	
	AlarmDAO alarmDAO = new AlarmDAO();
	AlarmDTO alarmDTO = new AlarmDTO();
	
	
	int alarm_count =0; // 사용할 변수 선언하는거 (상자 이름)
	alarm_count =alarmDAO.AlarmNum(userId); // 함수 사용하는거
	
	int alarm_zero = 0;	
	
%>

  <div id="__next" style="height: auto !important;">
    <header class="">
      <div class="bar hide"></div>
      <section class="header_top">
        <div class="header_logo header_logo_s">
          <div class="log_box"><img src="img/MarketMain.png" class="logo" alt="헬로마켓"></div>
<%
	if(userId == null ){
%>
          <div class="btn_box">
          <a class="btn_login_box">
          <button class="login_btn">로그인</button>
          </a><a class="btn_signup_box"><button class="signup_btn">회원가입</button></a><a href="/msearch">
              <div class="notification_box"></div>
            </a></div>
<%
	}else{
%>
		<div class="btn_box">
    <div class="nick">
    	<img src="/HelloMarket/img/img_default_profile_60x60.png" width="36" height="36" alt="<%=userNick %>의 프로필 사진" class="profile_img">
    	<span class="nick_title"><%=userNick %>님</span>
    	</div>
    <div class="notification_box">
    	<a href="" target="_blank" rel="noopener noreferrer">
    		<img src="/HelloMarket/img/btn_title_hellotalk.png" alt="채팅 아이콘" class="chat">
        	<div class="chat_cnt">4</div>
        </a>
        <a id ="alarm_btn" target="_blank">
        	<img src="/HelloMarket/img/btn_title_notification.png" alt="알림목록 아이콘" class="alram">
            <div class="alram_cnt"><%=alarm_count%></div>
        </a></div>
</div>
<% 
	}
%>
          <div style="display: none;">
            <div class="gnb_my_lyr test_type">
                <div class="gnb_my_member_level">
                <%
	if(sellerLevel==1){
%>
		<img class="gnb_my_member_level_img" src="img/img_level1_30.png">
<% 
	}else if(sellerLevel ==2){
%>
		<img class="gnb_my_member_level_img" src="img/img_level2_30.png">
<% 
	}else{
%>
		<img class="gnb_my_member_level_img" src="img/img_level3_30.png">
<% 
	}
%>
                  <div><span class="level_description">나의등급</span><span class="level_description_name">화이트</span></div>
                </div>
              <ul class="gnb_my_list">
                  <li class="gnb_my_list_first">내상점</li>
                  <li class="gnb_my_list_second">할인쿠폰</li>
                  <li class="gnb_my_list_last">로그아웃</li>
              </ul>
            </div>
          </div>
          <div class="header_search" id="tebas">
            <div class="com_search_box">
                <div>
                    <div><input type="text" class="com_search" placeholder="어떤 상품을 찾고 계세요?" value=""
                            style="border-bottom: 1px solid rgb(158, 164, 170);">
                        <div class="search_icon_box">
                            <div class="search_icon">
                                <div class="search_circle" style="border-color: rgb(158, 164, 170);"></div>
                                <div class="search_rectangle" style="border-color: rgb(158, 164, 170);">
                                </div>
                            </div>
                        </div>
                        <div class="w_search_modal" style="display: none;">
                            <div>
                                <div class="search_contents">
                                    <div class="search_recent">
                                        <p>최근 검색</p>
                                        <ul>
                                            <div class="search_empty">우리조 1등 </div>
                                        </ul>
                                    </div>
                                    <div class="line"></div>
                                    <div class="search_popular">
                                        <p>인기 키워드</p>
                                        <ul>
                                            <li class=""><span>1</span> 눈누난나</li>
                                            <li class=""><span>2</span> ~@~@~@</li>
                                            <li class=""><span>3</span> !@#!@$</li>
                                            <li class=""><span>4</span> css 경로는 알아서</li>
                                            <li class=""><span>5</span> 메인페이지 누구함?</li>
                                            <li class=""><span>6</span> 프린터</li>
                                            <li class=""><span>7</span> jbl</li>
                                            <li class=""><span>8</span> 키보드</li>
                                            <li class=""><span>9</span> 에어컨</li>
                                            <li class="last_child"><span>10</span> 안마기</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_close">
                                <div>닫기</div>
                            </div>
        </div>
      </section>
      <section class="header_cat">
        <div class="header_wrapper">
          <div>
            <div class="btn_box header_wrapper_sub" id="open_cat">
              <input type="checkbox" class="cat_checkbox chkbox1">
              <i class="arrow"></i>
              <span for="cat_checkbox" class="selectbox">카테고리</span>
              <div style="display: none;" id="category_display">
                <div class="cat_list_box left_slidein">
                  <div class="mobile_nav">
                    <div class="cat_avt">
                      <ul class="cat_avt_top">
                        <li><a href="/search?sort=current">최신순 &gt;</a></li>
                        <li><a>가까운순 &gt;</a></li>
                      </ul>
                    </div>
                    <ul class="cat_list mobile_cat_list">
                      <li class="category"><a class="cat_link mobile_cat_link"
                          href="/m/hellopay.hm?type=seller&amp;status=open"><span class="category_text">헬로페이
                            거래내역</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/wallet/history"><span
                            class="category_text">전자지갑 · 결제관리</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/order/auto/sales/list.hm"><span
                            class="category_text">일반 결제내역</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/shipping.hm?type=sender"><span
                            class="category_text">배송관리</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/coupon"><span
                            class="category_text">할인쿠폰</span></a></li>
                    </ul>
                    <div class="mobile_category_line"></div>
                    <ul class="cat_list mobile_cat_list_none">
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAK0000"><img
                            src="/HelloMarket/img/cate_hak0000.png" alt="휴대폰, 테블릿" class="category_img"><span
                            class="category_text">휴대폰, 테블릿</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAD0000"><img
                            src="/HelloMarket/img/cate_had0000.png" alt="뷰티" class="category_img"><span
                            class="category_text">뷰티</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAA0000"><img
                            src="/HelloMarket/img/cate_haa0000.png" alt="여성의류" class="category_img"><span
                            class="category_text">여성의류</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAC0000"><img
                            src="/HelloMarket/img/cate_hac0000.png" alt="신발,가방,잡화" class="category_img"><span
                            class="category_text">신발,가방,잡화</span></a></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                    </ul>
                    <ul class="mobile mobile_sub_category">
                      <li><a href="/community/list.hm?category=DAC0002">이벤트</a><i class="arrow right_arrow"></i></li>
                      <li><a href="/community/list.hm?category=DAC0004">헬마뉴스</a><i class="arrow right_arrow"></i></li>
                      <li><a href="/help/faq.hm">헬프센터</a><i class="arrow right_arrow"></i></li>
                      <li><a href="./ad/index.html" target="_blank" rel="noopener noreferrer">광고센터</a><i
                          class="arrow right_arrow"></i></li>
                    </ul>
                    <ul class="logout_wrapper">
                      <li>
                        <div class="btn logout">로그아웃</div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="sellimg_sub_box header_wrapper_sub" onclick="sellimg('<%=userId%>')">
   			<script>
   		    function sellimg(userId) {

   				if (userId != null) {
   			
   					location.href = "/HelloMarket/sell/sell.jsp";
   			
   				} else {
   			
   					alert("로그인해주세요!");
   					location.href = "/HelloMarket/login/login.html";
   			
   				}

   		}
   			</script>
            <div class="selling_bot"><img src="/HelloMarket/img/ico_sell_camera_x2.png" alt="판매하기 이미지" class="selling_bot_img"><span
                class="selling_bot_text">판매하기</span></div>
          </div>
          <div class="link_box header_wrapper_sub">
            <ul>
              <li><a href="/community/list.hm?category=DAC0002&amp;status=begin">이벤트</a></li>
              <li><a href="/help/faq.html">헬프센터</a></li>
              <li><a href="/HelloMarket/ad/index.html" target="_blank" rel="noopener noreferrer"><img
                    src="/HelloMarket/img/ico_category_AD_x2.png" alt="광고센터 아이콘이미지">광고센터</a></li>
            </ul>
          </div>
        </div>
      </section>
    </header>







    <!-- 메인 이미지 영역이라 하신다~!!!!-->

    <section class="content" id="very_top">
      <h2>메인 이미지 영역</h2>

      <div class="banner_main_bg">
        <div class="banner_main_promotion">
          <div class="swiper-container banner_main_swipper">
            <div class="swiper-wrapper">
              <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                <div class="swiper-wrapper" id="banner" style="transform: translate3d(0px,0px,0px); transition-duration: 0ms;">
                  <div class="swiper-slide swiper-slide-active" style="width: 980px;">
                    <a href="" target="_blank">
                      <img src="img/slide_01.jpg" class="main_img">
                    </a>
                  </div>
                  <div class="swiper-slide swiper-slide-next" style="width: 980px;">
                    <a href="" target="_blank">
                      <img src="img/slide_02.jpg" class="main_img">
                    </a>
                  </div>
                  <div class="swiper-slide swiper-slide-next-next" style="width: 980px;">
                    <a href="" target="_blank">
                      <img src="img/slide_03.jpg" class="main_img">
                    </a>
                  </div>
                </div>
                <div class="swiper-pagination home_banner_pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-bullets-dynamic" style="width: 80px;">
                  <span class="swiper-pagination-bullet swiper-pagination-bullet-active swiper-pagination-bullet-active-main" tabindex="0" role="button" aria-label="Go to slide1" style="left: 16px;"></span>
                  <span class="swiper-pagination-bullet swiper-pagination-bullet-active-next" tabindex="0" role="button" aria-label="Go to slide 2" style="left: 16px;"></span>
                  <span class="swiper-pagination-bullet swiper-pagination-bullet-active-next-next" tabindex="0" role="button" aria-label="Go to slide 3" style="left: 16px;"></span>
                </div>
                <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false">
                  <svg xmlns="https://www.w3.org/2000/svg" viewBox="0 0 27 44">
                    <path d="M27,22L27,22L5,44l-2.1-2.1L22.8,22L2.9,2.1L5,0L27,22L27,22z"></path>
                </svg>
               </div>
               <div class="swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true">
                 <svg xmlns="https://www.w3.org/2000/svg" viewBox="0 0 27 44">
                    <path d="M0,22L22,0l2.1,2.1L4.2,22l19.9,19.9L22,44L0,22L0,22L0,22z"></path>
                 </svg>
              </div>
              </div>
            </div>
          </div> 
        </div>
      </div>

  

      <!-- 리스트 메인 에리어-->
      <div class="main_area">
        <div class="main_area_center">
          <div class="main_home">
            <h1>헬로마켓 - 100% 안전한 중고거래 장터</h1>
            <h2>모바일 중고나라, 무료나눔이 많은 직거래 중고장터</h2>
            <div>
              <div class="infinite-scroll-component " style="height: auto; overflow: auto;">
                <ul class="mian_row">
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166023635?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=2">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimg.hellomarket.com/images/2020/item/03/14/21/0640174_4271581_1.jpg?size=s4"
                                alt="201. 아이폰XS/ 64GB/ 화이트/ 35만/ 부산" class="thumbnail_img"></div>
                            <div class="dealer_text_position">
                              <div class="dealer_text">전문</div>
                            </div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">201. 아이폰XS/ 64GB/ 화이트/ 35만/ 부산</div>
                          <div class="item_price">350,000원</div>
                        </div>
                      </div>
                    </a></li>


                  <li class="main_col_4" style="height: auto;"><a class="card"
                      href="https://l.hellomarket.com/?t=browser&amp;u=https%3A%2F%2Fm.lifeplanet.co.kr%3A444%2Fproducts%2Fpg%2FPG37000S.dev%3Fsrc%3Dimage%26kw%3D0155EE%26inflow%3DM4%26utm_source%3Dhellomarket%26utm_medium%3Dda%26utm_campaign%3D10037%26utm_content%3D202000177&amp;cpn=31&amp;img=2099&amp;grp=1268&amp;spr=4501&amp;mid=4875325-KR&amp;ban=1571"
                      target="_blank" rel="noopener noreferrer"><img
                        src="https://ccimg.hellomarket.com/images/2020/ad/03/13/20/34_205225373.jpg" alt="이벤트 이미지"
                        class="feed_img"></a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166032758?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=4">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimg.hellomarket.com/images/2020/item/03/15/17/4135790_3418186_1.jpg?size=s4"
                                alt="백설공주 주방놀이" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">백설공주 주방놀이</div>
                          <div class="item_price">10,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166024075?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=5">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimg.hellomarket.com/images/2020/item/03/14/21/4452276_1475541_1.jpg?size=s4"
                                alt="정품 구찌 머니클립" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">정품 구찌 머니클립</div>
                          <div class="item_price">100,000원</div>
                        </div>
                      </div>
                    </a>

                  </li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166022975?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=6">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimg.hellomarket.com/images/2020/item/03/14/20/0656859_4586718_1.jpg?size=s4"
                                alt="남성코트 세거입니다" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">남성코트 세거입니다</div>
                          <div class="item_price">20,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039229?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=7">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/4104023_4781257_1.jpg?size=s4"
                                alt="구찌시계" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">구찌시계</div>
                          <div class="item_price">250,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166035509?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=8">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimg.hellomarket.com/images/2020/item/03/15/21/2904092_833083_1.jpg?size=s4"
                                alt="LG  드럼세탁기" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">LG 드럼세탁기</div>
                          <div class="item_price">50,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166028327?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=9">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimg.hellomarket.com/images/2020/item/03/15/11/3012277_2720017_1.jpg?size=s4"
                                alt="아이폰7플러스 256 제트블랙" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">아이폰7플러스 256 제트블랙</div>
                          <div class="item_price">320,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166007291?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=escrow&amp;feedPosition=10">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/13/16/3506897_1369791_1.jpg?size=s4"
                                alt="243번. 아이패드 2대+ 한솔교육 태블릿, 부품용" class="thumbnail_img"></div>
                            <div class="dealer_text_position"><img
                                src="https://ccimage.hellomarket.com/web/2019/item/ico_badge_thumbnail_hellopay.png"
                                alt="헬로페이 아이콘">
                              <div class="dealer_text">전문</div>
                            </div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">243번. 아이패드 2대+ 한솔교육 태블릿, 부품용</div>
                          <div class="item_price">25,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166013468?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=escrow&amp;feedPosition=11">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/02/19/5610264_2422616_2.jpg?size=s4"
                                alt="5장(반세트) 남녀공용 코로나 연예인 마스크 무료배송,당일발송(헬페환영)" class="thumbnail_img"></div>
                            <div class="dealer_text_position"><img
                                src="https://ccimage.hellomarket.com/web/2019/item/ico_badge_thumbnail_hellopay.png"
                                alt="헬로페이 아이콘">
                              <div class="dealer_text">전문</div>
                            </div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">5장(반세트) 남녀공용 코로나 연예인 마스크 무료배송,당일발송(헬페환영)</div>
                          <div class="item_price">15,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166005309?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=12">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/13/14/5050641_2268472_1.jpg?size=s4"
                                alt="세이코 Seiko , japan (정리합니다~~~)" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">세이코 Seiko , japan (정리합니다~~~)</div>
                          <div class="item_price">35,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166026448?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=13">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/15/02/2922908_3956063_1.jpg?size=s4"
                                alt="겐조 맨투맨" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">겐조 맨투맨</div>
                          <div class="item_price">110,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/auto/item/166023580?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=14">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/21/0205981_4864437_1.jpg?size=s4"
                                alt="쌍용 코란도 투리스모 9인승 디젤 2.2 4WD RX" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">쌍용 코란도 투리스모 9인승 디젤 2.2 4WD RX</div>
                          <div class="item_price">2,100만원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166033843?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=15">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/15/19/0404278_3142812_1.jpg?size=s4"
                                alt="보이스 캐디  거리측정기 L3 15만원" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">보이스 캐디 거리측정기 L3 15만원</div>
                          <div class="item_price">150,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166019513?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=16">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/15/3744248_1729763_1.jpg?size=s4"
                                alt="김수자 스페셜 온열  효도손 안마기 JCUVE-0500" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">김수자 스페셜 온열 효도손 안마기 JCUVE-0500</div>
                          <div class="item_price">100,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166018697?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=17">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/14/2703894_3681148_1.jpg?size=s4"
                                alt="(정품)부산 나이키에어맥스 베이퍼맥스 런 유틸리티 285" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">(정품)부산 나이키에어맥스 베이퍼맥스 런 유틸리티 285</div>
                          <div class="item_price">100,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039432?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=18">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/11/0120801_1274152_1.jpg?size=s4"
                                alt="마스크 소형 팔아요." class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">마스크 소형 팔아요.</div>
                          <div class="item_price">35,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166011801?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=19">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/13/21/1733753_935207_1.jpg?size=s4"
                                alt="필터교체 가능한 면마스크 직접만들었어요 핸드메이드 면마스크" class="thumbnail_img"></div>
                            <div class="dealer_text_position"><img
                                src="https://ccimage.hellomarket.com/web/2019/item/ico_badge_thumbnail_hellopay.png"
                                alt="헬로페이 아이콘">
                              <div class="dealer_text">전문</div>
                            </div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">필터교체 가능한 면마스크 직접만들었어요 핸드메이드 면마스크</div>
                          <div class="item_price">5,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166024044?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=20">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/21/4226991_4829672_1.jpg?size=s4"
                                alt="(비닐안뜯은 새제품)건담프라모델 일본면세점구매" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">(비닐안뜯은 새제품)건담프라모델 일본면세점구매</div>
                          <div class="item_price">20,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039170?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=21">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/3328299_788806_1.jpg?size=s4"
                                alt="메트로시티 가방 보증서포함" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">메트로시티 가방 보증서포함</div>
                          <div class="item_price">200,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166036786?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=22">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/15/23/2700454_4879459_1.jpg?size=s4"
                                alt="노트9 클리어뷰. led뷰 케이스 새상품" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">노트9 클리어뷰. led뷰 케이스 새상품</div>
                          <div class="item_price">25,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039086?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=23">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/2308927_4867055_1.jpg?size=s4"
                                alt="에티카 마스크 대형(아이보리).중형(화이트)" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">에티카 마스크 대형(아이보리).중형(화이트)</div>
                          <div class="item_price">5,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039349?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=24">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/5340981_4845354_1.jpg?size=s4"
                                alt="루이지맨션3 닌텐도 스위치 택포" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">루이지맨션3 닌텐도 스위치 택포</div>
                          <div class="item_price">50,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/ad/item/164949092?viewPath=main_feed">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2019/item/12/12/11/3207_4496228_1.jpg?size=s4"
                                alt="방수비데 특가판매!!   13만원!!! (엔지니어 무료설치)" class="thumbnail_img"></div>
                          </div><img src="https://ccimage.hellomarket.com/web/2019/ad/img_thumbnail_badge_ad_x2.png"
                            alt="AD 아이콘" class="ad_image_icon">
                        </div>
                        <div class="cont">
                          <div class="item_ad_direct_title">방수비데 특가판매!! 13만원!!! (엔지니어 무료설치)</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039195?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=26">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/3644706_3448384_1.jpg?size=s4"
                                alt="나마스떼 루프탑텐트 입니다" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">나마스떼 루프탑텐트 입니다</div>
                          <div class="item_price">700,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166036009?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=27">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/15/22/1150335_1814805_1.jpg?size=s4"
                                alt="ASUS 게이밍노트북 팝니다" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">ASUS 게이밍노트북 팝니다</div>
                          <div class="item_price">500,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166023727?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=28">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/21/1531642_2062647_1.jpg?size=s4"
                                alt="23000원짜리 방탄굿즈 만원에 사가세요" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">23000원짜리 방탄굿즈 만원에 사가세요</div>
                          <div class="item_price">10,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/ad/item/165421477?viewPath=main_feed">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/02/07/23/0641693_3344324_1.jpg?size=s4"
                                alt="유명브랜드 골라 입는 재미가 있다." class="thumbnail_img"></div>
                          </div><img src="https://ccimage.hellomarket.com/web/2019/ad/img_thumbnail_badge_ad_x2.png"
                            alt="AD 아이콘" class="ad_image_icon">
                        </div>
                        <div class="cont">
                          <div class="item_ad_direct_title">유명브랜드 골라 입는 재미가 있다.</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039309?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=escrow&amp;feedPosition=30">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/4923182_2744982_1.jpg?size=s4"
                                alt="일본 마스크 소형 장당 1500 (pm2.5 대응)" class="thumbnail_img"></div>
                            <div class="dealer_text_position"><img
                                src="https://ccimage.hellomarket.com/web/2019/item/ico_badge_thumbnail_hellopay.png"
                                alt="헬로페이 아이콘"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">일본 마스크 소형 장당 1500 (pm2.5 대응)</div>
                          <div class="item_price">90,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166018334?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=31">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/13/5612120_4130725_1.jpg?size=s4"
                                alt="소니엑스페리아xz2 기기단품(상태좋음)" class="thumbnail_img"></div>
                            <div class="dealer_text_position"><img
                                src="https://ccimage.hellomarket.com/web/2019/item/ico_badge_thumbnail_hellopay.png"
                                alt="헬로페이 아이콘">
                              <div class="dealer_text">전문</div>
                            </div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">소니엑스페리아xz2 기기단품(상태좋음)</div>
                          <div class="item_price">145,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166021076?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=32">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/17/4358204_390651_1.jpg?size=s4"
                                alt="LG 그램 17Z990-VA76K(i7 8세대.램16G.SSD512GB)" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">LG 그램 17Z990-VA76K(i7 8세대.램16G.SSD512GB)</div>
                          <div class="item_price">1,500,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166027112?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=33">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/15/07/3707797_4842449_1.jpg?size=s4"
                                alt="1천원급처! 유니클로 반팔(m)" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">1천원급처! 유니클로 반팔(m)</div>
                          <div class="item_price">1,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039352?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=34">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/5411119_3470185_1.jpg?size=s4"
                                alt="❤개인/슬림제품/고성능❤삼성 화이트 노트북❤" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">❤개인/슬림제품/고성능❤삼성 화이트 노트북❤</div>
                          <div class="item_price">350,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166014665?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=35">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/03/0416913_4428120_1.jpg?size=s4"
                                alt="갤럭시s8플러스 64기가 블루 게임폰 세컨폰 갤럭시s8+" class="thumbnail_img"></div>
                            <div class="dealer_text_position">
                              <div class="dealer_text">전문</div>
                            </div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">갤럭시s8플러스 64기가 블루 게임폰 세컨폰 갤럭시s8+</div>
                          <div class="item_price">90,000원</div>
                        </div>
                      </div>
                    </a></li>

                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/ad/item/165829345?viewPath=main_feed">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/02/28/20/4933162_4859448_1.jpg?size=s4"
                                alt="■ 강남권 최대규모 롯데 지식산업센터 분양 ■ 마감임박" class="thumbnail_img"></div>
                          </div><img src="https://ccimage.hellomarket.com/web/2019/ad/img_thumbnail_badge_ad_x2.png"
                            alt="AD 아이콘" class="ad_image_icon">
                        </div>
                        <div class="cont">
                          <div class="item_ad_direct_title">■ 강남권 최대규모 롯데 지식산업센터 분양 ■ 마감임박</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039313?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=37">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/4938859_4757526_1.jpg?size=s4"
                                alt="아이패드 에어2, 64기가급하게 판매해요" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">아이패드 에어2, 64기가급하게 판매해요</div>
                          <div class="item_price">270,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166024445?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=38">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/22/1650320_3976912_1.jpg?size=s4"
                                alt="수딩 파우더" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">수딩 파우더</div>
                          <div class="item_price">7,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039289?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=39">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/4729219_4788942_1.jpg?size=s4"
                                alt="레깅스" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">레깅스</div>
                          <div class="item_price">13,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166023658?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=40">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/21/0850442_4434124_1.jpg?size=s4"
                                alt="핑크 레이스 원피스 (새상품)" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">핑크 레이스 원피스 (새상품)</div>
                          <div class="item_price">15,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166024485?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=41">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/22/2022422_4160952_1.jpg?size=s4"
                                alt="인형팔아요~" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">인형팔아요~</div>
                          <div class="item_price">5,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166020704?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=42">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/17/0649616_45851_1.jpg?size=s4"
                                alt="아담스 3번우드 19도 flex-S" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">아담스 3번우드 19도 flex-S</div>
                          <div class="item_price">60,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/ad/item/165563701?viewPath=main_feed">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/02/06/10/3120_3242787_12.jpg?size=s4"
                                alt="✔1만원✔5천원✔파격가한정판매" class="thumbnail_img"></div>
                          </div><img src="https://ccimage.hellomarket.com/web/2019/ad/img_thumbnail_badge_ad_x2.png"
                            alt="AD 아이콘" class="ad_image_icon">
                        </div>
                        <div class="cont">
                          <div class="item_ad_direct_title">✔1만원✔5천원✔파격가한정판매</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/auto/item/166039105?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=44">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/2506668_4034767_1.jpg?size=s4"
                                alt="현대 NF 쏘나타 트랜스폼 LPi N20 렌트 럭셔리" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">현대 NF 쏘나타 트랜스폼 LPi N20 렌트 럭셔리</div>
                          <div class="item_price">190만원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166039090?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=45">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/16/10/2323598_2054210_1.jpg?size=s4"
                                alt="마스크" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">마스크</div>
                          <div class="item_price">2,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166033468?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=46">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/15/18/3456207_939630_4.jpg?size=s4"
                                alt="스타벅스 포레스트레터 텀블러 판매합니다 ^^" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">스타벅스 포레스트레터 텀블러 판매합니다 ^^</div>
                          <div class="item_price">10,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166017237?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=47">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/12/1707698_2805474_1.jpg?size=s4"
                                alt="코오롱스포츠 여상티셔츠(새제품)" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">코오롱스포츠 여상티셔츠(새제품)</div>
                          <div class="item_price">33,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166003134?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=48">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/13/11/4110829_4502666_1.jpg?size=s4"
                                alt="방탄소년단 책" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">방탄소년단 책</div>
                          <div class="item_price">15,000원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166035860?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=49">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/15/22/0020046_3609048_1.jpg?size=s4"
                                alt="국내 식약청승인 덴탈마스크 팔아요" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">국내 식약청승인 덴탈마스크 팔아요</div>
                          <div class="item_price">1,100원</div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/ad/item/162899594?viewPath=main_feed">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/13/10/3144916_3950688_1.jpg?size=s4"
                                alt="최고급 프리미엄진 BLUE2000 " class="thumbnail_img"></div>
                          </div><img src="https://ccimage.hellomarket.com/web/2019/ad/img_thumbnail_badge_ad_x2.png"
                            alt="AD 아이콘" class="ad_image_icon">
                        </div>
                        <div class="cont">
                          <div class="item_ad_direct_title">최고급 프리미엄진 BLUE2000 </div>
                        </div>
                      </div>
                    </a></li>
                  <li class="main_col_4" style="height: auto;"><a class="card card_list"
                      href="/item/166020157?viewPath=main_feed&amp;feedType=ranking&amp;featuredFeedType=RankingItem&amp;escrowType=common&amp;feedPosition=51">
                      <div class="card_box">
                        <div class="image_wrapper">
                          <div class="image_outside">
                            <div class="image_centerbox"><img
                                src="https://ccimage.hellomarket.com/web/2018/main/img_default_thumbnail_495x495.png"
                                data-src="https://ccimg.hellomarket.com/images/2020/item/03/14/16/2557354_1613356_1.jpg?size=s4"
                                alt="lg 티비 수원직거래 팝니다" class="thumbnail_img"></div>
                            <div class="dealer_text_position"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title">lg 티비 수원직거래 팝니다</div>
                          <div class="item_price">70,000원</div>
                        </div>
                      </div>
                    </a></li>
                </ul>
              </div>
            </div>



            <!-- 제가 다운 받은 리스트 최종 -->

            <div class="scroll_top_btn_warpper">
              <div class="scroll_top_btn"><a href="#very_top"><img src="img/btn_top_n_x2.png" alt="페이지 업 버튼"></a></div>
            </div>

            <div class="ad_banner_absolute" style="top: -207px;">
              <div class="ad_banner"><a href="ad/direct/content.html" target="_blank" rel="noopener noreferrer"><img
                    src="img/img_banner_main_ad_0903_x2.png" alt="회원직접광고 배너 이미지"></a></div>
            </div>
            <div class="police_banner_absolute" style="top: 30px;">
              <div class="police_banner">
                <div><img src="img/img_main_banner_crime_prevention_day_1_x2.jpg" alt="경찰청&nbsp;배너&nbsp;이미지"></div>
              </div>
            </div>

            <!-- 여기다 푸터 넣으면 잘 된다 하더라!-->
            <div class="footer">
              <div class="footer_area">
                <div class="footer_top">
                  <div class="f_wrapper">
                    <ul class="f_left">
                      <li><a href="http://company.hellomarket.com" class="link_info" target="_blank"
                          rel="noopener noreferrer">Hellomarket Inc.</a></li>
                      <li><a class="link_info" href="/help/faq.hm">FAQ</a><span class="list_space"></span></li>
                      <li><a class="link_info" href="/terms.hm">이용약관</a><span class="list_space"></span></li>
                      <li><a class="link_info" href="/protection.hm">개인정보 처리방침</a></li>
                    </ul>
                    <ul class="f_right">
                      <li><a href="https://itunes.apple.com/kr/app/id469381475?mt=8&amp;ls=1" target="_blank"
                          rel="noopener noreferrer"><img
                            src="https://ccimage.hellomarket.com/web/2017/common/img_footer_appstore.png" alt="appstore"
                            class="appstore_n_btn"></a></li>
                      <li><a href="https://play.google.com/store/apps/details?id=com.tuck.hellomarket" target="_blank"
                          rel="noopener noreferrer"><img
                            src="https://ccimage.hellomarket.com/web/2017/common/img_footer_googleplay.png"
                            alt="googleplay" class="googleplay_n_btn"></a></li>
                      <li><a href="https://blog.naver.com/tuckandco" target="_blank" rel="noopener noreferrer"><img
                            src="https://ccimage.hellomarket.com/web/2019/footer/img_naver_gray_blog.png"
                            alt="naverblog" class="naver_blog_n_btn"></a></li>
                    </ul>
                  </div>
                </div>
                <div class="footer_bottom">
                  <div class="f_wrapper">
                    <div class="footer_wrapper_left">
                      <div class="fb_logobox"><img
                          src="https://ccimage.hellomarket.com/web/2017/common/footer/img_footer_logo_171127.png"
                          alt="hellomarket"></div>
                      <ul class="footer_company_info">
                        <li><span>(주)헬로마켓 대표이사 : 이후국 | </span><span>서울특별시 마포구 와우산로 25길 7 서문빌딩 502호</span></li>
                        <li><span>사업자등록번호 : 105-87-56305</span><span>통신판매업신고번호 : 제2011-서울마포-1010호 <a
                              href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058756305" class="link_info"
                              target="_blank" rel="noopener noreferrer"
                              style="text-decoration: underline;">사업자정보확인</a></span></li>
                        <li><span>헬로페이 문의 : 02-324-4090</span><span>(평일 10시~16시) | 팩스 : 02-3141-4090</span></li>
                        <li><span>일반문의: <a href="https://www.hellomarket.com/help/inquiry/form.hm" target="_blank"
                              rel="noopener noreferrer" style="text-decoration: underline;">헬프센터 - 문의</a></span><span> |
                            <a href="https://www.hellomarket.com/help/inquiry/form.hm?categoryId=IGA0200"
                              target="_blank" rel="noopener noreferrer"
                              style="text-decoration: underline;">제휴문의</a></span></li><br>
                        <li><span>(주)헬로마켓은 통신판매중개자로서 거래당사자가 아니며, 판매자가 등록한 상품정보 및 거래에 대해 (주)헬로마켓은 일체 책임을 지지 않습니다.</span>
                        </li>
                        <li><span>©(주)헬로마켓. All rights reserved.</span></li>
                      </ul>
                    </div>
                    <div class="footer_wrapper_right">
                      <ul class="box">
                        <li style="font-weight: bold;">기업은행 구매 안전 서비스 (채무지급보증)</li>
                        <li>안전거래를 위해 현금 등으로 결제 시,</li>
                        <li>저희 사이트에서 가입한 기업은행의</li>
                        <li>구매안전서비스를 이용하실 수 있습니다.</li>
                        <li><img src="https://ccimage.hellomarket.com/web/2017/common/footer/btn_footer_service_n.png"
                            alt="services" class="footer_service_btn"></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>





        </div>
      </div>
  </div>
  </section>


  <!— 푸터 찾았다!!!!!—>

</body>
<script src="js/common.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="js/scrolling.js"></script>
</html>