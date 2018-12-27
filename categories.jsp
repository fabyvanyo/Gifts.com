<%-- for the /search/categories print all cats page. --%>

<%@ include file="/WEB-INF/jsp/shared/include/preheader.jsp" %>

<c:set var="adZoneName" value="category" scope="request" />
<c:set var="adPageType" value="lp" scope="request" />

<c:import url='/WEB-INF/jsp/public/include/${partnerName}header.jsp'/>

<c:set var="templateCat" value="${g:getWebTemplate('/search/categories_beta')}"/>
<c:set var="templateCat2" value="${g:getWebTemplate('/search/categories')}"/>
<c:set var="templateHeader" value="${g:getWebTemplate('/include/header_beta')}"/>
<c:set var="templateHP" value="${g:getWebTemplate('/homepage_beta')}"/>

<%-- Omniture traffic variable declarations --%>
<c:set var='pageName' value='LP: CAT' scope='request'/>
<c:set var='channel' value='LP' scope='request'/>

 

<div id="categories" class="landingPage">

   <div id="lpBB" class="parentCont">
        <section id="bb" class="left">      
            <div class="bbInner">
                 <h1>${templateCat.modules['1'].title}</h1>
                 <!-- <div class="subTitle">${templateCat.modules['1'].description}</div>-->

                <div class="cats">
                    <div class="catTitle">Upcoming Holidays</div>
                    <c:forEach items="${templateHeader.modules['1'].elements}" var="element">
                        <div><a href="${g:makeAbsoluteUrl(public_href, element.link)}">${element.title}</a></div>

                    </c:forEach>
                </div>
                <div class="cats">
                    <div class="catTitle">${templateCat.modules['3'].title}</div>
                    <c:forEach items="${templateCat.modules['3'].elements}" var="element">

                        <div><a href="${g:makeAbsoluteUrl(public_href, element.link)}">${element.title}</a></div>

                    </c:forEach>
                </div>
            </div>
        
        </section>
       
        <section id="sideGiftFinder" class="right sideBar">
            <div class="sideBarInner">             
                <div class="title">GIFT FINDER</div>
                <div class="subTitle">Gift giving made simple</div>
                <div class="circCont">
                    <div class="circ circ1"><p>1</p></div> 
                    <div class="circ circ2"><p>2</p></div> 
                    <div class="circ circ3"><p>3</p></div>
                </div>
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
                <g:giftFinder selectedPriceKey="" selectedEventKey="" selectedRecipientId="" holidayIds="${holidayIds}" recipientIds="19,20,14,32,5,1" template="defaultFinder"/>
                <div class="clear"></div>
            </div>
        </section>
       
        <div class="clear"></div>                                                       
   </div>   

   <div class="lpSection parentCont">
        <section id="cat" class="scrollCont">            
            <h2>Shop All Categories</h2>
            <%-- <table border="0" width="100%" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
                <tr valign="top">
                    <td>
                    <table border="0" width="98%" cellpadding="0" cellspacing="0">
                        <c:forEach items="${categories}" var="category" varStatus="categoryStatus">
                            <c:if test="${not categoryStatus.first and categoryStatus.count % categoryPerColumn eq 0}">
                                </table></td><td><table border="0" width="98%" cellpadding="0" cellspacing="0">
                            </c:if>

                            <tr valign="top">
                                <td class="catMain"><a href="${g:getCategorySearchResultPageURL(category.id, 0, 0)}">${category.name}</a></td>
                            </tr>
                            <c:forEach items="${category.sortedChildren}" var="sub" varStatus='status'>
                                <tr valign="top">
                                     <td>
                                         <div<c:if test="${not empty sub.children}"> class="subSel"</c:if>><a href="${g:getCategorySearchResultPageURL(category.id, sub.id, 0)}">${sub.name}</a> <c:if test="${not empty sub.children}"><img src="${image_href}images/search/category/arrowSub.gif"/></c:if>
                                             <c:if test="${not empty sub.children}">
                                                <div class="subTagCont">
                                                    
                                                        <c:forEach  varStatus='status' items='${sub.sortedChildren}' var="subSub">
                                                            <div><a href="${g:getCategorySearchResultPageURL(category.id, sub.id, subSub.id)}">${subSub.name}</a></div>
                                                        </c:forEach>
                                                        
                                                    </div>
                                                </div>
                                            </c:if>
                                       </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                    </table>
                    </td>
                </tr>
            </table> --%>
               
            <c:if test="${fn:length(templateCat2.orderedModules) gt 0}"> 
                <div id="catTable">                                                                       
                                                   
                    <c:forEach items="${templateCat2.orderedModules}" var="module" varStatus="moduleStatus">                               
                        <c:if test="${module.sequence gt 0}">                                                                                               
                                                                                                                                                                   
                            <div class="catCont">
                                <div id="${module.title}" class="catMain"><a href="${module.link}">${module.title}</a></div>                                        
                                <c:forEach items="${module.elements}" var="element" varStatus="status">
                                    <c:if test="${element.name != '/'}">
                                     
                                        <div class="subSel">
                                            <a href="${element.link}">${element.name}</a>
                                            <c:if test="${not empty element.description}">                                                    
                                                <div class="subTagCont">                                                    
                                                    <c:forEach items="${templateCat2.modules['1'].elements}" var="subModule" varStatus="status"> 
                                                        <c:if test="${element.description == subModule.name}">
                                                            ${subModule.content}
                                                        </c:if>                                                            
                                                    </c:forEach>  
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:if>                                              
                                    
                                </c:forEach>
                            </div>                                                      
                        </c:if> 
                                                 
                    </c:forEach> 
                                                                        
                </div>
            </c:if>

            <%--
            <table border="0" cellpadding="0" cellspacing="0" id="catTable">
                <tr valign="top">            
                    <td>
                        <table border="0" width="98%" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/stylish-accessories/70T">Accessories</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/cufflinks/70TT1j">Cufflinks</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/handbags-briefcases/70TGJG">Handbags & Briefcases</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/briefcases-laptop-bags/70TGJGg6X">Briefcases & Laptop Bags</a></div>                
                                            <div><a href="${public_href}categories/fashion-bags/70TGJGGOj">Fashion Bags</a></div>
                                            <div><a href="${public_href}categories/shopping-totes/70TGJG7dJ">Shopping Totes</a></div>                                           
                                        </div>
                                    </div>
                                </td>
                            </tr>            
                            <tr valign="top">
                                <td><a href="${public_href}categories/scarves-gloves-winter-gear/70T9s3">Hats, Gloves & Scarves</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/sunglasses-accessories/70TNur">Other Accessories</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/shoes/70TJoJ">Shoes</a>&nbsp;&rsaquo;                                             
                                        <div class="subTagCont">                                                            
                                            <div><a href="${public_href}categories/casual-shoes/70TJoJex9">Casual Shoes</a></div>
                                            <div><a href="${public_href}categories/dressy-shoes/70TJoJ3xO">Dressy Shoes</a></div>
                                            <div><a href="${public_href}categories/slippers/70TJoJ6rq">Slippers</a></div>
                                        </div>
                                    </div>            
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div><a href="${public_href}categories/ties-suit-accessories/70Tjdn">Ties & Suit Accessories</a> </div>
                                </td>
                            </tr>            
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/wallets-small-goods/70TaR6">Wallets & Small Goods</a>&nbsp;&rsaquo;                                   
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/gadget-accessories-cases/70TaR6cfq">Gadget Cases</a></div>
                                            <div><a href="${public_href}categories/money-clips-key-chains/70TaR6yLh">Money Clips & Key Chains</a></div>            
                                            <div><a href="${public_href}categories/wallets-card-cases/70TaR6vJI">Wallets & Card Cases</a></div>                                                    
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">            
                                <td class="catMain"><a href="${public_href}categories/cigar-tobacco-gift-ideas/ga2">Alcohol & Tobacco</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/home-bar-gifts/ga2iDy">Bar</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/home-bar-d-cor/ga2iDy00k">Bar D&eacute;cor</a></div>        
                                            <div><a href="${public_href}categories/home-bar-accessories/ga2iDyrZT">Barware & Tools</a></div>
                                            <div><a href="${public_href}categories/drinking-games/ga2iDypGn">Drinking Games</a></div>                                                    
                                        </div>
                                    </div>
                                </td>            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/cigar-tobacco-gift-ideas/ga2W69">Cigars & Other Tobacco</a></td>
                            </tr>
                            <tr valign="top">            
                                <td><a href="${public_href}categories/spirits-beers/ga26J3">Spirits & Beers</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/wine-champagne-gift-ideas/ga2Zqr">Wine & Champagne</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/wine-gift-baskets/ga2nHp">Wine Gift Baskets</a></td>
                            </tr>
                            <tr valign="top">            
                                <td class="catMain"><a href="${public_href}categories/arts-crafts-gift-ideas/Beb">Arts & Crafts</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/art-supplies/BebdFa">Art Supplies</a></td>
                            </tr>            
                            <tr valign="top">
                                <td><a href="${public_href}categories/arts-crafts-gift-ideas/BebD3A">Crafty Kits</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/scrapbooking-gift-ideas/BebzZN">Scrapbooking</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/sewing-knitting/Beb2RG">Sewing & Knitting</a></td>
                            </tr>            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/automotive/iid">Automotive</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/auto-accessories/iidQTU">Auto Accessories</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/car-auto-accessories/iidl5N">Automotive Tools</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/car-audio-electronics/iidfGQ">Car Audio & Electronics</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}ideas/baby">Baby</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/baby-gift-baskets/8RHfhI">Baby Gift Baskets</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/baby-keepsakes/8RH0Vp">Baby Keepsakes</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/baby-toys/8RH5ok">Baby Toys & Development</a>&nbsp;&rsaquo;                                           
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/baby-books/8RH5okU6D">Baby Books</a></div>                                        
                                            <div><a href="${public_href}categories/baby-bath-toys/8RH5okesR">Bath Toys</a></div>
                                            <div><a href="${public_href}categories/development-activity/8RH5ok3tP">Development & Activity</a></div>
                                            <div><a href="${public_href}categories/plush-toys/8RH5okSLu">Plush Toys</a></div>
                                            <div><a href="${public_href}categories/teething-crib-toys/8RH5okcIi">Teething & Crib Toys</a></div>                                                                
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/baby-wearables/8RHtti">Baby Wearables</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                                            
                                            <div><a href="${public_href}categories/baby-accessories/8RHttiDy4">Baby Accessories</a></div>
                                            <div><a href="${public_href}categories/baby-clothing/8RHttifDc">Baby Clothing</a></div>                                                    
                                        </div>
                                    </div>
                                </td>
                            </tr>            
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/baby-bathing-grooming-gift-ideas/8RHpvQ">Bathing & Grooming</a>&nbsp;&rsaquo;                                        
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/baby-bath-toys/8RHpvQesR">Bath Toys</a></div>
                                            <div><a href="${public_href}categories/bath-tubs-towels/8RHpvQ914">Bath Tubs & Towels</a></div>                                
                                            <div><a href="${public_href}categories/grooming/8RHpvQE5G">Grooming</a></div>                                                    
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">                            
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/diaper-cakes-diapering/8RHFMH">Diapering</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/diaper-potty-accessories/8RHFMHavs">Diaper & Potty Accessories</a></div>
                                            <div><a href="${public_href}categories/diaper-bags/8RHFMH8ty">Diaper Bags</a></div>                                                                                
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/baby-feeding-gifts/8RHdHI">Feeding</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                                          
                                            <div><a href="${public_href}categories/feeding-accessories/8RHdHI33e">Feeding Accessories</a></div>
                                            <div><a href="${public_href}categories/baby-food-prep-storage-gifts/8RHdHI4f6">Food Prep & Storage</a></div>
                                            <div><a href="${public_href}categories/highchairs-boosters/8RHdHIPcM">Highchair & Boosters</a></div>                                                               
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/health-safety/8RHLiQ">Health & Safety</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/baby-nursery-gifts/8RHqbC">Nursery</a>&nbsp;&rsaquo;                                           
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/bedding-blankets/8RHqbCg6R">Bedding & Blankets</a></div>                        
                                            <div><a href="${public_href}categories/nursery-d-cor/8RHqbC9A0">Nursery D&eacute;cor</a></div>
                                            <div><a href="${public_href}categories/cribs-bassinets/8RHqbC7xk">Nursery Furniture</a></div>
                                            <div><a href="${public_href}categories/teething-crib-toys/8RHqbCcIi">Teething & Crib Toys</a></div>                                                   
                                        </div>
                                    </div>            
                                </td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/travel-gear/8RHp0r">Travel Gear</a></td>
                            </tr>
                            <tr valign="top">            
                                <td class="catMain"><a href="${public_href}categories/beauty-spa-gifts/JXy">Beauty & Spa</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/cosmetic-fragrance-gift-ideas/JXyraV">Beauty & Fragrances</a>&nbsp;&rsaquo;                                         
                                        <div class="subTagCont">                                                                            
                                            <div><a href="${public_href}categories/bath-and-body-products/JXyraVz14">Bath and Body Products</a></div>
                                            <div><a href="${public_href}categories/cosmetics/JXyraVLQu">Cosmetics</a></div>
                                            <div><a href="${public_href}categories/fragrance-gift-ideas/JXyraVhsK">Fragrance</a></div>
                                            <div><a href="${public_href}categories/cosmetics-shaving-accessories/JXyraVNlL">Grooming Tools</a></div>
                                            <div><a href="${public_href}categories/skincare-products/JXyraVlm5">Skincare</a></div>                                                                
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/candles-home-fragrance-gifts/JXy7ah">Candles & Home Fragrance</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/home-spa-gifts/JXyKEl">Home Spa</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/spa-experiences/JXymcY">Spa Experiences</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/spa-gift-baskets/JXyKRJ">Spa Gift Baskets</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/books-magazines-gift-ideas/YU1">Books & Magazines</a></td>
                            </tr>
            
                            <tr valign="top">
                                <td><a href="${public_href}categories/baby-books/YU1U6D">Baby Books</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/children-books/YU1E3m">Children Books</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/fiction-books-popular-reading/YU1X52">Fiction</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/journals/YU1S9H">Journals</a></td>
                            </tr>
                            <tr valign="top">            
                                <td><a href="${public_href}categories/magazine-subscription-gifts-ideas/YU1yjY">Magazines</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/non-fiction-books/YU1Y61">Non-Fiction</a>&nbsp;&rsaquo;                                          
                                        <div class="subTagCont">                                                            
                                            <div><a href="${public_href}categories/biographies-memoirs/YU1Y61csV">Biographies & Memoirs</a></div>
                                            <div><a href="${public_href}categories/coffee-table-books/YU1Y61xl2">Coffee Table Books</a></div>
                                            <div><a href="${public_href}categories/cookbooks/YU1Y61lhI">Cookbooks</a></div>
                                            <div><a href="${public_href}categories/guidebooks/YU1Y61ZIS">Guides</a></div>                                                                
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/business-and-executive-gifts/Y1E">Business & Executive Gifts</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/care-packages/UHI">Care Package</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/charitable-gift-ideas/Jbh">Charitable</a></td>
                            </tr>
            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/clothing-apparel/c18">Clothing</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/clothing-apparel/c18xZy">Apparel</a>&nbsp;&rsaquo;                                         
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/shirts-blouses/c18xZyzc2">Button-Down Shirts/Blouses</a></div>
                                            <div><a href="${public_href}categories/dresses-skirts-suits/c18xZyZhb">Dresses, Skirts & Suits</a></div>                        
                                            <div><a href="${public_href}categories/jackets-blazers-vests/c18xZyLOA">Jackets, Blazers & Vests</a></div>
                                            <div><a href="${public_href}categories/pants-shorts/c18xZyaAt">Pants & Shorts</a></div>
                                            <div><a href="${public_href}categories/polos-other-tops/c18xZy5Fh">Polo's & Other Tops</a></div>
                                            <div><a href="${public_href}categories/sweaters/c18xZyJpi">Sweaters</a></div>
                                            <div><a href="${public_href}categories/t-shirts/c18xZyvPs">T-Shirts</a></div>                                                      
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/lingerie-sleepwear/c18QD7">Lingerie & Sleepwear</a>&nbsp;&rsaquo;                                             
                                        <div class="subTagCont">                                                                            
                                            <div><a href="${public_href}categories/lingerie-underwear/c18QD7lqP">Lingerie & Underwear</a></div>
                                            <div><a href="${public_href}categories/sexy-intimates/c18QD71ft">Sexy Intimates</a></div>
                                            <div><a href="${public_href}categories/sleepwear-robes/c18QD7lOX">Sleepwear & Robes</a></div>
                                            <div><a href="${public_href}categories/slippers/c18QD76rq">Slippers</a></div>                                                                                                                                
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/loungewear/c18HSN">Loungewear</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/outerwear/c18s1l">Outerwear</a></td>
                            </tr>                            
                        </table>
                    </td>
                    <td>
                        <table border="0" width="98%" cellpadding="0" cellspacing="0">
                            <tr valign="top">                            
                                <td class="catMain"><a href="${public_href}categories/collectibles-memorabilia/6iC">Collectibles & Memorabilia</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/collectibles/6iCS3z">Collectibles</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/figurines-keepsakes/6iCS3zfyc">Figurines & Keepsakes</a></div>                                
                                            <div><a href="${public_href}categories/picture-frames-photo-albums/6iCS3zpyg">Frames & Albums</a></div>
                                            <div><a href="${public_href}categories/trinket-boxes/6iCS3zSZW">Trinket Boxes</a></div>                                                                                                 
                                        </div>
                                    </div>
                                </td>            
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/memorabilia/6iCsPD">Memorabilia</a>&nbsp;&rsaquo;                                             
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/entertainment-memorabilia/6iCsPDJXe">Entertainment Memorabilia</a></div>
                                            <div><a href="${public_href}categories/sports-memorabilia/6iCsPDpUz">Sports Memorabilia</a></div>                                                                                                   
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/computers-electronics/KIF">Computers & Electronics</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/alarm-clocks-radios/KIFyOg">Alarm Clocks & Radios</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/cameras-photography-gift-ideas/KIFgLA">Cameras & Photography</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/car-audio-electronics/KIFfGQ">Car Audio & Electronics</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/computers/KIFX5c">Computers</a>&nbsp;&rsaquo;                                             
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/briefcases-laptop-bags/KIFX5cg6X">Briefcases & Laptop Bags</a></div>        
                                            <div><a href="${public_href}categories/computer-accessories/KIFX5cT2j">Computer Accessories</a></div>
                                            <div><a href="${public_href}categories/desktops-laptops/KIFX5cvcC">Desktops & Laptops</a></div>
                                            <div><a href="${public_href}categories/computer-software/KIFX5caDq">Software</a></div>                                                    
                                        </div>
                                    </div>            
                                </td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/gadget-accessories-cases/KIFcfq">Gadget Cases</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/gadget-gifts/KIFZuD">Gadgets</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/home-audio-gifts/KIFUNa">Home Audio</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/tv-video-gifts/KIFR3U">Home TV & Video</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td><a href="${public_href}categories/office-electronics/KIFwip">Office Electronics</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/binoculars-telescopes/KIFQU5">Optics</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/personal-electronics/KIF3zZ">Personal Electronics</a>&nbsp;&rsaquo;                                          
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/e-readers/KIF3zZwVk">E-Readers</a></div>                                            
                                            <div><a href="${public_href}categories/headphones-speakers/KIF3zZUwS">Headphones & Speakers</a></div>
                                            <div><a href="${public_href}categories/personal-tv-video-gifts/KIF3zZvgM">Personal TV & Video</a></div>
                                            <div><a href="${public_href}categories/ipods-mp3-accessories/KIF3zZjat">iPods & Mp3 Accessories</a></div>
                                            <div><a href="${public_href}categories/ipod-mp3-players/KIF3zZgaL">iPods & Mp3 Players</a></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/phones/KIFxDr">Phones & Communication</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                            
                                            <div><a href="${public_href}categories/landline-phones/KIFxDrJkX">Landline Phones</a></div>
                                            <div><a href="${public_href}categories/mobile-phones/KIFxDraQt">Mobile Phones</a></div>                                                    
                                        </div>
                                    </div>
                                </td>            
                            </tr>
                            <tr valign="top">
                                
                                <td class="catMain"><a href="${public_href}categories/eco-friendly-gifts/Ads">Eco-Friendly</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}ideas/experiential">Experiential</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/arts-culture-experiences/ab5T4o">Arts & Culture</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/cooking-gourmet-food-experiences/ab5nGj">Cooking & Gourmet</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td><a href="${public_href}categories/self-improvement-experiences/ab5F94">Self Improvement</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/spa-experiences/ab5mcY">Spa Experiences</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/sports-related-experiences/ab5aMC">Sports</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/travel-adventure-experiences/ab5jT3">Travel & Adventure</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/flowers-plants/BzI">Flowers & Plants</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/artificial-flowers-plants/BzI3Uh">Artificial Flowers & Plants</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/flowers/BzIZUM">Flowers</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/plants/BzIAVG">Plants</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/wreaths/BzIhQp">Wreaths</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td class="catMain"><a href="${public_href}categories/gourmet-foods-beverages/LHd">Food & Beverages</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/beverage-gift-ideas/LHdvjd">Beverages</a>&nbsp;&rsaquo;                                           
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/coffee-tea-gift-baskets/LHdvjdHRy">Coffee/Tea Gift Baskets</a></div>                                            
                                            <div><a href="${public_href}categories/coffee-tea-gift-ideas/LHdvjdGqH">Coffee/Tea/Cocoa</a></div>
                                            <div><a href="${public_href}categories/other-beverage-drinking-gifts/LHdvjdcRz">Other Beverages</a></div>
                                            <div><a href="${public_href}categories/spirits-beers/LHdvjd6J3">Spirits & Beers</a></div>
                                            <div><a href="${public_href}categories/wine-champagne-gift-ideas/LHdvjdZqr">Wine & Champagne</a></div>
                                            <div><a href="${public_href}categories/wine-gift-baskets/LHdvjdnHp">Wine Gift Baskets</a></div>                                                                
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/gourmet-foods/LHdlHq">Food</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                                            
                                            <div><a href="${public_href}categories/chocolates-candy-gift-ideas/LHdlHqlJ8">Chocolates & Other Candy</a></div>
                                            <div><a href="${public_href}categories/cookies-baked-goods/LHdlHqTuy">Cookies & Baked Goods</a></div>
                                            <div><a href="${public_href}categories/food-gift-baskets/LHdlHqugk">Food Gift Baskets</a></div>
                                            <div><a href="${public_href}categories/fresh-meats-fish/LHdlHqUvS">Fresh Meats & Fish</a></div>                                            
                                            <div><a href="${public_href}categories/healthy-fruit-and-veggie-gift-ideas/LHdlHqmpa">Fruits & Veggies</a></div>
                                            <div><a href="${public_href}categories/prepared-foods/LHdlHqdIq">Prepared Foods</a></div>
                                            <div><a href="${public_href}categories/gourmet-seasonings-sauces/LHdlHqThu">Seasoning, Sauces, Etc.</a></div>
                                            <div><a href="${public_href}categories/snack-foods/LHdlHqZq3">Snacks</a></div>                                                                
                                        </div>
                                    </div>
                                </td>
                            </tr>
            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/luggage-travel-gifts/nsA">For Travel</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/airplane-friendly-gift-ideas/nsAfxm">Airplane Friendly</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/beach-picnic-baskets/nsAaHj">Beach & Picnic</a></td>
                            </tr>            
                            <tr valign="top">
                                <td><a href="${public_href}categories/luggage/nsAUkO">Luggage</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/travel-accessories/nsAUI2">Travel Accessories</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/lawn-garden-gifts/e93">For the Garden & Yard</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/backyard-patio-gift-ideas/e93PpI">Backyard & Patio</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                            
                                            <div><a href="${public_href}categories/patio-accessories/e93PpIlOU">Patio & Deck Accessories</a></div>
                                            <div><a href="${public_href}categories/poolside-accessories/e93PpIyKX">Poolside Accessories</a></div>                                                    
                                        </div>
                                    </div>            
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/gardening-gift-ideas/e93M6W">Garden & Yard</a>&nbsp;&rsaquo;                                           
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/garden-yard-d-cor/e93M6W4oe">Garden & Yard D&eacute;cor</a></div>                                            
                                            <div><a href="${public_href}categories/lawn-garden-tools/e93M6WZzZ">Garden & Yard Tools</a></div>                                                    
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">                            
                                <td class="catMain"><a href="${public_href}categories/gifts-for-the-home/MN4">For the Home</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/home-bar-gifts/MN4iDy">Bar</a>&nbsp;&rsaquo;                                             
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/home-bar-d-cor/MN4iDy00k">Bar D&eacute;cor</a></div>                                            
                                            <div><a href="${public_href}categories/home-bar-accessories/MN4iDyrZT">Barware & Tools</a></div>
                                            <div><a href="${public_href}categories/drinking-games/MN4iDypGn">Drinking Games</a></div>                                                    
                                        </div>
                                    </div>
                                </td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/home-appliances/MN4lkZ">Home Appliances</a></td>
                            </tr>
                            <tr valign="top">
                                <td>            
                                    <div class="subSel">
                                        <a href="${public_href}categories/home-furnishings/MN4a3r">Home Furnishings</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/artwork-posters/MN4a3rraC">Artwork & Posters</a></div>
                                            <div><a href="${public_href}categories/bedding-bath-gifts/MN4a3rSWR">Bedding & Bath</a></div>
                                            <div><a href="${public_href}categories/candles-home-fragrance-gifts/MN4a3r7ah">Candles & Home Fragrance</a></div>                                            
                                            <div><a href="${public_href}categories/collectibles/MN4a3rS3z">Collectibles</a></div>
                                            <div><a href="${public_href}categories/furniture/MN4a3rJLu">Furniture</a></div>
                                            <div><a href="${public_href}categories/home-d-cor/MN4a3rNlW">Home D&eacute;cor Accents</a></div>
                                            <div><a href="${public_href}categories/lighting-gifts/MN4a3rmXq">Lighting</a></div>                                                                                                   
                                        </div>            
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/home-organizers/MN4Uyh">Home Organizers</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/home-spa-gifts/MN4KEl">Home Spa</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/cooking-kitchen-gift-ideas/MN4eHu">Kitchen</a>&nbsp;&rsaquo;                                         
                                        <div class="subTagCont">                                                                            
                                            <div><a href="${public_href}categories/cookbooks/MN4eHulhI">Cookbooks</a></div>
                                            <div><a href="${public_href}categories/cookware-bakeware/MN4eHuMpz">Cookware & Bakeware</a></div>
                                            <div><a href="${public_href}categories/knives-cutlery-kitchen-tools/MN4eHuAU2">Gadgets, Knives & Tools</a></div>
                                            <div><a href="${public_href}categories/grilling-tools-bbq-accessories/MN4eHuEBt">Grilling Tools</a></div>
                                            <div><a href="${public_href}categories/small-kitchen-appliances/MN4eHuRlz">Kitchen Appliances</a></div>                                            
                                            <div><a href="${public_href}categories/kitchen-d-cor/MN4eHu7gn">Kitchen D&eacute;cor</a></div>                                                    
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">            
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/tableware/MN4Mxh">Tableware</a>&nbsp;&rsaquo;                                             
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/dishes/MN4Mxhv80">Dishware & Utensils</a></div>
                                            <div><a href="${public_href}categories/glassware/MN4MxhrGB">Drinkware</a></div>
                                            <div><a href="${public_href}categories/tableware/MN4MxhtfV">Serveware</a></div>                                            
                                            <div><a href="${public_href}categories/table-linens-d-cor/MN4MxhDye">Table Linens & D&eacute;cor</a></div>                                                    
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">                            
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/tools-hardware/MN4I0D">Tools & Hardware</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/lawn-garden-tools/MN4I0DZzZ">Garden & Yard Tools</a></div>
                                            <div><a href="${public_href}categories/tools-hardware/MN4I0DiXI">Home Tools</a></div>                                                                                
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/office-stationery-gifts/QU6">For the Office</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td><a href="${public_href}categories/calendars/QU6hMP">Calendars</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/desk-office-accessories/QU6qeQ">Desk & Office Accessories</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/journals/QU6S9H">Journals</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/office-electronics/QU6wip">Office Electronics</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/stationery-gifts/QU6zdb">Stationery & Paper Goods</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/distinguished-writing-instruments/QU6sp1">Writing Instruments</a></td>
                            </tr>                                                        
                        </table>
                    </td>
                    <td>
                        <table border="0" width="98%" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/gag-gifts/qkA">Gag Gifts</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td class="catMain"><a href="${public_href}categories/gift-baskets/Jcb">Gift Baskets</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/baby-gift-baskets/JcbfhI">Baby Gift Baskets</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/coffee-tea-gift-baskets/JcbHRy">Coffee/Tea Gift Baskets</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/food-gift-baskets/Jcbugk">Food Gift Baskets</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/unique-gift-baskets/JcbdZs">Other Gift Baskets</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/spa-gift-baskets/JcbKRJ">Spa Gift Baskets</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/wine-gift-baskets/JcbnHp">Wine Gift Baskets</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/gift-cards-memberships/wUW">Gift Cards & Memberships</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/clubs-subscriptions/wUWwjT">Clubs & Subscriptions</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/emailable-gift-certificates/wUWdlA">Emailable Gift Certificates</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/gift-cards/wUWjBB">Gift Cards</a>&nbsp;&rsaquo;                                           
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/charity-cash-donation-gift-cards/wUWjBBtwv">Charity & Cash Gift Cards</a></div>
                                            <div><a href="${public_href}categories/experiential-gift-cards/wUWjBBbKF">Experiential Gift Cards</a></div>
                                            <div><a href="${public_href}categories/retail-gift-cards/wUWjBBQXV">Retail Gift Cards</a></div>                                                                                                    
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/golf-gifts/80u">Golf</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/golf-clothes-accessories/80u8IW">Golf Clothes & Accessories</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/golf-equipment-gear/80uhOg">Golf Equipment & Gear</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/golf-lover-gift-ideas/80uXK4">Golf Themed</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/healthy-nutritious-gift-ideas/Kbl">Health & Nutrition</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/home-aid-gift-ideas/H4I">Home Aid Gifts</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/jewelry-watches/TiW">Jewelry & Watches</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/jewelry/TiWyFG">Jewelry</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                                            
                                            <div><a href="${public_href}categories/bracelets/TiWyFG9DZ">Bracelets</a></div>
                                            <div><a href="${public_href}categories/charms/TiWyFGJDC">Charms & Enhancers</a></div>
                                            <div><a href="${public_href}categories/cufflinks/TiWyFGT1j">Cufflinks</a></div>
                                            <div><a href="${public_href}categories/earrings/TiWyFGglv">Earrings</a></div>
                                            <div><a href="${public_href}categories/necklaces/TiWyFGMvB">Necklaces</a></div>                                            
                                            <div><a href="${public_href}categories/pins-brooches/TiWyFGxDN">Pins & Brooches</a></div>
                                            <div><a href="${public_href}categories/rings/TiWyFGf4L">Rings</a></div>                                                    
                                        </div>
                                    </div>
                                </td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/jewelry-boxes/TiWtia">Jewelry Boxes & Valets</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/watches/TiWWCh">Watches</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}ideas/children">Kids</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/childrens-accessories/W8c">Kid's Accessories</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td><a href="${public_href}categories/childrens-clothing/Ku9">Kid's Clothing</a></td>
                            </tr>
                            
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/maternity-gifts/qjB">Maternity</a></td>
                            </tr>
                           
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/movies-music/shh">Music, Movies & TV</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/cds-popular-music/shhWLP">CD's & Other Music</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/entertainment-memorabilia/shhJXe">Entertainment Memorabilia</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/movies-dvds-videos/shhcUa">Movie DVD's & Videos</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/popular-tv-shows-on-dvd/shhTYH">TV DVD's & Videos</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/musical-instruments/pMR">Musical Instruments</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/nostalgic-retro/PCV">Nostalgic/Retro</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/party-favors/6kf">Party Favors</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/patriotic-gifts/mSz">Patriotic Gifts</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/personalized-gifts/1vV">Personalized Gifts</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}ideas/pets_beta">Pets</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td><a href="${public_href}categories/pet-accessories/2A1">Pet Accessories</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/pet-toys-treats/QvK">Pet Toys & Treats</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/pet-wearables/lD2">Pet Wearables</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/picture-frames-photo-related-gifts/Csa">Photo Related Gifts</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/cameras-photography-gift-ideas/CsagLA">Cameras & Photography</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/custom-photo-gifts/CsahYc">Custom Photo Gifts</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/picture-frames-photo-albums/Csapyg">Frames & Albums</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/political-gifts/atN">Political</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/religious-gifts/mf1">Religious Gifts</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/christian-gifts/mf18AD">Christian</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/jewish-gift-ideas/mf1LCe">Jewish</a></td>
                            </tr>                            
                        </table>
                    </td>
                    <td>
                        <table border="0" width="98%" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/romantic-gifts/fIk">Romantic</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/romantic-games/fIkNmP">Romantic Games</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/sentimental-gifts/fIkCh1">Sentimental</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/sexy-intimates/fIk1ft">Sexy Intimates</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/room-d-cor/I1i">Room D&#233;cor</a></td>
                            </tr>
                            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/school-dorm-gift-ideas/hHH">School & Dorm</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/backpacks-messenger-bags/hHHqIH">Backpacks & Bookbags</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/dorm-room-essentials/hHHJ3f">Dorm Room Essentials</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/school-supplies/hHHFHf">School Supplies</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}christmas/seasonal-d-cor/pe6W1w">Seasonal Gifts</a></td>
                            </tr>
                        
                            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/sporting-goods-apparel/KPd">Sporting Goods & Apparel</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/backyard-activity-gift-ideas/KPdLHY">Backyard Activities</a></td>
                            </tr>
                            <tr valign="top">
                                <td>                            
                                    <div class="subSel">
                                        <a href="${public_href}categories/camping-hiking-outdoor-gift-ideas/KPdLtW">Camping & Outdoors</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/camping-clothing/KPdLtWAl7">Camping Clothing</a></div>
                                            <div><a href="${public_href}categories/camping-gear/KPdLtWDS6">Camping Gear</a></div>                             
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/exercise-fitness-gift-ideas/KPdvZx">Exercise & Fitness</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                                            
                                            <div><a href="${public_href}categories/exercise-equipment/KPdvZxmsX">Exercise Equipment</a></div>
                                            <div><a href="${public_href}categories/fitness-clothing/KPdvZxrJ9">Fitness Clothing</a></div>                                                    
                                        </div>
                                    </div>
                                </td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/extreme-sports-gifts/KPdxg7">Extreme Sports</a></td>
                            </tr>
                            <tr valign="top">
                                <td>                            
                                    <div class="subSel">
                                        <a href="${public_href}categories/golf-gifts/KPdD26">Golf</a>&nbsp;&rsaquo;                                            
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/golf-clothes-accessories/KPdD268IW">Golf Clothes & Accessories</a></div>
                                            <div><a href="${public_href}categories/golf-equipment-gear/KPdD26hOg">Golf Equipment & Gear</a></div>                                                                                                                          
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/rec-room-activity-gift-ideas/KPdCDG">Rec Room Activities</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/team-racquet-sports-gift-ideas/KPdIti">Team & Racquet Sports</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/water-sports-gift-ideas/KPdxOt">Water Sports</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/winter-sports-clothing-apparel/KPdwag">Winter Sports</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/yoga-pilates-gift-ideas/KPdF23">Yoga & Pilates</a></td>
                            </tr>                            
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/sports-fan-gear/F3r">Sports Fan Gear</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/mlb-gift-ideas/F3rtgb">MLB</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/nascar-gift-ideas/F3ry8D">NASCAR</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/nba-gift-ideas/F3rcKy">NBA</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/ncaa-gift-ideas/F3r9xy">NCAA</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/nfl-gift-ideas/F3r859">NFL</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/nhl-gift-ideas/F3rr2L">NHL</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/soccer-gift-ideas/F3rZIA">Soccer</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/sports-memorabilia/F3rpUz">Sports Memorabilia</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/wwe-gift-ideas/F3rzF9">WWE</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/toys-games/RKq">Toys & Games</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/action-figures/RKq17B">Action Figures</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/art-supplies/RKqdFa">Art Supplies</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/baby-toys/RKq5ok">Baby Toys & Development</a>&nbsp;&rsaquo;                                          
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/baby-books/RKq5okU6D">Baby Books</a></div>                                            
                                            <div><a href="${public_href}categories/baby-bath-toys/RKq5okesR">Bath Toys</a></div>
                                            <div><a href="${public_href}categories/development-activity/RKq5ok3tP">Development & Activity</a></div>
                                            <div><a href="${public_href}categories/plush-toys/RKq5okSLu">Plush Toys</a></div>
                                            <div><a href="${public_href}categories/teething-crib-toys/RKq5okcIi">Teething & Crib Toys</a></div>                            
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/backyard-activity-gift-ideas/RKqLHY">Backyard Activities</a></td>                            
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/bicycles-and-scooters/RKq5R6">Bicycles and Scooters</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/board-games-cards/RKqVsI">Board Games & Cards</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/building-blocks-educational-toys/RKqTMq">Building Toys and Blocks</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/collectible-toys/RKqd3y">Collectible Toys</a></td>
                            </tr>
                            <tr valign="top">                       
                                <td><a href="${public_href}categories/costumes/RKq62O">Costumes</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/arts-crafts-gift-ideas/RKqD3A">Crafty Kits</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/dolls/RKqNA9">Dolls</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/electronic-toys/RKq47w">Electronic Toys</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/learning-and-educational-gift-ideas/RKqA6O">Learning and Education</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/musical-toys/RKq6zu">Musical Toys</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/stuffed-animal-toys/RKqUXZ">Plush and Stuffed Toys</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/make-believe-toys-games/RKqwTg">Pretend Play</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/puzzles/RKq9JE">Puzzles</a></td>
                            </tr>
                            <tr valign="top">                            
                                <td><a href="${public_href}categories/rec-room-activity-gift-ideas/RKqCDG">Rec Room Activities</a></td>
                            </tr>
                            <tr valign="top">
                                <td><a href="${public_href}categories/toy-models-ride-ons/RKquK5">Toy Models & Ride-On's</a></td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div class="subSel">
                                        <a href="${public_href}categories/video-games/RKqZjL">Video Games & Consoles</a>&nbsp;&rsaquo;                                           
                                        <div class="subTagCont">                                                
                                            <div><a href="${public_href}categories/plug-play-toys-electronics/RKqZjLOKr">Plug & Play</a></div>                        
                                            <div><a href="${public_href}categories/video-game-accessories/RKqZjLHuI">Video Game Accessories</a></div>
                                            <div><a href="${public_href}categories/video-game-consoles/RKqZjLtQz">Video Game Consoles</a></div>
                                            <div><a href="${public_href}categories/video-games/RKqZjLKXl">Video Games</a></div>                                                    
                                        </div>
                                    </div>                            
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="catMain"><a href="${public_href}categories/unique-gifts/Yw1">Unique Gifts</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>              
            --%>
        </section>
   </div>

    <%-- SEO Content: Product & Content --%>
    <c:if test="${not empty templateCat.modules['4']}">
        <div class="lpSection parentCont">    
            <section id="moreGiftIdeas" class="scrollCont">
                <div class="scrollContInner">
                    <div class="hdr">
                        <h2>${templateCat.modules['4'].title}</h2>
                    </div>
                    <div class="orgCont">
                        <c:forEach items="${templateCat.modules['4'].elements}" var="element" varStatus="status">
                            <c:set var="image" value="${g:getImage(element.imageGroup, 250)}"/>
                            <div class="orgMod">    
                                <div class="orgLeft">

                                    <a href="${g:makeAbsoluteUrl(public_href, element.link)}">

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
                            <c:if test="${not status.last and status.count % 2 eq 0}">
                                <div class="clear" style="margin-bottom:20px;"></div>
                            </c:if>                          
                        </c:forEach>
                        <div class="clear"></div>
                        <c:if test="${not empty templateCat.modules['5']}">
                            <div class="hor"></div>
                            <div align="center" class="extraLinks">
                                <c:forEach items="${templateCat.modules['5'].elements}" var="element" varStatus="status">

                                    <a href="${g:makeAbsoluteUrl(public_href, element.link)}">${element.title}</a><c:if test="${not status.last}">&nbsp;&nbsp;|&nbsp;&nbsp;</c:if>

                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </div>
            </section>    
        </div>  
    </c:if>
      
</div>


<c:import url='/WEB-INF/jsp/public/include/${partnerName}footer.jsp'/>