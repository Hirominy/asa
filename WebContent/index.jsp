<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/inc/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>さあ、朝活を始めよう！｜朝活アプリ</title>
</head>
<body id="index">

<main>
 <%@ include file="/inc/header.jsp" %>

<section id="index-wrapper" class="parent01">

<section id="index__text">

<h2>
失敗も成功も、<br>
あなたが歩んだ軌跡。
</h2>

<div class="concept-disc-wrap">
<p>
失敗から始まる成功もある。<br>
失敗から始まる物語があってもいい。
</p>
<p>
「1度失敗したら終わり」なんて<br>
あまりにもったいない。
</p>
<p>
成功か失敗かを選択するだけで、<br>
これまでの成功確率を計算して表示。<br>
あなたの毎朝の習慣をサポートします。
</p>

</div>

<div class="index__login_btn">
<a href="login.jsp">朝活をはじめる</a>
</div>
</section>

    <div class="scroll_box">
        <p class="scroll_title">SCROLL</p>
        <div class="scroll_down">
            <div class="line"></div>
        </div>
    </div>
</section>

<section id="index__img">
<ul class="slider">
<li><img src="${pageContext.request.contextPath}/img/top/main_img1.png" alt="イメージ画像"  /></li>
<li><img src="${pageContext.request.contextPath}/img/top/main_img3.png" alt="イメージ画像"  /></li>
<li><img src="${pageContext.request.contextPath}/img/top/main_img4.png" alt="イメージ画像"  /></li>
</ul>

</section>

<section id="about" class="content">

<div class="title">
<h3>朝活応援アプリ「あさかつ」とは？</h3>
</div>

<div class="section-contentwrap">
        <ol class="introduction__list">

          <li class="introduction__list-item">
            <div class="introduction__list-item-img">
              <img src="${pageContext.request.contextPath}/img/top/about_icon1.png">
            </div>
            <div class="introduction__list-item-text">
              <p class="introduction__list-item-text-title" data-number="01">アカウント登録</p>
              <p><a href="NewUser.jsp">新規登録画面</a>で、IDとパスワードを登録します。パスワードは後から変更できます。</p>
            </div>
          </li>
          <li class="introduction__list-item">
            <div class="introduction__list-item-img">
             <img src="${pageContext.request.contextPath}/img/top/about_icon2.png">
            </div>
            <div class="introduction__list-item-text">
              <p class="introduction__list-item-text-title" data-number="02">朝活前にアクセス</p>
              <p>朝活を始める前に、成功を押しましょう！<br>
              朝活ができなかった日も、失敗を選択してログを残しましょう。</p>
            </div>
          </li>
          <li class="introduction__list-item">
            <div class="introduction__list-item-img">
            <img src="${pageContext.request.contextPath}/img/top/about_icon3.png">
            </div>
            <div class="introduction__list-item-text">
              <p class="introduction__list-item-text-title" data-number="03">SNSでシェア</p>
              <p>朝活継続日数と成功率が自動で計算されテキスト化されます。
              ポチポチ押すだけで、カンタンにシェアできます。<br>
              <small>※現状はツイッターのみ</small></p>
            </div>
          </li>
        </ol>
      </div>

      <div class="index__login_btn active" style="text-align: center; margin: 0 auto; padding-top:2vw;">
<a style="margin-bottom:5vw;" href="login.jsp">朝活をはじめましょう！</a>
</div>

<style>

 ol.introduction__list {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: distribute;
    justify-content: center;
    width: 100%;
    list-style-type: none;
}
li.introduction__list-item:nth-of-type(1) {
    border: none;
}
ol.introduction__list {
    margin: 0 auto;
    min-width: 900px;
    background: url(../img/introduction-step-pc.png) no-repeat top/760px;
}
li.introduction__list-item {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 300px;
    flex: 0 0 300px;
    border-left: 1px solid #E9ECF2;
}
.introduction__list-item-img {
    width: 140px;
    height: 175px;
    position: relative;
    background-color: #52cba4;
    border-radius: 20px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    margin: auto;
}
.introduction__list-item:nth-of-type(1)  img,.introduction__list-item:nth-of-type(3)  img {
    max-width: 63px;
}
.introduction__list-item-text {
    margin-top: 1.5rem;
    margin-left: 2rem;
    color: #41424E;
}
p.introduction__list-item-text-title {
    font-weight: 900;
    	position: relative;
}
p.introduction__list-item-text-title::before {
    content: attr(data-number);
    display: inline-block;
    margin-right: 14px;
    color: #52cba4;
    font-size: 1.2rem;
    border-top: 1px solid #52cba4;
}
</style>

</section>
</main>


<%@ include file="/inc/footer.jsp" %>

</body>
</html>