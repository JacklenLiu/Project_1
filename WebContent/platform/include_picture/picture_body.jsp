<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body style="margin:0;padding:0;font-family: Arial, Verdana, Sans-Serif;">
<!-- Jssor Slider Begin -->
    <!-- You can move inline styles to css file or css block. -->
    <div id="slider1_container" style="position: relative; width: 980px;
        height: 250px; overflow: hidden;">
        <style>
        /* this line can be removed, but it really helps in case of css conflicts in your page */
        
        .slider1 div {
            position: relative;
            margin: 0px;
            padding: 0px;
        }
        </style>
        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;

                background-color: #000; top: 0px; left: 0px;width: 100%; height:100%;">
            </div>
<!--             <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center; -->

<!--                 top: 0px; left: 0px;width: 100%;height:100%;"> -->
<!--             </div> -->
        </div>

        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 980px; height: 380px;
            overflow: hidden;" id="intro">
           	<div>
                <img u="image" src="../Images/E_Changhong Bridge_01.bmp" />
                <div u=caption t="CLIP|LR" du="1500" class="captionOrange"  style="position:absolute; left:20px; top: 35px; width:300px; height:30px;"> 
                		石門水庫~~~
                </div>
            </div>
            <div> 
                <img u="image" src="../Images/E_Changhong Bridge_02.bmp" />
                <div u="caption" t="T|IB" t2="R" d=-600 class=captionOrange style="position:absolute; left:20px; top:35px; width:300px; height:30px;">
                   		 高屏溪
                </div>
            </div>
            <div> 
                <img u="image" src="../Images/E_Changhong Bridge_03.bmp" />
                <div u=caption t="DDGDANCE|RB" t2="RTT|10" d=-800 du=3800 class="captionOrange" style="position:absolute; left:20px; top:35px; width:300px; height:30px;">
                 		濁水溪~~~
                </div>
            </div>

            <!-- Example to add fixed static share buttons in slider BEGIN -->
            <!-- Remove it if no need -->
            <!-- Share Button Styles -->
            <style>
            .share-icon {
                display: inline-block;
                float: left;
                margin: 4px;
                width: 32px;
                height: 32px;
                cursor: pointer;
                vertical-align: middle;
                /*background-image: url(../img/share/share-icons.png);*/
            }
            .share-facebook {
                background-position: 0px 0px;
            }
            .share-facebook:hover {
                background-position: 0px -40px;
            }
            .share-twitter {
                background-position: -40px 0px;
            }
            .share-twitter:hover {
                background-position: -40px -40px;
            }
            .share-pinterest {
                background-position: -80px 0px;
            }
            .share-pinterest:hover {
                background-position: -80px -40px;
            }
            .share-linkedin {
                background-position: -240px 0px;
            }
            .share-linkedin:hover {
                background-position: -240px -40px;
            }
            .share-googleplus {
                background-position: -120px 0px;
            }
            .share-googleplus:hover {
                background-position: -120px -40px;
            }
            .share-stumbleupon {
                background-position: -360px 0px;
            }
            .share-stumbleupon:hover {
                background-position: -360px -40px;
            }
            .share-email {
                background-position: -320px 0px;
            }
            .share-email:hover {
                background-position: -320px -40px;
            }
            </style>


            <!-- Example to add fixed static share buttons in slider END -->

            <!-- Example to add fixed static QR code in slider BEGIN -->
            <!-- Remove it if no need -->
            <!-- QR Code Style -->
            <style>
            @media only screen and (max-width: 980px) {
                .qr_code {
                    display: none;
                }
            }
            </style>
<!--             <img u="any" class="qr_code" src="../img/qr/jssor.com.png" style="position: absolute; width: 80px; height: 80px; bottom: 20px; right: 20px; opacity: .5; filter: alpha(opacity=50);" /> -->
            <!-- Example to add fixed static QR code in slider END -->
        </div>

        <!-- Bullet Navigator Skin Begin -->
        <style>
        /* jssor slider bullet navigator skin 03 css */
        /*
            .jssorb03 div           (normal)
            .jssorb03 div:hover     (normal mouseover)
            .jssorb03 .av           (active)
            .jssorb03 .av:hover     (active mouseover)
            .jssorb03 .dn           (mousedown)
            */
        
        .jssorb03 div,
        .jssorb03 div:hover,
        .jssorb03 .av {
            background: url(../img/b03.png) no-repeat;
            overflow: hidden;
            cursor: pointer;
        }
        .jssorb03 div {
            background-position: -5px -4px;
        }
        .jssorb03 div:hover,
        .jssorb03 .av:hover {
            background-position: -35px -4px;
        }
        .jssorb03 .av {
            background-position: -65px -4px;
        }
        .jssorb03 .dn,
        .jssorb03 .dn:hover {
            background-position: -95px -4px;
        }
        </style>
        <!-- bullet navigator container -->

        <!-- Bullet Navigator Skin End -->

        <!-- Arrow Navigator Skin Begin -->
        <style>
        /* jssor slider arrow navigator skin 20 css */
        /*
            .jssora20l              (normal)
            .jssora20r              (normal)
            .jssora20l:hover        (normal mouseover)
            .jssora20r:hover        (normal mouseover)
            .jssora20ldn            (mousedown)
            .jssora20rdn            (mousedown)
            */
        
        .jssora20l,
        .jssora20r,
        .jssora20ldn,
        .jssora20rdn {
            position: absolute;
            cursor: pointer;
            display: block;
            /*background: url(../img/a20.png) no-repeat;*/
            overflow: hidden;
        }
        /*.jssora20l { background-position: -3px -33px; }*/
        /*.jssora20r { background-position: -63px -33px; }*/
        /*.jssora20l:hover { background-position: -123px -33px; }*/
        /*.jssora20r:hover { background-position: -183px -33px; }*/
        /*.jssora20ldn { background-position: -243px -33px; }*/
        /*.jssora20rdn { background-position: -303px -33px; }*/
        </style>
        <!-- Arrow Left -->
        <!-- <span u="arrowleft" class="jssora20l" style="width: 55px; height: 55px; top: 123px; left: 8px;"> -->
        <!-- </span> -->
        <!-- Arrow Right -->
        <!--   <span u="arrowright" class="jssora20r" style="width: 55px; height: 55px; top: 123px; right: 8px">
        </span> -->

        <a class="left carousel-control" href="#myCarousel">
            <span u="arrowright" class="icon-prev jssora20l"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel">
            <span u="arrowleft" class="icon-next jssora20l"></span>
        </a>





        <!-- Arrow Navigator Skin End -->
        <a style="display: none" href="http://www.jssor.com">image carousel</a>
    </div>
    <!-- Jssor Slider End -->
</body>