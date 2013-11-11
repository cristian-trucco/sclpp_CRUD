<%@page import="sclpp.model.Cliente,sclpp_persistencia.ClienteDAO"%>


<%
try{
    /*odo código vem url vem como string converte int
    *String cod_cliente = request.getParameter("cod_cliente");
    */
    Integer cod_cliente = new Integer(request.getParameter("cod_cliente"));
    //métodos pra buscar os dados do cliente
    //instanciar
    ClienteDAO cd = new ClienteDAO();
    //recebe o método passando por parâmetro
    Cliente c = cd.buscaporId(cod_cliente);
    if(c.getCod_cliente() >0){
        
    }
    
%>
    
    <form action="controle.jsp?action=update" method="post">
        <h3>Código Cliente:<%= c.getCod_cliente() %>/h3>
            <label for="nome"> Nome:</label><br>
            <input type="text" name="nome" value="<%= c.getNome()%>"/> <br>
            
            <label for="telefone"> Telefone:</label><br>
            <input type="text" name="telefone" value="<%= c.getTelefone()%>"/><br>
            
            <label for="email"> Email:</label><br>
            <input type="text" name="email" value="<%= c.getEmail()%>"/><br>
            <input type="hidden" value="<%= c.getCod_cliente()  %>" name="cod_cliente"/>
            <input type="submit" value="Cadastrar"/>
            
    </form><br />
        <font color="#FF0000">
        ${msg}
        </font>



<%
}catch(Exception e){
    
}


%>