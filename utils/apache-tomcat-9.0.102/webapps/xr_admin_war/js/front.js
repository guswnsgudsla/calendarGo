var Browser = {chk : navigator.userAgent.toLowerCase()}
Browser = {ie : Browser.chk.indexOf('msie') != -1, ie6 : Browser.chk.indexOf('msie 6') != -1, ie7 : Browser.chk.indexOf('msie 7') != -1, ie8 : Browser.chk.indexOf('msie 8') != -1, ie9 : Browser.chk.indexOf('msie 9') != -1, ie10 : Browser.chk.indexOf('msie 10') != -1, ie11 : Browser.chk.indexOf('msie 11') != -1, opera : !!window.opera, safari : Browser.chk.indexOf('safari') != -1, safari3 : Browser.chk.indexOf('applewebkir/5') != -1, mac : Browser.chk.indexOf('mac') != -1, chrome : Browser.chk.indexOf('chrome') != -1, firefox : Browser.chk.indexOf('firefox') != -1}
var responCheck = Browser.ie7 || Browser.ie8;

// mobile case :: scroll size
var mobile = (/iphone|ipod|ipad|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()));
if (mobile) {
  $("html").addClass("mobile");
}

if (Browser.ie7) {
  $("html").addClass("ie7");
} else if(Browser.ie8){
  $("html").addClass("ie8");
} else if(Browser.ie9){
  $("html").addClass("ie9");
} else if(Browser.ie10){
  $("html").addClass("ie10");
} else {
  // mordern brow.
} function lowMsg(){
  //document.write('<div style="position:absolute; top:0; right:0; border:3px solid black">ie7/8</div>');
}
var admin = admin || {
    init: function () {
        admin.nav.event();
        admin.fmFocus();


        admin.datepicker();
        admin.checkAll();
        admin.tab.init();
        admin.accordion();
        admin.tableAccordion();
        admin.controlWrap();

        admin.treeView();
    },
    nav:{
        event: function(){
            $("nav li a").on("click", function () {
                $(this).parent().addClass("active").siblings().removeClass("active");
            });
        },
        pageOpen: function (i, j) {
            $("nav li")
                .eq(i)
                .addClass("active")
                .find(".depth a")
                .eq(j)
                .addClass("active");
        },

    },//nav

    lnb: function (i, j) {
        var _nav = $(".container aside");
        $("nav li")
            .eq(i)
            .addClass("active")
            .find(".depth a")
            .eq(j)
            .addClass("active");

        $("nav li a").on("click", function () {
            $(this).parent().addClass("active").siblings().removeClass("active");
        });
    }, //lnb
    fmFocus: function () {
        if ($(".fm-focus").length == 0) {
            return;
        }
        $(".fm-focus *")
            .focusin(function () {
                if ($(this).prop("readonly") == true) {
                    return;
                } else {
                    $(this).closest(".fm-focus").addClass("focus");
                }
            })
            .focusout(function () {
                $(this).closest(".fm-focus").removeClass("focus");
            });
    }, //focus
    datepicker: function () {
        if ($(".datepicker").length == 0) {
            return;
        }
        $(".datepicker input.fm-control").datepicker();
        $.datepicker.setDefaults({
            dateFormat: "yy-mm-dd",
            prevText: "이전 달",
            nextText: "다음 달",
            monthNames: [
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월",
            ],
            monthNamesShort: [
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월",
            ],
            dayNames: ["일", "월", "화", "수", "목", "금", "토"],
            dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            showMonthAfterYear: true,
            yearSuffix: "년",
        });
    }, //datepicker
    checkAll:function(){
        if($('.check-all-wrap').length == 0){return;}
        $('#checkAll').on('click', function(){
            $('.check-all-wrap input[type="checkbox"]').prop('checked', $(this).prop('checked'));
        });
        $('.check-all input[type="checkbox"], tbody input[type="checkbox"]').on('click', function(){
            var $length = $('.check-all input[type="checkbox"], tbody input[type="checkbox"]').length,
                $checked = $('.check-all input[type="checkbox"]:checked, tbody input[type="checkbox"]:checked').length;
            if($length === $checked){
                $('#checkAll').prop('checked', true);
            }else{
                $('#checkAll').prop('checked', false);
            }
        });
    },//checkAll
    tab: {
        init: function () {
            if ($(".as-tab-wrap").length == 0) {
                return;
            }
            $tabEle = $(".tab-menu li");
            $tabEleElex = $(".tab-menu.flexible");
            this.event();
        },
        event: function () {
            var tab = this;
            $tabEle.find('a[href^="#"]').click(function (e) {
                e.preventDefault();
            });
            $tabEle.on("click", function (e) {
                tab.action(
                    $(this),
                    $(this).closest(".tab-menu").find("li").index(this)
                );
            });
            $tabEle.not(":hidden").each(function () {
                if ($(this).parent(".tab-menu").hasClass("flexible")) {
                    return;
                } else {
                    var menuEa = $(this).parent(".tab-menu").find("li").length;
                    var menuSize = 100 / menuEa;
                    $(this)
                        .parent(".tab-menu")
                        .find("li")
                        .width(menuSize + "%");
                }
            });
            if ($tabEle.hasClass("active")) {
                $(".as-tab-wrap > .tab-menu li.active > a").trigger("click");
            } else {
                $(".as-tab-wrap > .tab-menu li:first-child > a").trigger("click");
            }
        },
        action: function (ele, getIndex) {
            var $findNode = $(ele);
            var $findEle = $findNode
                .closest(".as-tab-wrap ")
                .find(" > .inner-depth > .tab-inner");
            $(ele).addClass("on").siblings().removeClass("on");
            $findEle.css("display", "none");
            $findEle.eq(getIndex).css("display", "block");
        },
    },
    accordion: function () {
        if ($(".accordion").length == 0) {
            return;
        }
        var _acco = $(".accordion");
        _acco.find(".acc-head").on("click", function () {
            var _this = $(this);
            if (_this.hasClass("active")) {
                _this.removeClass("active");
                _this.next(".acc-body").css("height", 0);
            } else {
                _this.addClass("active").siblings().removeClass("active");
                _acco.find(".acc-body").css("height", 0).hide();
                _this.next(".acc-body").css("height", "auto").slideDown(500);
            }
        });
    }, //accordion
    tableAccordion: function () {
        var _acco = $(".table-accordion");
        if (_acco.length == 0) {
            return;
        }else{
            var _this = $(".btn-acctoggle");
            _this.each(function(){
                if ($(this).text() == "닫기") {
                    $(this).addClass("active");
                    $(this).closest("tr").next(".acc-ele").show();
                } else if($(this).text() == "자세히") {
                    $(this).closest("tr").next(".acc-ele").hide();
                }
            });
        }
        
        _acco.find(".btn-acctoggle").on("click", function () {
            var _this = $(this);
            if (_this.hasClass("active")) {
                _this.text("자세히");
                _this.removeClass("active");
                _this.closest("tr").next(".acc-ele").hide();
            } else {
                _this.text("닫기");
                _this.addClass("active");
                _this.closest("tr").next(".acc-ele").slideDown();
            }
        });
    }, //table-accordion
    controlWrap: function () {
        if ($(".control-wrap").length == 0) {
            return;
        }
        var _control = $(".control-wrap .control");
        _control.find(".btn-detail").on("click", function () {
            var _this = $(this),
                _simple = $(".simple"),
                _detail = $(".detail");
            if (_this.hasClass("active")) {
                _this.removeClass("active");
                _simple.slideDown(500);
                _detail.slideUp(500);
            } else {
                _this.addClass("active");
                _simple.slideUp(500);
                _detail.slideDown(500);
            }
        });
    },
    modalsClose: function(id){
        $('html,body').attr('style','');
        $('#'+id).removeClass('show');
        setTimeout(() => {
            $('#'+id).removeClass('on');
        }, 500);
    },//modalsClose
    modalsShow: function(id){
        var name_id = $('#'+id),
            $htmlH = $("html").scrollTop();
        $('html,body').css({'overflow':'hidden','position':'fixed','height':'100%'});
        name_id.addClass('on');
        setTimeout(() => {
            name_id.addClass('show');
        }, 200);
        name_id.find('.btn-close').click(function(e){
            e.preventDefault();
            e.stopPropagation();
            $('html,body').attr('style','');
            name_id.removeClass('show');
            setTimeout(() => {
                name_id.removeClass('on');
            }, 500);
            $('html').scrollTop($htmlH)
        });
    },//modalsShow
    treeView: function () {
        var _tree = $(".tree-view");
        if (_tree.length == 0) {
            return;
        }
        else{
            var _this = $(".btn-toggle");
            _this.each(function(){
                if ($(this).closest('.item').siblings('ul').length == 0) {
                    $(this).closest('.item').addClass('child-none')
                }
            });
        }
        
        _tree.find(".btn-toggle").on("click", function () {
            var _this = $(this);
            if($(this).closest('.item').hasClass('child-none')){
                return;
            }

            if (_this.closest('.item').hasClass("active")) {
                _this.closest('.item').removeClass("active");
            } else {
                _this.closest('.item').addClass("active");
            }
        });
    }, //tree view
};

// window.onload = function () {
//     admin.init();
// };
window.addEventListener('load', function() {
    admin.init();
});

$(document).on({
    mouseenter: function (event) {
        var target = event.target;
        var tooltipHtml = target.dataset.tooltip;

        tooltipElem = document.createElement('div');
        tooltipElem.className = 'tooltip';
        tooltipElem.innerHTML = tooltipHtml;
        document.body.append(tooltipElem);
        
        var coords = target.getBoundingClientRect();


        var left = coords.left + (target.offsetWidth - tooltipElem.offsetWidth) / 2;
        if (left < 0) left = 0;
        var top = coords.top - tooltipElem.offsetHeight - 5;
        if (top < 0) { 
            top = coords.top + target.offsetHeight + 5;
        }
        
        var elHeight = tooltipElem.offsetHeight;
        tooltipElem.style.left = left + 'px';
        tooltipElem.style.top = top + 'px';
        
        if(elHeight!=tooltipElem.offsetHeight){
            tooltipElem.style.top = coords.top - tooltipElem.offsetHeight - 5 + 'px';

        }
    },
    mouseleave: function () {
        if (tooltipElem) {
            tooltipElem.remove();
            tooltipElem = null;
        }
    }

}, '.btn-tooltip');