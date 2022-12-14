<%@ page import="Review.ReviewDAO" %>
<%@ page import="ProductQ.ProductQDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Product.ProductDAO"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
    String ProductNumber = (String)session.getAttribute("ProductNumber");

    ReviewDAO reviewDAO = new ReviewDAO();
    ProductQDAO productQDAO = new ProductQDAO();
    ResultSet rs = reviewDAO.ProductReview(ProductNumber);
    ResultSet rs1 = productQDAO.ProductProductQ(ProductNumber);

%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://l.bsks.ac.kr/~p201887082/DiliManage/css/bootstrap.css"/>
<script>
</script>
<html>
<head>
    <title>Title</title>
    <style>
        .checked{
            color:orange;
        }
    </style>
</head>
<body>
    <div class = "ProductInfo_info">
        <p class = "imagePosition">
            <img src = "../image/Background/<%=ProductNumber%>.jpg"/>
        </p>

    </div>
    <div class = "ProductInfo_arrive">
        <div class="delivery_cont">
            <h3>배송안내</h3>
            <div class="admin_msg"><p>- 배송비&nbsp;:&nbsp;기본배송료는&nbsp;2,500원&nbsp;입니다.&nbsp;(도서,산간,오지&nbsp;일부지역은&nbsp;배송비가&nbsp;추가될&nbsp;수&nbsp;있습니다)&nbsp;&nbsp;50,000원&nbsp;이상&nbsp;구매시&nbsp;무료배송입니다.</p><p>- 본&nbsp;상품의&nbsp;평균&nbsp;배송일은&nbsp;0일입니다.(입금&nbsp;확인&nbsp;후)&nbsp;설치&nbsp;상품의&nbsp;경우&nbsp;다소&nbsp;늦어질수&nbsp;있습니다.[배송예정일은&nbsp;주문시점(주문순서)에&nbsp;따른&nbsp;유동성이&nbsp;발생하므로&nbsp;평균&nbsp;배송일과는&nbsp;차이가&nbsp;발생할&nbsp;수&nbsp;있습니다.]</p><p>- 본&nbsp;상품의&nbsp;배송&nbsp;가능일은&nbsp;0일&nbsp;입니다.&nbsp;배송&nbsp;가능일이란&nbsp;본&nbsp;상품을&nbsp;주문&nbsp;하신&nbsp;고객님들께&nbsp;상품&nbsp;배송이&nbsp;가능한&nbsp;기간을&nbsp;의미합니다.&nbsp;(단,&nbsp;연휴&nbsp;및&nbsp;공휴일은&nbsp;기간&nbsp;계산시&nbsp;제외하며&nbsp;현금&nbsp;주문일&nbsp;경우&nbsp;입금일&nbsp;기준&nbsp;입니다.)</p></div>
        </div>
    </div>

    <div class = "ProductInfo_change">
        <div class="exchange_cont">
            <h3>교환 및 반품안내</h3>
            <div class="admin_msg">
                <p>- 상품&nbsp;택(tag)제거&nbsp;또는&nbsp;개봉으로&nbsp;상품&nbsp;가치&nbsp;훼손&nbsp;시에는&nbsp;상품수령후&nbsp;7일&nbsp;이내라도&nbsp;교환&nbsp;및&nbsp;반품이&nbsp;불가능합니다.</p><p>- 저단가&nbsp;상품,&nbsp;일부&nbsp;특가&nbsp;상품은&nbsp;고객&nbsp;변심에&nbsp;의한&nbsp;교환,&nbsp;반품은&nbsp;고객께서&nbsp;배송비를&nbsp;부담하셔야&nbsp;합니다(제품의&nbsp;하자,배송오류는&nbsp;제외)</p><p>- 일부&nbsp;상품은&nbsp;신모델&nbsp;출시,&nbsp;부품가격&nbsp;변동&nbsp;등&nbsp;제조사&nbsp;사정으로&nbsp;가격이&nbsp;변동될&nbsp;수&nbsp;있습니다.</p><p>- 신발의&nbsp;경우,&nbsp;실외에서&nbsp;착화하였거나&nbsp;사용흔적이&nbsp;있는&nbsp;경우에는&nbsp;교환/반품&nbsp;기간내라도&nbsp;교환&nbsp;및&nbsp;반품이&nbsp;불가능&nbsp;합니다.</p><p>- 수제화&nbsp;중&nbsp;개별&nbsp;주문제작상품(굽높이,발볼,사이즈&nbsp;변경)의&nbsp;경우에는&nbsp;제작완료,&nbsp;인수&nbsp;후에는&nbsp;교환/반품기간내라도&nbsp;교환&nbsp;및&nbsp;반품이&nbsp;불가능&nbsp;합니다.&nbsp;</p><p>- 수입,명품&nbsp;제품의&nbsp;경우,&nbsp;제품&nbsp;및&nbsp;본&nbsp;상품의&nbsp;박스&nbsp;훼손,&nbsp;분실&nbsp;등으로&nbsp;인한&nbsp;상품&nbsp;가치&nbsp;훼손&nbsp;시&nbsp;교환&nbsp;및&nbsp;반품이&nbsp;불가능&nbsp;하오니,&nbsp;양해&nbsp;바랍니다.</p><p>- 일부&nbsp;특가&nbsp;상품의&nbsp;경우,&nbsp;인수&nbsp;후에는&nbsp;제품&nbsp;하자나&nbsp;오배송의&nbsp;경우를&nbsp;제외한&nbsp;고객님의&nbsp;단순변심에&nbsp;의한&nbsp;교환,&nbsp;반품이&nbsp;불가능할&nbsp;수&nbsp;있사오니,&nbsp;각&nbsp;상품의&nbsp;상품상세정보를&nbsp;꼭&nbsp;참조하십시오.&nbsp;</p>
            </div>
            <h3>환불안내</h3>
            <div class="admin_msg">
                - 상품 청약철회 가능기간은 상품 수령일로 부터 7일 이내 입니다.
            </div>
            <h3>AS안내</h3>
            <div class="admin_msg">
                <p>- 소비자분쟁해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.</p><p>- A/S는 판매자에게 문의하시기 바랍니다.</p>
            </div>
        </div>
    </div>

    <div class = "ProductInfo_review">
        <div class = "ProductInfo_review_button">
            <input type = "button" class = "viewAllReview" onclick = "location.href='../Review/ReviewList.jsp'" value="상품후기 전체보기">
            <input type = "button" class = "WriteReview" onclick="window.open('../Review',width=700, height=400,menubar='no', status='no', toolbar='no')" value="상품후기 글쓰기">
        </div>
        <div class = "ProductInfo_review_list">
            <h4>상품후기</h4>
            <table class="table">
                <thead>

                </thead>
                <tbody>
                <%

                    if(!rs.isBeforeFirst()) {
                        %>
                            <tr>
                                <td colspan='4' style="text-align: center">등록된 상품후기가 없습니다.</td>
                            </tr>
                        <%
                    }else{
                        %>
                            <tr >
                                <th>평점</th>
                                <th>제목</th>
                                <th>이름</th>
                                <th>등록일자</th>
                            </tr>
                    <%
                    }
                    while(rs.next()){
                    %>
                        <tr class = "ProductInfo_review_tr" data-id="<%=rs.getString("reviewId")%>">
                        <td>
                            <%
                                for(int i = 0; i <5;i++){
                                        if(i <= rs.getInt("ProductGrade")-1){
                                            %>
                                                <span class="fa fa-star checked"></span>
                                            <%
                                            }else{
                                                %>
                                                  <span class="fa fa-star"></span>
                                                <%
                                            }
                                }
                            %>
                        </td>
                        <td><%=rs.getString("reviewtitle")%></td>
                        <td><%=rs.getString("username")%></td>
                        <td><%=rs.getString("createAt")%></td>
                        </tr>
                    <%
                    }
                %>

                </tbody>
            </table>
        </div>
        <script src = "../js/ProductInfo.js"></script>
    </div>

    <div class = "ProductInfo_QnA">
        <div class = "ProductInfo_review_button">
            <input type = "button" class = "viewAllReview" value="상품문의 전체보기">
            <input type = "button" class = "WriteReview"  value="상품문의 글쓰기">
        </div>
        <div class = "ProductInfo_review_list">
            <h5>상품문의</h5>
            <table class="table">
                <thead>
                    <%
                   if(!rs.isBeforeFirst())
                   {
                     %>
                    <tr>
                        <td colspan='4' style="text-align: center">등록된 문의가 없습니다.</td>
                    </tr>
                    <%
                    }
                    while(rs.next()){
                    %>
                <tr>
                    <!--<td><%=rs.getString("productgrade")%></td>
                    <td><%=rs.getString("reviewtitle")%></td>
                    <td><%=rs.getString("username")%></td>
                    <td><%=rs.getString("createAt")%></td>-->
                </tr>
                    <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <script src = "../js/ProductInfo.js"></script>
        <script src ="http://l.bsks.ac.kr/~p201887082/DiliManage/js/bootstrap.js"></script>

    </div>
</body>
</html>
