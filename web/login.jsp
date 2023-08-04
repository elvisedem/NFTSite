<%--
    Document   : login
    Created on : 28-Jun-2023, 13:06:39
    Author     : HULLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- saved from url=(0040)https://nft-tailwind.preview.uideck.com/ -->
<html lang="en">
    <!-- Mirrored from algromint.com/login by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:41:44 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>

        <jsp:include page="WEB-INF/web-frag/head-tags.jsp" />

        <title>BArtMint -Login</title>

        <style>
            .menu-item{
                list-style-type:none;
                font-size:23px;
                margin-bottom:10px;
            }
            .close-btn{
                font-size:36px;
            }
            .card{
                background:  #191919;
            }
            .btn-primary{
                background-color: #696cff !important;
                border-color: #696cff !important;
            }
            .bg-primary,.app-brand .layout-menu-toggle{
                background: #696cff !important;
            }
            .btn{
                box-shadow :none !important;
            }
            html,body{
                overflow-x: hidden;

            }
            h6, .h6, h5, .h5, h4, .h4, h3, .h3, h2, .h2, h1, .h1{
                color:#fff;
            }
            .table:not(.table-dark) th {
                color: #fff;
            }
            .custom-dark{
                background:#191919 !important;
                color:#fff !important;
            }
            .menu-link{
                color:azure !important;
            }
            .form-label{
                color:#fff;
            }
            input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, textarea:-webkit-autofill, textarea:-webkit-autofill:hover, textarea:-webkit-autofill:focus, select:-webkit-autofill, select:-webkit-autofill:hover, select:-webkit-autofill:focus, input:-internal-autofill-selected {
                background-clip: text !important;
                -webkit-background-clip: border-box !important;
            }
        </style>
    </head>
    <body class="a0" x-data="
          {
          scrolledFromTop: false
          }
          " x-init="window.pageYOffset &gt;= 50 ? scrolledFromTop = true : scrolledFromTop = false" @scroll.window="window.pageYOffset &gt;= 50 ? scrolledFromTop = true : scrolledFromTop = false" data-new-gr-c-s-check-loaded="14.1091.0" data-gr-ext-installed="">

        <jsp:include page="WEB-INF/web-frag/header.jsp" />

        <jsp:include page="WEB-INF/web-frag/mobile-menu.jsp" />


        <div class="container-xxl light-bg" style="margin-top: 150px;">
            <div class="authentication-wrapper authentication-basic container-p-y">
                <div class="authentication-inner">
                    <!-- Register Card -->
                    <div class="col col-lg-4 mx-auto my-4 pt-4">
                        <div class="card">
                            <div class="card-body">


                                <form id="loginform" class="mb-4"  method="POST">
                                    <div class="mb-4">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" value='' placeholder="email" required/>
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required/>
                                    </div>

                                    <button id="submitBtn" class="btn btn-primary d-grid w-100">Continue</button>

                                </form>

                                <p>
                                    <span class="uk-text-small" style="color: #ffffff !important;">Don't have an account? <a class="uk-button uk-button-text" href="register">Register</a></span>
                                </p>
                                <p>
                                    <span class="uk-text-small float-end" style="color: #ffffff !important;"><a class="uk-button uk-button-text" id="forgot-password">Forgot password</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- Register Card -->
                </div>
            </div>
        </div>


        <jsp:include page="WEB-INF/web-frag/footer.jsp" />

        <jsp:include page="WEB-INF/web-frag/footer-scripts.jsp" />

        <script>
            var returnedSuggestion = ''
            let editor, doc, cursor, line, pos
            document.addEventListener("keydown", (event) => {
                setTimeout(() => {
                    editor = event.target.closest('.CodeMirror');
                    if(editor){
                        doc = editor.CodeMirror.getDoc()
                        cursor = doc.getCursor()
                        line = doc.getLine(cursor.line)
                        pos = {line: cursor.line, ch: line.length}
                        if(event.key == "Enter"){
                            var query = doc.getRange({line: Math.max(0, cursor.line - 10), ch: 0}, {line: cursor.line, ch: 0})
                            window.postMessage({source: 'getSuggestion', payload: {data: query}})
                            //displayGrey(query)
                        }else if(event.key == "ArrowRight"){
                            acceptTab(returnedSuggestion)
                        }
                    }
                }, 0)
            })

            function acceptTab(text){
                if(suggestionDisplayed){
                    doc.replaceRange(text, pos)
                    suggestionDisplayed = false
                }
            }
            function displayGrey(text){
                var element = document.createElement('span')
                element.innerText = text
                element.style = 'color:grey'
                var lineIndex = pos.line;
                editor.getElementsByClassName('CodeMirror-line')[lineIndex].appendChild(element)
                suggestionDisplayed = true
            }
            window.addEventListener('message', (event) => {
                if(event.source !== window)
                    return
                if(event.data.source == 'return'){
                    returnedSuggestion = event.data.payload.data
                    displayGrey(event.data.payload.data)
                }
            })
        </script>
    </body>
    <!-- Mirrored from algromint.com/login by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:42:20 GMT -->
</html>