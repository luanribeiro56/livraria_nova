<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CompraLivro"%>
<%@include file="cabecalho.jsp" %>
<%
    if(request.getParameter("id")==null)
    {
    response.sendRedirect("index.jsp");
    return;
    }
    
    Integer id = Integer.parseInt(request.getParameter("id"));
    LivroDAO ldao = new LivroDAO();
    Livro l = ldao.buscarPorChavePrimaria(id);
    List<CompraLivro> carrinho;
    CompraLivro cl = new CompraLivro();
    cl.setLivro(l);
    cl.setValorunitario(l.getPreco());
    if (session.getAttribute("carrinho") != null) {
        
        carrinho = (List<CompraLivro>)session.getAttribute("carrinho");
        carrinho.add(cl);
    }
    
    else{
        carrinho = new ArrayList<CompraLivro>();
        carrinho.add(cl);
    }
    session.setAttribute("carrinho", carrinho);
        
    
%>
<div class="cart_area section_padding_100 clearfix">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <% for (CompraLivro obj : carrinho) {
                                        
                                %>
                                <tbody>
                                    <tr>
                                        <td class="cart_product_img d-flex align-items-center">
                                            <a href="#"><img src="../arquivos/<%=obj.getLivro().getImagem1()%>" alt="Product"></a>
                                            <h6><%=obj.getLivro().getNome()%></h6>
                                        </td>
                                        <td class="price"><span><%=obj.getLivro().getNome()%></span></td>
                                        <td class="qty">
                                            <div class="quantity">
                                                <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                <input type="number" class="qty-text" id="qty" step="1" min="1" max="99" name="quantity" value="1">
                                                <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                            </div>
                                        </td>
                                        <td class="total_price"><span><%=obj.getValorunitario()%></span></td>
                                    </tr>
                                </tbody>
                                <%}%>
                            </table>
                        </div>
                             
                        <div class="cart-footer d-flex mt-30">
                            <div class="back-to-shop w-50">
                                <a href="index.jsp">Continue Comprando</a>
                            </div>
                            <div class="update-checkout w-50 text-right">
                                <a href="#">Limpar Carrinho</a>
                                <a href="#">Update cart</a>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="coupon-code-area mt-70">
                            <div class="cart-page-heading">
                                <h5>Cupom de Desconto</h5>
                                <p>Digite seu Cupom de Desconto</p>
                            </div>
                            <form action="#">
                                <input type="search" name="search" placeholder="#569ab15">
                                <button type="submit">Entrar</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="shipping-method-area mt-70">
                            <div class="cart-page-heading">
                                <h5>Shipping method</h5>
                                <p>Select the one you want</p>
                            </div>

                            <div class="custom-control custom-radio mb-30">
                                <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
                                <label class="custom-control-label d-flex align-items-center justify-content-between" for="customRadio1"><span>Next day delivery</span><span>$4.99</span></label>
                            </div>

                            <div class="custom-control custom-radio mb-30">
                                <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
                                <label class="custom-control-label d-flex align-items-center justify-content-between" for="customRadio2"><span>Standard delivery</span><span>$1.99</span></label>
                            </div>

                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
                                <label class="custom-control-label d-flex align-items-center justify-content-between" for="customRadio3"><span>Personal Pickup</span><span>Free</span></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-total-area mt-70">
                            <div class="cart-page-heading">
                                <h5>Valor Total:</h5>
                            </div>

                            <ul class="cart-total-chart">
                                <li><span>Subtotal</span> <span>$59.90</span></li>
                                <li><span>Shipping</span> <span>Free</span></li>
                                <li><span><strong>Total</strong></span> <span><strong>$59.90</strong></span></li>
                            </ul>
                            <a href="formulario.jsp" class="btn karl-checkout-btn">Confirmar Compra</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@include file="rodape.jsp" %>