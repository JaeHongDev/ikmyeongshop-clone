<%@ page import="Product.ProductDAO"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="product" class="Product.Product" scope="page" />
<html>
<head>
    <link rel = "stylesheet" href = "../css/ProductView.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel = "stylesheet" href = "http://l.bsks.ac.kr/~p201887082/DiliManage/css/bootstrap.css"/>
    <style>
        .checked{
            color:orange;
        }
    </style>
    <%
        String ProductNumber = request.getParameter("ProductNumber");
        ProductDAO productDAO = new ProductDAO();
        session.setAttribute("ProductNumber",ProductNumber);
        String ProductName = "";
        String ProductClass = "";
        String ProductCount = "";
        String ProductDiscount = "";
        String ProductPrice = "";
        String price = "";


        ArrayList<String> list = (ArrayList)session.getAttribute("UserViewProductList");
        if(list==null)
        {
            list = new ArrayList<String>();
            list.add(ProductNumber);
            session.setAttribute("UserViewProductList", list);
        }
        else{
            int i;
            int check = 0;
            for(i = 0; i < list.size();i++){
                if(list.get(i).equals(ProductNumber)){
                    check = 1;
                }
            }
            if(check == 0){
                list.add(ProductNumber);
                productDAO.ProductViewCount(ProductNumber);
                session.setAttribute("UserViewProductList", list);
            }
        }

        ResultSet rs = productDAO.SelectProduct(ProductNumber);
        if(rs.next()){
             ProductName = rs.getString("ProductName");
             ProductClass = rs.getString("ProductClass");
             ProductCount = rs.getString("ProductCount");
             ProductDiscount = rs.getString("ProductDiscount");
             ProductPrice = rs.getString("ProductPrice");
             price = rs.getString("ProductPrice");
        }

    %>
    <title>Title</title>
    <script>
        let price = "<%=price%>";
        let productNumber = "<%=ProductNumber%>";

    </script>
</head>
<body>
    <header>
        <jsp:include page="../header.jsp"/>
    </header>

    <div class = "product_view_container">
        <div class = "product_view_container_top">
            <div class = "product_view_location">
                <em class = "product_view_href">
                    <a href = "#" class = "local_home">HOME</a>
                </em>
            </div>

            <div class = "product_view_wrap">
                <div class = "product_view_img">
                    <img src ="../image/Thumbnail/<%=ProductNumber%>.jpg"/>
                </div>
                <div class = "product_view_option">
                    <h3><%=ProductName%></h3>
                    <div class = "product_view_options">
                        <div class = "product_view_option_line">
                            <div class = "first_info">?????????</div>
                            <div class = "second_info">
                                <strong>
                                    <%=price%>???
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">????????????</div>
                            <div class = "second_info">
                                <strong>
                                    ?????? 1???
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">????????????</div>
                            <div class = "second_info">
                                <strong>
                                    ?????? ????????????:+125???
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">?????????</div>
                            <div class = "second_info">
                                <strong>
                                    2500??? / ???????????????
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">????????????</div>
                            <div class = "second_info">
                                <strong>
                                    <%=ProductNumber%>
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_option_line">
                            <div class = "first_info">????????????</div>
                            <div class = "second_info">
                                <strong>
                                    <%=ProductCount%>
                                </strong>
                            </div>
                        </div>

                        <div class = "product_view_price_line">
                            <div class = "product_view_price_name">
                                <strong>
                                    <%=ProductName%>
                                </strong>
                            </div>

                            <div class = "product_view_price_updw">
                                <div class = "">
                                    <input value = "1" id = "product_view_price_count" class = "product_view_price_count" type = "text" >
                                    <Button class = "product_view_price_btn">???</Button>
                                    <Button class = "product_view_price_btn">???</Button>
                                </div>
                            </div>
                            <div class = "product_view_price">
                                <div class = "">
                                    <strong id = "product_price"><%=price%></strong>
                                </div>
                            </div>
                        </div>
                        <div class = "full_price_wrap">
                            <div class = "full_price">
                                <strong>??? ????????????</strong>
                                <strong id = "product_full_price" class ="full_price_left"><%=price%></strong>
                            </div>
                        </div>
                        <div class = "sum_price_wrap">
                            <div class = "sum_price">
                                <strong>??? ????????????:</strong>&nbsp&nbsp&nbsp
                                <strong id = "product_sum_price"class ="full_price_left"><%=price%></strong>
                            </div>
                        </div>
                        <div class = "Product_purchase_wrap">
                            <div class = "Product_purchase_bucket">
                                <Button id = "MoveShoppingBag">????????????</Button>
                            </div>
                            <div class = "Product_purchase_on">
                                <Button id = "MovePurchase">????????????</Button>
                            </div>
                            <div class = "Product_purchase_attention">
                                <Button id = "MoveAttention">????????????</Button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class = "product_view_container_bottom">

            <div class = "product_view_bottom_view">

                <div class = "product_view_list">
                    <span class = "product_view_list_item"><a href = "#info">??????????????????</a></span>
                    <span class = "product_view_list_item"><a href = "#arrive">????????????</a></span>
                    <span class = "product_view_list_item"><a href = "#change">?????? ??? ????????????</a></span>
                    <span class = "product_view_list_item"><a href = "#review">????????????</a></span>
                    <span class = "product_view_list_item"><a href = "#QnA">????????????</a></span>

                </div>
                <div class = "item_view">
                    <div class = "ProductInfo_info">
                        <p class = "imagePosition">
                            <img src = "../image/Background/<%=ProductNumber%>.jpg"/>
                        </p>

                    </div>
                </div>

            </div>

        </div>
    </div>
    <footer>
        <jsp:include page="../footer.jsp"/>

    </footer>
    <script src = "../js/ProductView.js"></script>
    <script src = "http://l.bsks.ac.kr/~p201887082/DiliManage/js/jq.js"></script>
</body>
</html>
