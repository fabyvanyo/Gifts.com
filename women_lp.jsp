<%@ include file="/WEB-INF/jsp/shared/include/preheader.jsp" %>

<g:facebookMetaData ogType="website" />
<c:set var="adZoneName" value="womens" scope="request" />
<c:set var="adPageType" value="lp" scope="request" />
<c:set var="adRecipient" value="her" scope="request" />

<c:import url='/WEB-INF/jsp/public/include/${partnerName}header.jsp'/>


<%-- Omniture traffic variable declarations --%>
<c:set var="pageName" value="LP: Rec: Women" scope="request" />
<c:set var="channel" value="LP: Rec" scope="request" />


<c:set var="templateWomen" value="${g:getWebTemplate('/ideas/her_beta')}"/>
<c:set var="templatePersWomen" value="${g:getWebTemplate('/personality/women_beta')}"/>


<c:set var="wishlist" value="${g:getWishList(requestScope['regUser'])}"/>


                                  
<div id="fb-root"></div>


<div id="womenLP" class="recipPage2 heshe"> 
    <div id="recipBB">
       <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="4">
                    <h1>${templateWomen.modules['31'].title}</h1> 
                    <div class="subtitle">${templateWomen.modules['31'].description}</div>
                    
                    <div class="socials">
                       <div class="icn_social"><fb:like href="${headerData.facebookLike.url}" layout="button_count" show_faces="false" width="280px;" ref="fbLike"></fb:like></div>
                       <div class="icn_social"><div class="g-plusone" data-size="medium" data-count="true"></div></div>                                          
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <c:forEach items="${templateWomen.modules['31'].elements}" var="element" varStatus="status"> 
                        <c:set var="image" value="${element.imageGroup.original}"/>

                        <div class="img img${status.count}" data-link="bb_img${status.count}" style="background-image:url('${image.url}');" <c:if test="${status.count ne 5}">onclick="window.location.href='${g:makeAbsoluteUrl(public_href, element.link)}';"</c:if>>

                            <c:if test="${status.count ne 5}">
                                 <div class="overlay">
                                    ${element.title}
                                    <c:if test="${templateWomen.modules['35'].elements[status.index].content ne '/'}">
                                        <div class="rollover">                                          
                                           ${templateWomen.modules['35'].elements[status.index].content}                                           
                                        </div>
                                    </c:if>                                  
                                </div> 
                             </c:if>
                             <c:if test="${status.count eq 5}">                                
                                 <div>
                                   <b>${element.title}</b>
                                     <c:forEach items="${templateWomen.modules['32'].elements}" var="element2" varStatus="status2">
                                        <div onclick="window.location.href='${g:makeAbsoluteUrl(public_href, element2.link)}';" class="links" data-link="bb_img${status.count}_link${status2.count}">${element2.title}</div>
                                    </c:forEach>
                                 </div>
                            </c:if> 
                        </div>
                        
                        <c:if test="${not status.last and status.count ne 2}">
                            </td>
                            <td <c:if test="${status.count eq 3}">class="alt"</c:if>>                        
                        </c:if>
                    </c:forEach>                       
                </td>
            </tr>
        </table>
      
    </div>                                                   
        
    <div id="topTrendsDiv" class="lpSection parentCont">
        <section id="topTrends" class="left">
            <ul>
                 <c:forEach items="${templateWomen.modules['33'].elements}" var="element" varStatus="status">
                    <c:set var="image" value="${g:getImage(element.imageGroup, 200)}"/>
                    <li>

                        <a href="${g:makeAbsoluteUrl(public_href, element.link)}" data-link="trends_prod${status.count}">

                            <div class="prodCont">
                                <img src="${image.url}" title="${g:escapeJavaScript(g:replace(element.title, "\"", ""))}"/>
                            </div>
                            <div class="prodName">${g:cutText(element.title,60)}</div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
            <div class="clear"></div>
            <div class="overlay">${templateWomen.modules['33'].title}</div>
        </section>
        
        <section id="ad" class="right">
            <%@ include file="/WEB-INF/jsp/public/include/adCallModule.jsp" %>         
            <div class="cpmtitle">Advertisement</div>
        </section>
        
        <div class="clear"></div>                    
     </div>
     
                  
    <div class="lpSection parentCont">        
        <section id="topPicksWomen" class="bg">
            

            <h2><a href="${g:makeAbsoluteUrl(public_href, templateWomen.modules['34'].link)}" data-link="top_title">${templateWomen.modules['34'].title}</a></h2>

                                            
            <ul>
                <c:forEach items="${templateWomen.modules['34'].elements}" var="element" varStatus="status">
                    <c:set var="image" value="${g:getImage(element.imageGroup, 200)}"/>
                    <li>

                        <a href="${g:makeAbsoluteUrl(public_href, element.link)}" data-link="top_prod${status.count}">

                            <div class="prodCont">
                                <img src="${image.url}" title="${g:escapeJavaScript(g:replace(element.title, "\"", ""))}"/>
                                
                                <c:if test="${g:isGiftsShop(element.productId)}">  
                                    <div class="shopCart">
                                        <div class="shadow"></div>
                                        <span class="icn_cart" data-link="top_prod${status.count}_cart"></span>
                                        <span class="txt">BUY ON GIFTS.COM</span>                                                
                                    </div>
                                </c:if> 
                                 
                                <div class="wishListProd">
                                    <c:if test="${not g:isGiftsShop(element.productId)}">   
                                        <div class="shadow"></div> 
                                    </c:if> 
                                                					                                                           
                                    <span id="${element.productId}" data-link="top_prod${status.count}_heart" 
                                        <c:choose>
                                            <c:when test="${fn:length(wishlist) gt 0}">	
                                                <c:choose><c:when test="${g:isWishListItem(wishlist, element.productId, requestScope['regUser'])}">class="saveProdOn"</c:when><c:otherwise>class="saveProdOff"</c:otherwise></c:choose>>	
                                            </c:when>
                                            <c:otherwise>
                                                class="saveProdOff">
                                            </c:otherwise>
                                       </c:choose> 
                                         
                                        <!-- When there are some wishlists associated with the product -->
                                        <div id="wishpop-${element.productId}" class="addToListWin">                                                                
                                             <div class="title">MY GIFT LISTS</div>
                                             <c:set var="listid" value="0" />
                                             <c:forEach items='${wishlist}' var='wishlistm' varStatus='status2'>
                                                <c:if test="${wishlistm.name eq 'My Gift List'}">                                                                                                                                              
                                                    <c:set var="listid" value="${wishlistm.id}" />                                                                                                                                                                                     	                                                                        
                                                </c:if>                                                          
                                            </c:forEach>
                                             <div class="defaultList"><input type="checkbox" name="listName" id="${listid}" value="My Gift List" <c:if test="${g:isProductInWishList(wishlist, 'My Gift List', element.productId, requestScope['regUser'])}">checked</c:if> /><label>My Favorites</label></div>                                                                                                                                 
                                                       
                                             <div class="dynList">                                                            	                                                                                                                          
                                                <c:forEach items='${wishlist}' var='wishlistm' varStatus='status2'>
                                                    <c:if test="${wishlistm.name ne 'My Gift List'}">                                                                                                                                              
                                                        <div><input type="checkbox" name="listName" id="${wishlistm.id}" value="${wishlistm.name}" <c:if test="${g:isProductInWishList(wishlist, wishlistm.name, element.productId, requestScope['regUser'])}">checked</c:if> /><label>${wishlistm.name}</label></div>                                                                                                                                	                                                                        
                                                    </c:if>
                                                </c:forEach>
                                             </div>                                                               
                                                                                                          
                                             <div class="newListCont"><input type="text" name="newList" value="" placeholder="Add List" /><button>OK</button></div>                                                                                                                                                                                                                                                                                                                    
                                        </div>                                                        
                                    </span>
                                    <span class="social_icons">                                                    
                                        <span class="f_icon" data-link="top_prod${status.count}_social_fb" onClick="openWindow('${element.link}', '${image.url}', '${g:escapeJavaScript(g:replace(element.title, "\"", ""))}');"></span>
                                        <span class="p_icon" data-link="top_prod${status.count}_social_pinterest" onClick="window.open('http://pinterest.com/pin/create/button/?url=${gifts_href}/product/%3FprodID%3D${element.productId}&media=${image.url}&description=${g:escapeJavaScript(g:replace(element.title, "\"", ""))}', '_pinIt', 'status=no,resizable=yes,scrollbars=yes,personalbar=no,directories=no,location=no,toolbar=no,menubar=no,width=632,height=270,left=0,top=0');return false;"></span>                                                                                                                                                                                                 
                                        <span class="g_icon" data-link="top_prod${status.count}_social_google" onclick="window.open('https://plus.google.com/share?url=${gifts_href}/product/%3FprodID%3D${element.productId}&media=${image.url}&description=${g:escapeJavaScript(g:replace(element.title, "\"", ""))}', 'popupwindow', 'status=no,resizable=yes,scrollbars=yes,personalbar=no,directories=no,location=no,toolbar=no,menubar=no,width=632,height=270,left=0,top=0');return false;"></span> 
                                        <span class="t_icon" data-link="top_prod${status.count}_social_twitter" onClick="window.open('http://twitter.com/home?status=Check%20this%20out%20:%20${g:escapeJavaScript(g:replace(element.title, "\"", ""))}%20${gifts_href}/product/%3FprodID%3D${element.productId}', 'popupwindow', 'status=no,resizable=yes,scrollbars=yes,personalbar=no,directories=no,location=no,toolbar=no,menubar=no,width=632,height=270,left=0,top=0');return false;"></span>
                                    </span>
                                </div>      
                            </div>
                            <div class="prodName">${g:cutText(element.title,50)}</div>
                        </a>
                    </li>
                </c:forEach>                      
            </ul>
            <div class="clear"></div>

            <div class="seeAll"><a href="${g:makeAbsoluteUrl(public_href, templateWomen.modules['34'].link)}" data-link="top_seeAll">${templateWomen.modules['34'].description}</a></div>

                                           
        </section>
                         
    </div>
  
     
    <div class="lpSection parentCont">
        <section id="pers">
          
            <h2><a href="${g:makeAbsoluteUrl(public_href, templatePersWomen.modules['4'].link)}" data-link="pers_title">${templatePersWomen.modules['4'].title}</a></h2>
            
            <ul>
                <c:forEach items="${templatePersWomen.modules['4'].elements}" var="element" varStatus="status" begin="0" end="11">
                    <c:set var="image" value="${g:getImage(element.imageGroup, 200)}"/>
                    <li>

                        <a href="${g:makeAbsoluteUrl(public_href, element.link)}" data-link="pers_${g:replace(element.title, " ", "-")}">

                            <div class="prodCont">
                                <img src="${image.url}" />
                            </div>
                            <div class="prodName">${g:cutText(element.title,50)}</div>
                        </a>
                    </li>
                </c:forEach>              
            </ul>
            <div class="clear"></div>

            <div class="seeAll"><a href="${g:makeAbsoluteUrl(public_href, templatePersWomen.modules['4'].link)}" data-link="pers_seeAll">${templatePersWomen.modules['4'].description}</a></div>

        </section>                   
                     
    </div>
                    

   <%-- SEO Content: Products Module --%>
    <c:if test="${not empty templateWomen.modules['8']}">  
   
        <div class="lpSection parentCont">      
            <section id="mostPopular">

                <h2><a href="${g:makeAbsoluteUrl(public_href, templateWomen.modules['8'].link)}" data-link="mostPop_title">${templateWomen.modules['8'].title}</a></h2>

                        
                <ul>
                    <c:forEach items="${templateWomen.modules['8'].products}" var="product" varStatus="status">
                        <c:set var="image" value="${g:getImage(product.imageGroup, 200)}"/>
                        <li>

                            <a href="${g:makeAbsoluteUrl(public_href, product.productPageUrl)}" data-link="mostPop_prod${status.count}">

                                <div class="prodCont">
                                    <img src="${image.url}" />
                                </div>
                                <div class="prodName">${g:cutText(product.name,60)}</div>
                            </a>
                        </li>
                    </c:forEach>
                  
                </ul>
                <div class="clear"></div>

                <div class="seeAll"><a href="${g:makeAbsoluteUrl(public_href, templateWomen.modules['8'].link)}" data-link="mostPop_seeAll">${templateWomen.modules['8'].description}</a></div>

                                         
            </section>  
        </div>
    </c:if>

   <%-- SEO Content: Product & Content --%>
   <c:if test="${not empty templateWomen.modules['9']}">
        <div class="lpSection parentCont" style="margin-bottom:-20px;">  
            <section id="moreGiftIdeas" class="bg">
                                    
                <h2>${templateWomen.modules['9'].title}</h2>
               
                <div class="orgCont">
                    <c:set var="displayCnt" value="${0}"/>
                    <c:forEach items="${templateWomen.modules['9'].elements}" var="element" varStatus="status">
                        <c:set var="image" value="${g:getImage(element.imageGroup, 200)}"/>
                        <c:if test="${displayCnt < 2}">
                            <c:set var="displayCnt" value="${displayCnt + 1}"/>
                            <div class="orgMod">  
                                <div class="orgLeft">
                                    <a href="${g:makeAbsoluteUrl(public_href, element.link)}" data-link="org${status.count}_image">
                                        <div class="prodCont">
                                            <img src="${image.url}" />
                                        </div>
                                    </a>
                                </div>
                                <div class="orgRight">
                                    <div class="title"><a href="${g:makeAbsoluteUrl(public_href, element.link)}"><b>${element.title}</b></a></div>
                                    ${element.content}
                                </div>
                                <div class="clear"></div>  
                            </div>
                        </c:if>
                        <c:if test="${not status.last and status.count % 2 eq 0}">
                            <div class="clear" style="margin-bottom:20px;"></div>
                        </c:if>                         
                    </c:forEach>
                     <c:set var="displayCnt" value="${0}"/>
                     <c:forEach items="${templateWomen.modules['29'].blogs}" var="blog" varStatus="status">
                        <c:set var="image" value="${g:getImage(blog.imageGroup, 140)}"/>
                        <c:if test="${displayCnt < 2}">
                            <c:set var="displayCnt" value="${displayCnt + 1}"/>
                            <div class="orgMod">    
                                <div class="orgLeft">
                                    <div class="prodCont">                                                                    
                                        <a href="${blog.url}" data-link="blog${status.count}_image">
                                            <img src="${image.url}" width="${image.width}" height="${image.height}" alt="${blog.name}" title="${blog.name}"/>
                                        </a>
                                    </div>                                                                   
                                </div>                                                                                                               
                                <div class="orgRight">
                                    <div class="title"><a href="${blog.url}"><b>${blog.name}</b></a></div>
                                    ${g:cutText(blog.formattedContent,450)}&nbsp;<a href="${blog.url}" data-link="blog${status.count}_readMore">Read More &raquo;</a>
                                </div>                                                                                                                                                                                          
                            </div>
                        </c:if>
                        <c:if test="${not status.last and status.count % 2 eq 0}">
                            <div class="clear" style="margin-bottom:20px;"></div>
                        </c:if> 
                    </c:forEach>  
                    <div class="clear"></div>
                    <c:if test="${not empty templateWomen.modules['10']}">
                        <div class="hor"></div>
                        <div align="center" class="extraLinks">
                            <c:forEach items="${templateWomen.modules['10'].elements}" var="element" varStatus="status">
                                <a href="${g:makeAbsoluteUrl(public_href, element.link)}" data-link="org_relatedlink${status.count}">${element.title}</a><c:if test="${not status.last}">&nbsp;&nbsp;|&nbsp;&nbsp;</c:if>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
               
            </section>                  
                                          
        </div>
   </c:if>   
    

</div>  
   

<script>
  window.fbAsyncInit = function() {
      FB.init({appId: '${g:getProperty("FACEBOOK_APPLICATION_ID")}', status: true, cookie: true,xfbml: true, oauth: true});

      FB.Event.subscribe('edge.create', function(href,widget) {
          var s = s_gi('${omnitureAcctName}');
          s.linkTrackVars = 'prop8,products,events';
          s.linkTrackEvents = 'event16';
          s.prop8 = 'LP: REC: Womens: FB Like';
          s.events = 'event16';
          s.products = ';LP: REC: Womens: FB Like;;;;';
          s.tl(this,'o','LP: REC: Womens: FB Like');
      });
  };

  (function() {
    var e = document.createElement('script'); e.async = true;
    e.src = document.location.protocol +
      '//connect.facebook.net/en_US/all.js#xfbml=1';
    document.getElementById('fb-root').appendChild(e);
  }());


</script>

<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>


<c:import url='/WEB-INF/jsp/public/include/${partnerName}footer.jsp'/>