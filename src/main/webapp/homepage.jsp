<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-us" xml:lang="en-us" class="t-chrome t-chrome127" style="--vh: 596px;">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<head id="M_head">

    <link href="${pageContext.request.contextPath}/css/homepage.css" rel="stylesheet" type="text/css">
</head>

<body style="padding-right: 0px;">



<link href="${pageContext.request.contextPath}/css/homepage.css" type="text/css" rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>
    Sign In - Ukrainian FCU
</title>

<div id="busy-div-start" role="alert" aria-live="assertive" class="sr-only" style="display: none;">Loading...</div>
<div id="busy-div-end" role="alert" aria-live="assertive" class="sr-only" style="display: none;">Loading Complete</div>
<div id="busy-div" class="hidden">
    <div class="page-loader"></div>
</div>
<div id="M_reactMessageDialog_view"></div>

<form  action="${pageContext.request.contextPath}/Login"  method="post">



    <div id="M_outerWrapper" style="display: flex; flex-direction: column;">
        <!-- start page top container -->
        <div id="page-background-image" class="page-middle-column-shown"></div>
        <div id="page-top-container" class="page-top-centered" style="min-height: calc(-49px + 100vh);">

            <input type="submit" name="M$cmdRefresh" value="Refresh" id="M_cmdRefresh" style="display: none">





            <div class="loading_panel">
                <div id="M_AjaxLoadingPanel" style="display:none;">

                    <img id="M_Image1">

                </div>
            </div>
            <div class="navbar-container">
                <!-- start skip to main content navigation link -->
                <div class="skip-nav">
                    <a class="sr-only sr-only-focusable" href="#mainContent">
                        Skip to main content
                    </a>
                </div>
                <div id="M_pageTemplateHeader_view">
                    <div class="navbar-content">
                        <header class="navbar-header">
                            <div class="navbar-header-content">
                                <div class="navbar-header-brand-container">
                                    <a class="logo" href="${pageContext.request.contextPath}/ufcu2014/"><img src="${pageContext.request.contextPath}/css/LoginLogo.aspx" alt=""></a>
                                </div>
                                <div class="navbar-header-logo-container">
                                    <a class="logo" href="${pageContext.request.contextPath}/ufcu2014/"><img src="${pageContext.request.contextPath}/css/LoginLogo.aspx" alt=""></a>
                                </div>
                            </div>
                        </header>
                        <nav class="navbar-menu-container">
                            <div class="navbar-menu-content">
                                <div class="menu-items-container">
                                    <div class="navbar-collapse" role="navigation">
                                        <ul class="tree-view desktop-navigation"></ul>
                                    </div>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>

            </div>
            <!-- start main content -->
            <div class="main-content-wrapper">
                <div class="main-content" id="mainContent" role="main">

                    <div aria-live="polite" aria-atomic="true">
                        <div id="M_layout_messageQueueControl_view"></div>

                    </div>
                    <div class="page-column-layout column-layout-1">
                        <div id="main-sortable" class="page-column column-container graphs page-middle-column page-bottom-column" style="position: static; left: 0px;">

                            <div id="main-top">
                                <div class="IDS-MCMBanner IDS-MCMBanner-top banner-top" data-contentlocation="Top Banner" data-altlocation="Top Banner - Sign In - Ukrainian FCU" data-rotate="true"></div>
                            </div>

                            <div class="page-centered-wrapper">
                                <div class="module-wrapper page-centered narrow">


                                    <style>
                                        input.revealable-input::-ms-reveal {
                                            display: none;
                                        }

                                        button.reveal-password-button {
                                            position: absolute;
                                            border: none;
                                            background: none;
                                            padding: 0 5px;
                                            display: flex !important;
                                            align-items: center;
                                        }
                                    </style>

                                    <div id="M_layout_content_PCDZ_MMCA7G7_ctl00">

                                        <div id="Module-MMCA7G7" class="narrow column-bottom-module" data-moduletitle="Welcome to Online Banking" data-moduledescription="" style="">
                                            <div class="module-header-container">
                                                <h1 class="module-title">Welcome to Online Banking</h1>
                                            </div>


                                            <div class="mainmodule">
                                                <div id="M_layout_content_PCDZ_MMCA7G7_ctl00_validationSummary" class="alert icon alert-danger error_box" style="display:none;">

                                                </div>
                                                <div class="LoginModule">

                                                    <div id="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_LC_Zone0" class="vertical_layout">
                                                        <div id="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_txtLoginName_C" class="p">
                                                            <span><input name="email" type="text" autocomplete="off" maxlength="100" id="email" class="form-control component-group" autofocus="" placeholder="User ID"><span id="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_txtLoginName_RFV" title="Enter your User ID." style="display:none;"></span></span>
                                                        </div>
                                                        <div id="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_txtPassword_C" class="p">
                                                            <span><input name="password" type="password" autocomplete="off" id="password" class="form-control component-group" placeholder="Password"><span id="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_txtPassword_RFV" title="“” is a required field." style="display:none;"></span></span>
                                                        </div>
                                                        <div id="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_chkRememberMe_C" class="p">
                                                            <span><span class="checkbox"><input id="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_chkRememberMe" type="checkbox" name="M$layout$content$PCDZ$MMCA7G7$ctl00$webInputForm$chkRememberMe"><label for="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_chkRememberMe">Remember me</label></span></span>
                                                        </div>
                                                    </div>
                                                    <div id="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_LC_SubmitButtons" class="submit-buttons-group">
                                                        <span></span><input type="submit" name="M$layout$content$PCDZ$MMCA7G7$ctl00$webInputForm$cmdContinue" value="LOG IN" id="M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_cmdContinue" class="btn btn-primary"
                                                                            onclick="if (IDS_ButtonClick(&quot;M_layout_content_PCDZ_MMCA7G7_ctl00_webInputForm_cmdContinue&quot;, &quot;&quot;, true, false, true, &quot;&quot;, 0, &quot;&quot;, '')) __doPostBack('M$layout$content$PCDZ$MMCA7G7$ctl00$webInputForm$cmdContinue',''); return false;">
                                                    </div>

                                                </div>


                                            </div>
                                        </div>
                                    </div><input type="hidden" name="M$layout$content$PCDZ$MKZM13S$ctl00$DevicePrint" id="M_layout_content_PCDZ_MKZM13S_ctl00_DevicePrint" value="version=2&amp;pm_fpua=mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/127.0.0.0 safari/537.36 edg/127.0.0.0|5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0|Win32&amp;pm_fpsc=24|1280|720|672&amp;pm_fpsw=&amp;pm_fptz=-7&amp;pm_fpln=lang=en-US|syslang=|userlang=&amp;pm_fpjv=0&amp;pm_fpco=1&amp;pm_fpasw=internal-pdf-viewer|internal-pdf-viewer|internal-pdf-viewer|internal-pdf-viewer|internal-pdf-viewer&amp;pm_fpan=Netscape&amp;pm_fpacn=Mozilla&amp;pm_fpol=true&amp;pm_fposp=&amp;pm_fpup=&amp;pm_fpsaw=1280&amp;pm_fpspd=24&amp;pm_fpsbd=&amp;pm_fpsdx=&amp;pm_fpsdy=&amp;pm_fpslx=&amp;pm_fpsly=&amp;pm_fpsfse=&amp;pm_fpsui=">

                                    <script type="text/javascript">
                                        document.getElementById('M_layout_content_PCDZ_MKZM13S_ctl00_DevicePrint').value = add_deviceprint();
                                    </script>

                                    <div id="M_layout_content_PCDZ_MJ9KL23_ctl00" style="emptyDiv;">

                                        <div style="" data-moduletitle="Sign In Links" class="emptyDiv narrow">
                                            <table style="width:90%">
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <a href="#">Forgot your password?</a>
                                                    </td>
                                                    <td>
                                                        <a href="#">Forgot your user ID?</a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <a href="#">Register</a>
                                                    </td>
                                                    <td>
                                                        <a href="#">Register a Business</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <!--<td>
        <a target="_blank" href="#">Converted User Login</a>
    </td>-->
                                                    <td>
                                                        <a href="admin.jsp" target="_blank">Disclaimer</a>
                                                    </td>
                                                    <!--<td>
<a href="#" target="_blank" >Privacy Policy</a>
    </td>-->
                                                </tr>
                                                <!--	<td>
        <a href="/ufcu2014/SignIn.aspx?language=es-MX">En español</a>
    </td> -->

                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <div id="M_layout_content_PCDZ_MBZZKRA_ctl00" style="emptyDiv;">

                                        <div style="" data-moduletitle="Maverick Bubble Icons" class="emptyDiv narrow">

                                            <div class="MavLoginLinks">
                                                <table class="mav-login-table">
                                                    <tbody>
                                                    <tr class="icons-row">


                                                        <td style="text-align:center">
                                                            <img src="${pageContext.request.contextPath}/css/new-account.png" style="display:block; margin: 0 auto; width: 60px; height: 60px;">
                                                            <a href="#">Open An Account</a>
                                                        </td>
                                                        <td style="text-align:center">
                                                            <img src="${pageContext.request.contextPath}/css/locations.png" style="display:block; margin: 0 auto; width: 60px; height: 60px;">
                                                            <a href="#">Locations</a>
                                                        </td>
                                                        <td style="text-align:center">
                                                            <img src="${pageContext.request.contextPath}/css/contact us.png" style="display:block; margin: 0 auto; width: 60px; height: 60px;">
                                                            <a href="#">1-877-968-7828</a>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>


                                            </div>


                                        </div>
                                    </div>


                                </div>
                            </div>

                            <div id="main-bottom">
                                <div class="IDS-MCMBanner IDS-MCMBanner-bottom banner-bottom" data-contentlocation="Bottom Banner" data-altlocation="Bottom Banner - Sign In - Ukrainian FCU" data-rotate="true"></div>
                            </div>

                        </div>


                    </div>

                </div>
            </div>
            <!-- end main content -->
            <div id="selectmenu_items_container"></div>
        </div>
        <!-- end page top container -->
        <!-- start page bottom container -->
        <div id="page-bottom-container">

            <!-- start footer -->
            <footer>
                <div class="footer-content footer-container">
                    <div class="footer-logo">
                        <a class="logo" href="/ufcu2014/">
                            <img src="hlm/Cocc.Templates/none" alt="" aria-hidden="true">
                            <img src="content.aspx?theme=Theme5&amp;color1=%23FFFFFF&amp;color2=%23FFFFFF&amp;image=Logo.svg" class="high-contrast" alt="" aria-hidden="true">
                        </a>
                    </div>
                    <div style="text-align:center;">
                        <div class="footer-container footer-text-container">
                            <div class="footer-text"> ©
                                <script type="text/javascript">
                                    document.write(new Date().getFullYear());
                                </script>2024 <span id="fiName">Ukrainian Federal Credit Union</span>. All rights reserved.<br> <a href="https://ukrainianfcu.org/wp-content/uploads/2017/07/Privacy-Policy-Facts.pdf" target="_blank">Privacy Policy</a>                                    </div>
                        </div>
                    </div>
                </div>
            </footer>

        </div>

    </div>
    <input type="hidden" id="__idshelper_x"><input type="hidden" id="__idshelper_y">


    <div><iframe id="cross-domain-store-server-iframe" src="https://cdn.appdynamics.com/adrum-xd.50d6b4f10ac71ecb7927a2ea41c8d91e.html" width="0" height="0" tabindex="-1" title="empty" style="display: none;"></iframe></div>
</body>