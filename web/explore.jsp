<%--
    Document   : explore
    Created on : 27-Jun-2023, 13:34:08
    Author     : HULLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!-- saved from url=(0040)https://nft-tailwind.preview.uideck.com/ -->
<html lang="en">
    <!-- Mirrored from algromint.com/explore by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:30:16 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>

        <jsp:include page="WEB-INF/web-frag/head-tags.jsp" />

        <title>BArtMint -NFT MarketPlace</title>

        <style>
            .menu-item{
                list-style-type:none;
                font-size:23px;
                margin-bottom:10px;
            }
            .close-btn{
                font-size:36px;
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
        <div class="ae"  style="margin-top: 150px; margin-left: 20px !important;">


            <div class="a2w a3l a1z a3m">
                <div class="a1R a3">
                    <div class="a4 ak">
                        <h2 class="a1Y a3n a1O aZ text-center">
                            NFT MarketPlace
                        </h2>
                    </div>
                </div>
            </div>
            <div class="a1R a3 a1S">
                <c:forEach var="nftArt" items="${nftArts}">
                    <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                        <div class="a1U a1V a1W a1G aM a2T[18px]">
                            <div class="af a1Y a2p av">
                                <img src="/FileUploaderApp/temp/${nftArt.imageName}" alt="auctions" class="a4" style="height:250px;">
                            </div>
                            <div>
                                <h3>
                                    <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                        ${nftArt.artName}</a>
                                </h3>
                                <div class="a2b a3 a5 ah">
                                    <div class="a4">
                                        <div class="a3 a5">
                                            <div class="a4">
                                                <h4 class="a2Y aX aZ">
                                                    <a href="javascript:void(0)">@${nftArt.userId}</a>
                                                    <span class="al a2Y a1o a1t">
                                                        creator
                                                    </span>
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="a4">
                                        <h5 class="a33 a2Y aX aZ">
                                            ${nftArt.price} ETH
                                            <span class="al a2Y a1o a1t">
                                                Current Bid
                                            </span>
                                        </h5>
                                    </div>
                                </div>
                                <div class="a3 a5 ah a34 a1G a35">
                                    <c:choose>
                                        <c:when test="${user.userId ne nftArt.userId}">
                                            <form id="buy-art">
                                                <input name="id" hidden="" value="${nftArt.artId}"/>
                                                <button type="submit" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                                    Place Bid
                                                </button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>

                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <form method="GET" action="previous-art-page" class="float-left">
                    <input hidden="" value="${page -1}" name="page"/>
                    <c:if test="${page > 1}">
                        <div class="col-7">
                            <button class="btn btn-secondary"><i class="icon-arrow-left"></i> Previous</button>
                        </div>
                    </c:if>
                </form>
                <form method="GET" action="next-art-page" class="float-right">
                    <input hidden="" value="${page}" name="page"/>
                    <c:if test="${page < totalPages}">
                        <div class="col-7">
                            <button id="loadMore" class="btn btn-secondary" type="submit">Next <i class="icon-arrow-right"></i></button>
                        </div>
                    </c:if>
                </form>
            </div>
        </div>
        <jsp:include page="WEB-INF/web-frag/footer.jsp" />

        <jsp:include page="WEB-INF/web-frag/footer-scripts.jsp" />
        <script>
            $(document).ready(function(){
                $('#buy-art').submit(function(e){
                    e.preventDefault();
                    var formData = $(this).serialize();
                     $.ajax({
                        url: 'dashboard/buy-nft',
                        method: 'POST',
                        data: formData,
                        dataType: 'JSON',
                        beforeSend: function(xhr){
                            $btn.find('i').removeClass('fa-upload').addClass('fa-refresh').addClass('fa-spin');
                        },
                        success: function(data, textStatus, jqXHR){
                            if(data.message === 'success'){
                                swal.fire("Success!", "You Have Purchase this Art Successfully!", "success");

                            }else
                                swal.fire("Error!", data.message, "error");
                        },
                        complete: function(jqXHR, textStatus){
                            $btn.find('i').addClass('fa-upload').removeClass('fa-refresh').removeClass('fa-spin');
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            swal("Error!", "There was an error!", "error");
                        }
                    });
                });
            });
        </script>

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
    <!-- Mirrored from algromint.com/explore by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:41:42 GMT -->
</html>
