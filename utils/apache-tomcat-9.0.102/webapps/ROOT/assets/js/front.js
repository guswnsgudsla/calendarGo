var front = front || {
  init: function () {
    front.nav.init();
    front.tab.init();
    front.fmFocus();
    front.userWrap();
    front.controlboxWrap();
    front.fileTarget();
    front.accordion();

    front.datepicker();
    front.checkAll();
    front.controlWrap();

    front.tooltip();
  },
  nav: {
    init: function () {
      $gnb = $("nav .gnb");
      $navLi = $gnb.find(" >ul > li");
      $navDepth = $gnb.find(".gnb-detail");
      this.event();
    },
    event: function () {
      $gnb.on({
        "mouseenter focusin": function () {
          var win_w = $(window).outerWidth();
          if (win_w >= 980) {
            $navDepth.stop().slideDown(200);
          }
        },
        "mouseleave focusout": function () {
          var win_w = $(window).outerWidth();
          if (win_w >= 980) {
            $navDepth.stop().slideUp(function () {
              $(this).attr("style", "");
            });
          }
        },
      });
      $(document).on("click", ".btn-menu", function (e) {
        $("html,body").css({
          overflow: "hidden",
          position: "fixed",
          height: "100%",
        });
        $navDepth
          .append('<div class="dimmed"></div>')
          .css({ right: "100%" })
          .show()
          .animate({ right: 0 }, 300);
        if ($navDepth.find("li").hasClass("active")) {
          $navDepth.find("li.active > strong").trigger("click");
        } else {
          $navDepth.find("li:first-child > strong").trigger("click");
        }
      });
      $(document).on("click", ".btn-close, .dimmed", function (e) {
        $navDepth.animate({ right: "100%" }, 200, function () {
          $(this).hide().find(".dimmed").remove();
          $(this).attr("style", "");
          $(this).find("li").removeClass("active");
          $(this).find(".depth").attr("style", "");
          $("html,body").attr("style", "");
        });
      });
      $navDepth.find("li").on("click", "strong", function () {
        var $this = $(this),
          $depthTarget = $this.next(),
          $siblings = $this.parent().siblings();
        $this.parent("li").find("ul li").removeClass("active");
        $siblings.removeClass("active");
        $siblings.find(".depth").slideUp(250);
        if ($depthTarget.css("display") == "none") {
          $this.parent().addClass("active");
          $depthTarget.slideDown(300);
        } else {
          $depthTarget.slideUp(300);
          $this.parent().removeClass("active");
        }
      });
    },
  }, //nav
  tab: {
    init: function () {
      if ($(".as-tab-wrap").length == 0) {
        return;
      }
      $this = $(".as-tab-wrap");
      $tabEle = $this.find("> .tab-menu li");
      $tabEleElex = $this.find(".tab-menu.flexible");
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
        .closest(".tab-wrap")
        .find(" > .inner-depth > .tab-inner");
      $(ele).addClass("active").siblings().removeClass("active");
      $findEle.css("display", "none");
      $findEle.eq(getIndex).css("display", "block");
    },
  }, //tab
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
        if ($(this).closest("fm-select")) {
          $(this).on("change", function () {
            $(this).closest(".fm-focus").removeClass("focus");
          });
        }
      })
      .focusout(function () {
        $(this).closest(".fm-focus").removeClass("focus");
      });
  }, //focus
  selectmenu: function (ele) {
    var name_id = $("#" + ele);
    $.widget("custom.iconselectmenu", $.ui.selectmenu, {
      _renderItem: function (ul, item) {
        var li = $("<li>"),
          wrapper = $("<div>", { text: item.label });

        if (item.disabled) {
          li.addClass("ui-state-disabled");
        }
        return li.append(wrapper).appendTo(ul);
      },
    });
    name_id.iconselectmenu().iconselectmenu("menuWidget").addClass("overflow");
  }, //selectmenu
  userWrap: function () {
    if ($("header .user-wrap").length == 0) {
      return;
    }
    $("header .user-wrap").on({
      "click focusin": function () {
        $(this)
          .addClass("active")
          .find(".user-menu")
          .show()
          .animate({ top: "100%", opacity: "1" }, 300);
      },
      "mouseleave focusout": function () {
        $(this)
          .removeClass("active")
          .find(".user-menu")
          .attr("style", "")
          .hide();
      },
    });
  }, //userWrap
  controlboxWrap: function () {
    if ($(".controlbox-wrap").length == 0) {
      return;
    }
    $(".controlbox-wrap .btn-toggle, .search-wrap .btn-toggle").on("click", function () {
      var $this = $(this);
      var $controlboxWrap

      if($this.closest('.search-wrap').length == 0){
        $controlboxWrap = $this.closest(".controlbox-wrap");
    }else{
        $controlboxWrap = $this.closest('.search-wrap').siblings('.tab-wrap').find('.controlbox-wrap');
      }
      
      if ($controlboxWrap.hasClass("active")) {
        // $this.text("상세 조건 닫기");
        $(".controlbox-wrap .btn-toggle").text("상세 조건 닫기");
        $(".search-wrap .btn-toggle").attr("title","닫기").removeClass("active");
        $controlboxWrap
          .removeClass("active")
          .find(".controlbox")
          .slideDown(300);
      } else {
        // $this.text("상세 조건 펼침");
        $(".controlbox-wrap .btn-toggle").text("상세 조건 펼침");
        $(".search-wrap .btn-toggle").attr("title","펼침").addClass("active");
        $controlboxWrap.addClass("active").find(".controlbox").slideUp(300);
      }

    });

    if ($(".controlbox-wrap").hasClass("active")) {
      $(".controlbox-wrap .btn-toggle").text("상세 조건 펼침");
      $(".controlbox-wrap").find(".controlbox").hide();
      if($('.search-wrap .btn-toggle').hasClass("active")){
        $(".search-wrap .btn-toggle").attr("title","펼침");
      }
    }
  }, //controlboxWrap
  fileTarget: function () {
    if ($(".fm-filebox").length == 0) {
      return;
    }
    var fileTarget = $(".fm-filebox .upload-hidden");
    fileTarget.on("change", function () {
      if (window.FileReader) {
        var filename = $(this)[0].files[0].name;
      } else {
        var filename = $(this).val().split("/").pop().split("\\").pop();
      }

      $(this).siblings(".upload-name").val(filename);
      if ($(this).val().length) {
        $(this).siblings("button").show();
      }
      //input 초기화
      //$(this).val("");
      fileTarget.siblings("button").on("click", function () {
        $(this).siblings(".upload-name").val("");
      });
    });
  }, //fileTarget
  accordion: function () {
    if ($(".accordion").length == 0) {
      return;
    }
    var _acco = $(".accordion");
    _acco.find(".acc-head > a").on("click", function (e) {
      e.preventDefault();
      e.stopPropagation();
      var _this = $(this).closest(".acc-head");
      if (_this.hasClass("active")) {
        _this.removeClass("active");
        _this.find(".acc-body").css("height", 0).hide();
      } else {
        _this.addClass("active").siblings().removeClass("active");
        _acco.find(".acc-body").css("height", 0).hide();
        _this.find(".acc-body").css("height", "auto").slideDown(500);
      }
    });
  }, //accordion

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
  checkAll: function () {
    if ($(".checkall-wrap").length == 0) {
      return;
    }
    var _this = $(".checkall-wrap");
    _this.find('thead input[type="checkbox"]').on("click", function () {
      $(this)
        .parents("table")
        .find('input[type="checkbox"]')
        .prop("checked", $(this).prop("checked"));
    });
    _this.find('.check-list input[type="checkbox"]').on("click", function () {
      if (
        $(this).parents(".check-list").find('input[type="checkbox"]').length ===
        $(this).parents(".check-list").find('input[type="checkbox"]:checked')
          .length
      ) {
        $(this)
          .parents("table")
          .find('thead input[type="checkbox"]')
          .prop("checked", true);
      } else {
        $(this)
          .parents("table")
          .find('thead input[type="checkbox"]')
          .prop("checked", false);
      }
    });
  }, //checkAll

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
  layerOpen: function (e, ele) {
    var name_id = $("#" + ele),
      refFocusEl = e,
      $htmlH = $("html").scrollTop();
    name_id.attr("tabindex", "0").fadeIn().focus();
    name_id.append('<a href="#" class="loop">포커스이동</a>');
    $(".loop").focus(function () {
      name_id.attr("tabindex", "0").fadeIn().focus();
    });
    $("html,body").css({
      overflow: "hidden",
      position: "fixed",
      height: "100%",
    });
    $(window)
      .resize(function () {
        var win_h = $(window).outerHeight();
        var win_w = $(window).outerWidth();
        var pop_h = name_id.find(".pop-layer").outerHeight();
        var pop_w = name_id.find(".pop-layer").outerWidth();
        var position_top = (win_h - pop_h) / 2;
        var position_left = (win_w - pop_w) / 2;
        if (position_top <= 0) {
          position_top = 0;
          name_id.addClass("over-height");
        }
        if (position_left <= 0) {
          position_left = 0;
        }
        name_id
          .find(".pop-layer")
          .css({ top: position_top, left: position_left });
        pop_h >= win_h
          ? $(".dimmed").css("height", pop_h)
          : $(".dimmed").css("height", 100 + "%");
        pop_w >= win_w
          ? $(".dimmed").css("width", pop_w)
          : $(".dimmed").css("width", 100 + "%");
      })
      .resize();
    //close
    name_id.find(".btn-close, .dimmed").click(function (e) {
      e.preventDefault();
      e.stopPropagation();
      refFocusEl.focus();
      $(".loop").remove();
      $(".wrap-layer-popup").fadeOut();
      $("html,body").attr("style", "");
      $("html").scrollTop($htmlH);
    });
  }, //layerOpen
  layerClose: function (ele) {
    var nameId = $("#" + ele),
      wrapPop = nameId.parent(".wrap-layer-popup");
    nameId.find(".loop").remove();
    nameId.fadeOut();
    $("html,body").attr("style", "");
  }, //layerClose


  tooltip: function () {
    $('.tooltip').on("mouseenter focus", function() {
      var $tooltipText = $(this),
          $tooltipTextPostion = $tooltipText.position(),
          $tooltipHeight = $tooltipText.height(),
          $tooltipTextPostionTop = $tooltipTextPostion.top + $tooltipHeight + 10,
          $tooltipTextPostionleft = $tooltipTextPostion.left - 10;
          
          $tooltip = $(this).siblings('[role=tooltip]');
          $tooltip.addClass('active');
          $tooltip.css('left', + $tooltipTextPostionleft +'px')
          $tooltip.css('top', + $tooltipTextPostionTop +'px')
  });
  $('.tooltip').on("mouseleave focusout", function() {
      $('[role=tooltip]').removeClass('active');
  });
  }, //tooltip
};
window.onload = function () {
  front.init();
};
