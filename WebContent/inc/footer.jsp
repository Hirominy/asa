<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer id="footer" class="footer-wrap">

    <%
	String loginf = (String)session.getAttribute("user_id");
    %>

   <% if(loginf != null){ %>
    	<%@ include file="/WEB-INF/inc/footer-login-view.jsp" %>
    <%}%>

 <%@ include file="/inc/footer_copyright.jsp" %>

	<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inview/1.0.0/jquery.inview.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/cmn.js"></script>

	<script>
    $(function () {
        $('.inv').on('inview', function (event, isInView, visiblePartX, visiblePartY) {
            if (isInView) {
                $(this).addClass('active');
            }
        });
        $('.invd').on('inview', function (event, isInView, visiblePartX, visiblePartY) {
            if (isInView) {
                $(this).addClass('active');
            }
        });
    });

    $(window).on('load', function () {
        $('body').delay('600').fadeIn("slow").queue(function () {
            $('#index__text h2').queue(function () {
                $(this).toggleClass('active');
            });
            $('#index__text .concept-disc-wrap').delay(700).queue(function () {
                $(this).toggleClass('active');
            });
            $('#index__text .index__login_btn').delay(1400).queue(function () {
                $(this).toggleClass('active');
            });
            $('#index-wrapper .scroll_box').queue(function () {
                $(this).toggleClass('active');
            });
        });
    });

    $('.slider').slick({
        autoplay: true,
   	 autoplaySpeed: 2000,
   	 speed: 1400,
   	 fade:true,
   	 infinite: true,
   	 pauseOnHover: false
   });

    function noAction(e) {
        e.preventDefault()
    }
</script>

 </footer>