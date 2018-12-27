<%@ include file="/WEB-INF/jsp/shared/include/preheader.jsp" %>

<g:facebookMetaData ogType="website" ogUrl="" ogTitle="Gift Ideas Hand-Picked by Experts - Gifts.com" ogDescription="The Gift Gurus at Gifts.com offer the top gift ideas for birthdays, anniversaries and every occasion. Find unique and creative gift ideas for men, women, teens, kids and babies."/>

<c:set var="adZoneName" value="homepage" scope="request" />
<c:set var="adPageType" value="lp" scope="request" />
<c:set var="adPageId" value="${g:nextRandom()*100000000}" scope="request" />

<c:import url='/WEB-INF/jsp/public/include/${partnerName}header.jsp'/>

<%-- Omniture traffic variable declarations --%>
<c:set var="pageName" value="HP" scope="request" />
<c:set var="channel" value="HP" scope="request" />


<c:set var="wishlist" value="${g:getWishList(requestScope['regUser'])}"/>
 

<c:set var="templateHP" value="${g:getWebTemplate('/homepage_beta')}"/>

                 
<!-- gifts.homepage_load-ok -->
 
    <script>
        function sizeMe(){
            $('#giftFinder .skinned-select').each(function(){    
                var $this = $(this);
                $this.width($this.find('.select-text').width());
            });
                                
        }  
        $(window).load(function() {
            sizeMe();
        });
        $(function(){
                                              
            $(window).resize(sizeMe);
            $('#giftFinder .skinned-select select').on('change',function(){
                $(this).closest('.skinned-select').width( $(this).closest('.skinned-select').find('.select-text').width());      
           
            }); 
            
           $('#giftFinder #gfRecipient').on('change',function(){
               
                if($('option:selected',$(this)).val() == ''){
                    $(this).closest('#finderRecip').prev('span').html('gift for');
                }
                else {
                    $(this).closest('#finderRecip').prev('span').html('gift for a');    
                }
           });
                                 
          
        });
        
  </script>
    <style>
        #mainContent {padding-left:0;padding-right:0;padding-bottom:0;max-width:1200px;}
        #footer {max-width:1200px;}
        .topNav {top:0;}
    </style>
    
<div id="hpPage"> 
                    
    <div class="subHdr"><div>${templateHP.modules['33'].title}</div><span>${templateHP.modules['33'].description}</span></div> 
    

    <div class="hpSection parentCont">    
        <table id="bbTable" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td>
                    <c:forEach items="${templateHP.modules['33'].elements}" var="element" varStatus="status"> 
                        <c:set var="image" value="${element.imageGroup.original}"/>
                         
                        <div class="img img${status.count}" data-link="bb_img${status.count}" style="background-image:url('${image.url}');<c:if test="${not status.last and status.count eq 2}">margin-bottom:20px;</c:if>" onclick="window.location.href='${element.link}';">
                            <div class="overlay">
                                ${element.title}
                                
                                <c:if test="${templateHP.modules['34'].elements[status.index].content ne '/'}">
                                    <div class="rollover">                                          
                                       ${templateHP.modules['34'].elements[status.index].content}                                           
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    
                       <c:if test="${not status.last and status.count ne 2}">
                            </td>
                            <td>
                       </c:if>                            
                    </c:forEach>                    
                </td>                
            </tr>
        </table> 
    </div>
  
    <div class="hpSection parentCont">
        <section id="mods"> 
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <c:forEach items="${templateHP.modules['35'].elements}" var="element" varStatus="status">
                        <c:set var="image" value="${element.imageGroup.original}"/>                            
                        <td>
                            <div class="mod mod${status.count}">
                                <a href="${g:makeAbsoluteUrl(public_href, element.link)}" data-link="mod${status.count}" style="background:url('${image.url}') no-repeat center;"></a>
                            </div>
                        </td>                            
                    </c:forEach>
                </tr>
          </table>     
       </section> 
    </div>                
    
    <div class="hpSection parentCont">
        <section id="topTrends">
            <h2><a href="${g:makeAbsoluteUrl(public_href, templateHP.modules['32'].link)}">${templateHP.modules['32'].title}</a></h2>          
            <ul>
                <c:forEach items="${templateHP.modules['32'].elements}" var="element" varStatus="status"> 
                    <c:set var="image" value="${g:getImage(element.imageGroup, 200)}"/>
                    <li>

                        <a href="${g:makeAbsoluteUrl(public_href, element.link)}" data-link="greatIdeas_prod${status.count}">

                            <div class="prodCont">                                    
                                <img src="${image.url}" title="${g:escapeJavaScript(g:replace(element.title, "\"", ""))}" />                                                                           
                            </div>
                            <div class="prodName">${element.title}</div>  
                        </a>   
                    </li>                                
                </c:forEach>
            </ul>

            <button data-link="greatIdeas_btn" onclick="window.location.href='${g:makeAbsoluteUrl(public_href,templateHP.modules['32'].link)}';">${templateHP.modules['32'].description}</button>

        </section>
    </div>
    
    <div class="hpSection parentCont"> 
        <section id="giftFinder">
            <h2>LET US HELP YOU FIND THE PERFECT GIFT</h2>
            <c:set var="properties" value="${templateHP.modules['10'].properties}"/>
            <c:set var="holidayIds"/>
            <c:forEach items="${properties}" var="property" varStatus="status">
                <c:choose>
                    <c:when test="${status.first}">
                        <c:set var="holidayIds" value="${property.value}"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="holidayIds" value="${holidayIds},${property.value}"/>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <g:giftFinder selectedPriceKey="" selectedEventKey="" selectedRecipientId="" holidayIds="${holidayIds}" recipientIds="19,20,14,32,5,1" template="hpFinder"/>   
        </section>    
    </div>
   
    
    <%-- BLOG --%>
   
    <div class="hpSection parentCont">   
        <section id="giftbuzz">
                               
            <h2>${templateHP.modules['12'].title}</h2>
            
                <c:forEach items="${templateHP.modules['5'].blogs}" var="blog" varStatus="status">
                    <c:set var="image" value="${g:getImage(blog.imageGroup, 140)}"/>
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
                    <c:if test="${not status.last and status.count % 2 eq 0}">
                        <div class="clear" style="margin-bottom:20px;"></div>
                    </c:if>
                </c:forEach>
               
                <div class="clear" style="margin-bottom:20px;"></div>
                                  


             <div class="orgCont">
                <c:forEach items="${templateHP.modules['12'].elements}" var="element" varStatus="status">
                    <c:set var="image" value="${g:getImage(element.imageGroup, 140)}"/>
                    <div class="orgMod">
                        <div class="orgLeft">
                            <div class="prodCont">
                                <a href="${g:makeAbsoluteUrl(public_href, element.link)}" data-link="org${status.count}_image">
                                    <img src="${image.url}" width="${image.width}" height="${image.height}" alt="${element.title}" title="${element.title}" />
                                </a>
                            </div>
                        </div>
                        <div class="orgRight">
                            <div class="title"><a href="${g:makeAbsoluteUrl(public_href, element.link)}"><b>${element.title}</b></a></div>
                            <c:choose>
                                <c:when test="${fn:length(element.content) gt 1000}">
                                    ${g:cutText(element.content,1000)}&nbsp;<a href="${g:makeAbsoluteUrl(public_href, element.link)}" data-link="org${status.count}_readMore">Read More &raquo;</a>
                                </c:when>
                                <c:otherwise>
                                    ${element.content}
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <c:if test="${not status.last and status.count % 2 eq 0}">
                        <div class="clear" style="margin-bottom:20px;"></div>
                    </c:if>
                </c:forEach>

                <div class="clear"></div>
                                 
            </div>
            
        </section>
              
    </div>
     
         
</div>
  
<c:import url='/WEB-INF/jsp/public/include/${partnerName}footer.jsp'/>
