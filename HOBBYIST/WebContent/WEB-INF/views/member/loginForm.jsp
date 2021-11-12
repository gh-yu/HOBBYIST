<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<!-- 마이페이지 - 로그인 -->
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Landing PAGE Html5 Template">
    <meta name="keywords" content="landing,startup,flat">
    <meta name="author" content="Made By GN DESIGNS">

    <title>로그인 페이지</title>
    <!-- // PLUGINS (css files) // -->
    <link href="js/plugins/bootsnav_files/skins/color.css" rel="stylesheet">
    <link href="js/plugins/bootsnav_files/css/animate.css" rel="stylesheet">
    <link href="js/plugins/bootsnav_files/css/bootsnav.css" rel="stylesheet">
    <link href="js/plugins/bootsnav_files/css/overwrite.css" rel="stylesheet">
    <link href="js/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="js/plugins/owl-carousel/owl.theme.css" rel="stylesheet">
    <link href="js/plugins/owl-carousel/owl.transitions.css" rel="stylesheet">
    <link href="js/plugins/Magnific-Popup-master/Magnific-Popup-master/dist/magnific-popup.css" rel="stylesheet">

    <!--// ICONS //-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--// BOOTSTRAP & Main //-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">

</head>
<!-- 추가한 css -->
<style>
.snslogin{font-weight:bolder; color:#9ED4C2; font-size:large;}
.row expanded app-dashboard-top-nav-bar {backgroundcolor:black;}
.col-md-5{position:relative;}
</style>
<body>


    <!--======================================== 

           Preloader

    ========================================-->

<!--     <div class="page-preloader"> -->
<!--         <div class="spinner"> -->
<!--             <div class="rect1"></div> -->
<!--             <div class="rect2"></div> -->
<!--             <div class="rect3"></div> -->
<!--             <div class="rect4"></div> -->
<!--             <div class="rect5"></div> -->
<!--         </div> -->
<!--     </div> -->

<!-- 상단바 -->

<!--     <div class="row expanded app-dashboard-top-nav-bar"> -->
<!--             <div class="columns medium-2"> -->
<!--                 <a class="app-dashboard-logo" href=#><img src="./image/img/logo.png" -->
<!--                     width="70px" height="55px"></a> -->
<!--             </div> -->
<!--             <div class="columns show-for-medium"> -->
<!--                 <div class="app-dashboard-search-bar-container"> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="columns shrink app-dashboard-top-bar-actions"> -->
<%--             <!--     <button class="button hollow" onclick="locatoin.href='<%= request.getContextPath() %>/logout.me'">Logout</button> --> --%>
<%--             	<input type="button" class="button hollow" value="Logout" onclick="locatoin.href='<%= request.getContextPath() %>/logout.me'"> --%>
                
<!--                 로그아웃 버튼 -->
<!--                 <a href="#" height="30" width="30" alt=""><i -->
<!--                     class="fa fa-info-circle"></i></a> -->
<!--             </div> -->
<!-- </div> -->

            <!-- Collect the nav links, forms, and other content for toggling -->

<!--             <div class="collapse navbar-collapse" id="navbar-menu"> -->
<!--                 <ul class="nav navbar-nav navbar-right"> -->

<!--                     <li class="button-holder"> -->
<!--                         <button type="button" class="btn btn-blue navbar-btn" data-toggle="modal" data-target="#SignIn">회원가입하기</button> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
            <!-- /.navbar-collapse -->
<!--         </div> -->
<!--     </nav> -->



    <!--//** Banner**//-->

    <section id="home">
        <div class="container">
            <div class="row">
            
                <!-- Introduction -->

                <div class="col-md-6 caption">
                    <h1>Welcome To Hobbyist</h1>
                    <h2>
                           하비스트<span class="animated-text"></span><span class="typed-cursor"></span>
                        </h2>
                    <p>맞춤형 원데이 클래스 사이트</p>
                    <a href="#" class="btn btn-blue btn-transparent">Main Page로 이동</a>

                </div>

                <!-- Sign Up -->

                <div class="col-md-5 col-md-offset-1">
                
                    <form class="signup-form" action="<%=request.getContextPath() %>/login.me" method="post">
                        <img src="./image/img/logogreen.png" style="display: block; margin: 0 auto;" class="logogreen">
                        <hr>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="아이디를 입력하세요" required="required" name="memberEmail">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" required="required" name="memberPwd">
                        </div>
                       
                       <table>
                       <tr>
                        <td style="font-size:small; color:#9ED4C2;">아이디/비밀번호를 잊으셨나요?</td>
                        <td width="96px"></td>
                       
                     <td class="join1" align="right" style="color:#9ED4C2; font-weight:bold; cursor:pointer;" onclick="location.href='<%= request.getContextPath()%>/joinForm.me'">회원가입하기</td>
					</tr>
					</table>
                     
						<br>
                        <div class="form-group text-center">
                        <table>
                        <tr height="100px">
                            <td width="30%"></td>
                            <td><button type="submit" class="btn btn-blue btn-block" style="background-color: #9ED4C2; width:200px; " >로그인 하기</button>
                            </td>
                            <td></td>
                           </tr>
						

						<tr>
						<td></td>
						<td>
						<img src="./image/img/kakaologin.png" style="height:50px">
						</td>
						<td></td>
						</tr>
						</table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>



   


    <!--======================================== 

           Footer

    ========================================-->


    <footer>
        <div class="container">
            <div class="row">
                <div class="footer-caption">
                    <img src="./image/img/logo.png" class="img-responsive center-block" alt="logo">
                    <hr>
                    <h5 class="pull-left">Vortex, &copy;2016 All rights reserved</h5>
                    <ul class="liste-unstyled pull-right">
                        <li><a href="#twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>





    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->

    <script src="./js/bootstrap.min.js"></script>

    <script src="./js/plugins/owl-carousel/owl.carousel.min.js"></script>

    <script src="./js/plugins/bootsnav_files/js/bootsnav.js"></script>

    <script src="./js/plugins/typed.js-master/typed.js-master/dist/typed.min.js"></script>

    <script src="./js/plugins/Magnific-Popup-master/Magnific-Popup-master/dist/jquery.magnific-popup.js"></script>

    <script src="./js/main.js"></script>

</body>
</html>