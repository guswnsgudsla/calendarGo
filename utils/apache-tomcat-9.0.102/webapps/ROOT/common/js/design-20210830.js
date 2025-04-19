
var bigdata = bigdata || {};

bigdata = {

    common : function(){
      // topBtn
      $("#topBtn").click(function(){
        $("html, body").animate({scrollTop: 0}, 500);
        return false;
      });
      
    },

    resize : function(){
      // Add class if screen size equals
      var $window = $(window),
      $html = $('html'),
      $body = $('body');

      function resize() {
        
        tableH();

        if ($window.width() < 500) {
          return $html.attr( "class","mobile" );
        }
        else if ($window.width() > 500 && $window.width() < 1023) {
          return $html.attr( "class", "tab" );
        }
        else if ($window.width() > 1023) {
          return $html.attr( "class", "pc" ),
                $body.removeClass("mMenu_open"),
                $body.removeClass("smap"),
                $(' #header .hd_w ').removeClass("mo_sch_open");  
        };        

      };

      function tableH() {

        $(' .st_tb_db .in_tb ').each(function(index,value) {
          
          $(this).css('min-height', 0 );

          var $tdH = $(this).parent(' li ').outerHeight(true);
  
          $(this).css('min-height', $tdH );
    
        });
        
      };

      $window.resize(resize).trigger('resize');
    },

    hdSearch : function(){
      $(' #header .hd_line1 .hd_sch_w .sch_ip ').focus(function(){ 
        $( ' #header .hd_line1 .hd_sch_w .sch_ip ' ).parents(' .hd_sch_w ').removeClass(' off ').addClass(' ac ');
      });
      $(' #header .hd_line1 .hd_sch_w .sch_ip ').on('blur', function() { 
        $(this).val(''); $(this).text(''); 
        $( ' #header .hd_line1 .hd_sch_w .sch_ip ' ).parents(' .hd_sch_w ').removeClass(' ac ');
      });
    },

    gnb : function(){
      // gnb
      var $header = $("#header .hd_line2"),
      $headerWrap = $(".gnb_w"),
      $gnb = $(".gnb"),
      $depth1 = $(".gnb > li"),
      $depth2List = $(".gnb .dep2_w .dep2_list"),
      $depth2 = $(".gnb .dep2_list > li"),
      $depth = $(".gnb .dep2_list .depth");

      // 1뎁스 마우스 hover
      $depth1.on("mouseenter", function(){
        //1뎁스 활성화
        $(this).addClass("on").siblings().removeClass("on");

        // 2뎁스 노출 & 활성화
        $depth2List.addClass("on");
        $(this).children(".dep2_w").addClass("active").siblings().removeClass("active");

        // gnb 활성화시 높이값
        var _dep2Len = $depth2List.eq(1).children($depth2).length,
            _dep2H = $(".gnb .dep2_list > li").outerHeight(true);

        $depth2List.height( _dep2Len * _dep2H + 40 );

        // headerWrap 높이증가
        $headerWrap.addClass("over");
        $headerWrap.height( _dep2Len * _dep2H + $header.height() + 40 );
      });

      // 2뎁스 활성화
      $depth.on("click", function(){
        $(this).toggleClass(' ac ');        
      });

      // 1뎁스 마우스 벗어날시
      $depth1.on("mouseleave", function(){
        $depth2List.removeClass("active");
      });

      // gnb 마우스 벗어날시 (초기화)
      $gnb.on("mouseleave", function(){
          $depth1.removeClass("on");
      });

      // headerWrap 마우스 벗어날시
      $headerWrap.on("mouseleave", function(){
          $headerWrap.removeClass("over").height($header.height());
          $depth2List.removeClass("on").css({height : 0});
      });

      // gnb scrollEvt
      var $window = $(window),
      $body = $("body");

      $window.on("scroll", function(){
          var _scrollTop = $(this).scrollTop();

          if(_scrollTop > 0){
              $body.attr("data-scroll", "down");
              $(".header_wrap").addClass("fixed");
          }else{
              $body.attr("data-scroll", "up");
              $(".header_wrap").removeClass("fixed");
          }
      });
    },

    burger : function(){
      $(' .hd_w .burger_menu_all a.burger_open ').click (function(){  
        $( '.sitemap' ).show();              
        $( ' body ' ).addClass( 'smap' );   
        $( '.hd_w' ).addClass( 'open' );           
      });
    },
   

    sitemap : function(){
      $(' .sitemap .btn_close ').click (function(){ 
        $( ' body ' ).removeClass(' smap ');
        $( '.hd_w' ).removeClass( 'open' );     
        $( '.sitemap' ).hide();              
        $( '.sitemap .sitemap_gnb li' ).removeClass( 'on ac' );     
      });

      // 1뎁스 마우스 hover
      $(' .sitemap .sitemap_gnb > li ').on("mouseenter", function(){

        //뎁스 활성화
        $(this).addClass("on").siblings().removeClass("on");   
        
      });

      // 1뎁스 마우스 click
      $(' .sitemap .sitemap_gnb > li .dep1_a_w ').on("click", function(){

        //뎁스 활성화
        $(this).parents('li').toggleClass("ac").siblings().removeClass("ac");   
        
      });


      // 2뎁스 마우스 click
      $(' .sitemap .sitemap_gnb .dep2_list .dep2_a ').on("click", function(){

        //뎁스 활성화
        $(this).parent('li').toggleClass("ac").siblings().removeClass("ac");   
        
      });

      // 2뎁스 마우스 hover
      $(' .sitemap .dep2_list > li ').on("mouseenter", function(){

        //뎁스 활성화
        $(this).addClass("on").siblings().removeClass("on");   
        
      });

      // 3뎁스 마우스 벗어날시 (초기화)
      $(' .sitemap .dep2_list > li ').on("mouseleave", function(){

        $(this).removeClass("on");   
        
      });

      // gnb 마우스 벗어날시 (초기화)
      $(' .sitemap .sitemap_gnb ').on("mouseleave", function(){
        $(' .sitemap .sitemap_gnb > li').removeClass("on");
      });
  
    },

    mo : function(){
      $(' #header .hd_btn_list .btn_search ').click (function(){ 
        $( ' #header .hd_w ' ).addClass(' mo_sch_open ');
      });
      $(' #header .hd_btn_list .btn_search_close ').click (function(){ 
        $( ' #header .hd_w ' ).removeClass(' mo_sch_open ');
      });  
      $(' #header .hd_btn_list .btn_menu ').click (function(){ 
        $( ' body ' ).addClass(' smap ');
      });    
    },

    popup : function(){

      $('.layer_popup > .w').each(function(index,value) {
        var $popBoxH = $(this).children('.popup_box').outerHeight(true);

        $(this).css('min-height', $popBoxH + 40);
  
      });

    },

    location : function(){ /* page location */

      $(' .p_location .this > a ').click (function(){  
        $( this ).toggleClass(' ac ').siblings(' .depth_w  ').slideToggle( "fast" );
      });
      
    },

    toggleCnt : function(){

      $(' .btn_toggle ').click (function(){  
        $( this ).toggleClass(' ac ').parents('.toggle_w').find(' .toggle_cnt ').slideToggle( "fast" );
      });
      
    },

    listOrder : function(){

      $(' .list_order_w a.btn_list  ').click (function(){  
        $( this ).addClass(' ac ').siblings(' a ').removeClass(' ac ').parents(' .order_list ').removeClass(' block ').addClass(' list ');
      });

      $(' .list_order_w a.btn_block  ').click (function(){  
        $( this ).addClass(' ac ').siblings(' a ').removeClass(' ac ').parents(' .order_list ').removeClass(' list ').addClass(' block ');
      });
      
    },

    faq : function(){

      $(' .atc_faq_list .faq_q a').click (function(){  

        $( this ).parents(' .atc_faq_list .faq_q ').toggleClass(' ac ').siblings(' .atc_faq_list .faq_q ').removeClass(' ac ');

      });

    },

    //tab    
    tab : function(){

      $(".tab a").click(function() {
        var $acTab = $(this).attr("href"); 
        
        $( this ).parents('.tab_w').find('.tab_cnt').hide(); 		
        $( this ).parent(' li ').addClass('ac').siblings('li').removeClass('ac');
        $( $acTab ).show();
        return false;	
      });  

    },

    init : function(){
      bigdata.common();
      bigdata.resize();      
      bigdata.hdSearch();
      bigdata.gnb();
      bigdata.burger();
      bigdata.sitemap();
      bigdata.mo();
      bigdata.popup();
      bigdata.location();
      bigdata.toggleCnt();
      bigdata.listOrder();
      bigdata.faq();
      bigdata.tab();
      
    }
};

$(window).on('load', function(){ 
	
  bigdata.init();

  var winW = $(window).width();
  var winH = $(window).height();
  var hdH = $(' #header ').height();
  var ftH = $(' #footer ').height();


  $(' .content_w  ').css({
    'min-height' : winH - hdH - ftH
  });
  
});
