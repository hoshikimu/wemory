// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree ../../../vendor/assets/javascripts/.
//= require jquery.jpostal
//= require_tree .


// aboutページ上段とトップページに使用
$(document).ready(function(){
  $(".theTarget").skippr({
    // スライドショーの変化（"fade" or "slide"）
    transition : 'fade',
    // 変化にかかる時間（ミリ秒）
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形（"block" or "bubble"）
    navType : 'bubble',
    // 子要素の種類（"div" or "img"）
    childrenElementType : 'div',
    // ナビゲーション矢印の表示（trueで表示）
    arrows : true,
    // スライドショーの自動再生（falseで自動再生なし）
    autoPlay : true,
    // 自動再生時のスライド切替間隔（ミリ秒）
    autoPlayDuration : 4000,
    // キーボードの矢印キーによるスライド送りの設定（trueで有効）
    keyboardOnAlways : true,
    // 1枚目のスライド表示時に戻る矢印を表示するかどうか [false]:矢印を隠さない [true]:矢印を隠す
    hidePrevious : false
  });
});

// aboutページ中段に使用
$(document).ready(function(){
  $("#theTarget2").skippr({
    transition : 'fade',
    speed : 1000,
    easing : 'easeOutQuart',
    navType : 'bubble',
    childrenElementType : 'div',
    arrows : true,
    autoPlay : false,
    autoPlayDuration : 5000,
    keyboardOnAlways : true,
    hidePrevious : false
  });
});

// aboutページ下段に使用
$(document).ready(function(){
  $("#theTarget3").skippr({
    transition : 'fade',
    speed : 1000,
    easing : 'easeOutQuart',
    navType : 'bubble',
    childrenElementType : 'div',
    arrows : true,
    autoPlay : false,
    autoPlayDuration : 5000,
    keyboardOnAlways : true,
    hidePrevious : false
  });
});

// トップに戻る機能
$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:1
    }, 500);
    event.preventDefault();
  });
});

// ヘッダーのスクロール表示切り替え
$(function(){
  var pos = 0;
  var header = $('header');
  $(window).on('scroll', function(){
    if($(this).scrollTop() < pos || $(this).scrollTop() < 70 ){
      //上スクロール時ヘッダー表示
      header.slideDown(300);
    }else{
      //下スクロール時ヘッダー非表示
      header.slideUp(300);
    }
    pos = $(this).scrollTop();
  });
});

//商品登録、編集画面に画像プレビューを表示
$(function(){
  $('#file').change(function(){
    var file = $(this).prop('files')[0];
    if(!file.type.match('image.*')){
      return;
    }
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      $('#result').html('<img src="' + fileReader.result + '" width="180" height="180">');
    }
    fileReader.readAsDataURL(file);
  });
});

//レスポンシブメニューの表示切り替え
$(function(){
  $(".rsp-menu i").click(function() {
    $(".menu-whitedisplay").fadeIn(200);
  });
  $(".white-display-close-btn").click(function() {
    $(".menu-whitedisplay").fadeOut(200);
  });
});

// 郵便番号入力で住所自動出力
$(function(){
  $("#address_zipcode").jpostal({
      postcode : [ "#address_zipcode" ],
      address  : {
                    "#address_prefecture_name" : "%3",
                    "#address_city"            : "%4%5",
                    "#address_street"          : "%6%7"
                  }
    })
});

//新規投稿コメントのモーダルウィンドウ
$(function(){
  $(".post-comment").click(function() {
    $(".post-comment-whitedisplay").fadeIn(200);
  });
  $(".post-comment-close").click(function() {
    $(".post-comment-whitedisplay").fadeOut(200);
  });
});

//投稿コメント一覧のモーダルウィンドウ
$(function(){
  $(".comment-icn").click(function() {
    $(".post-comments-whitedisplay").fadeIn(200);
  });
  $(".post-comments-close").click(function() {
    $(".post-comments-whitedisplay").fadeOut(200);
  });
});