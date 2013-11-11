
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- IMPORTAR -->
<%@page import="sclpp.model.Cliente,sclpp_persistencia.ClienteDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Principal</title>
    </head>
    <body>  
        <h1>Cadastro</h1>
        <form action="controle.jsp?action=cadastrar" method="post">
            
            <label for="nome"> Nome:</label><br>
            <input type="text" name="nome" value=""/> <br>
            
            <label for="telefone"> Telefone:</label><br>
            <input type="text" name="telefone" value=""/><br>
            
            <label for="email"> Email:</label><br>
            <input type="text" name="email" value=""/><br>
            
            <input type="submit" value="Cadastrar"/>
        </form><br />
        <font color="#FF0000">
        ${msg}
        </font>
        <br />
        <br />
        <table>
            <h1> Lista de Clientes</h1>
            <tr>
                <td> Código do Cliente</td>
                <td> Nome</td>
                <td> Telefone</td>
                <td> E-mail</td>
                <td>Excluir ?</td>
                <td>Atualizar ?</td>
            </tr>
            
            <%
            try{
                //chamando uma instância da classe cliente DAO
               ClienteDAO cd = new ClienteDAO();
               //lista 
               List<Cliente> lista = cd.listaClientes();
               
               for(Cliente c : lista){
                
                
             %>
                
            
            <tr>
                <!--escreve -->
                <td><%= c.getCod_cliente() %></td>
                <td><%= c.getNome() %></td>
                <td><%= c.getEmail() %></td>
<td><% out.print("<a href=controle.jsp?actionexcluir&cod_cliente="+c.getCod_cliente()+">Excluir?</a>"); %></td>
            
<td><% out.print("<a href=atualizar.jsp?&cod_cliente="+c.getCod_cliente()+">Atualizar?</a>"); %></td>
            </tr>
            
            <%
            }//FECHAR FOR
            
            }catch(Exception e){
                  out.println("Error:");
                  
              }
            %>
        </table>
        
    </body>
</html>
