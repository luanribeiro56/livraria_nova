<%@page import="dao.CompraLivroDAO"%>
<%@page import="dao.CompraDAO"%>
<%@page import="modelo.Compra"%>
<%@page import="modelo.CompraLivro"%>
<%@page import="modelo.Cliente"%>
<%
    if (session.getAttribute("cliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    if (session.getAttribute("carrinho") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    Cliente cli = (Cliente) session.getAttribute("cliente");
    List<CompraLivro> carrinho = (List<CompraLivro>) session.getAttribute("carrinho");
    Compra compra = new Compra();
    compra.setEndereco(cli.getEndereco());
    compra.setCliente(cli);
    Float total = 0.0f;
    for (CompraLivro cp : carrinho) {
        total += cp.getValorunitario();
    }
    compra.setValor(total);
    CompraDAO compradao = new CompraDAO();
    Boolean certo = compradao.incluir(compra);
    compradao.fecharConexao();
    CompraLivroDAO cldao = new CompraLivroDAO();
    if(certo)
    {
        for (CompraLivro car : carrinho) {
                LivroDAO ldao = new LivroDAO();
                Livro l = ldao.buscarPorChavePrimaria(car.getLivro().getId());
                car.setLivro(l);
                car.setCompra(compra);
                cldao.incluir(car);
        }
        session.setAttribute("carrinho", null);
    }
        
        
%>
<%@include file="cabecalho.jsp" %>
<div class="">
    <h4><center>Muito Obrigado por Comprar conosco!!!</center></h4>
</div>
</br>

<%@include file="rodape.jsp" %>