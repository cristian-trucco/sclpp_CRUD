
package sclpp_persistencia;

import java.sql.Statement;  
import java.sql.Connection;  
import java.sql.DriverManager; 
import java.sql.*;

public class sclpp_DAO {
    Connection con;
    PreparedStatement pstn;
    ResultSet rs;
    
    /*FORA
     *  String url = "jdbc:postgresql://localhost:5432/TesteJava";  
                String usuario = "postgres";  
                String senha = "123456";  
      
                Class.forName("org.postgresql.Driver");  
      
                Connection con;  
      
     *========================================
    */
    public void OpenDatabase()throws Exception{
        Class.forName("ERRO");
        String url = "jdbc";
        String user = "postgres";
        String password = "1234";
        con = DriverManager.getConnection(url, user,password );
        
        
    }
    public void CloseDatabase()throws Exception{
        if(con !=null)
            con.close();
    }
}

/*
 package conexaopostgresql;  
      
    import java.sql.Statement;  
    import java.sql.Connection;  
    import java.sql.DriverManager;  
      
    
    public class Main {  
      
        
          @param args the command line arguments 
           
        public static void main(String[] args) {  
            // TODO code application logic here  
            try {  
      
                String url = "jdbc:postgresql://localhost:5432/TesteJava";  
                String usuario = "postgres";  
                String senha = "123456";  
      
                Class.forName("org.postgresql.Driver");  
      
                Connection con;  
      
                con = DriverManager.getConnection(url, usuario, senha);  
      
                System.out.println("Conexão realizada com sucesso.");  
      
                Statement stm = con.createStatement();  
      
               // stm.executeQuery("INSERT INTO teste VALUES (1,'Cynthia')");  
      
                stm.executeUpdate("INSERT INTO teste VALUES (1,'Cynthia')");  
                //Editado 21/09/2011 para correção: executeQuery é usado para pesquisa, executeUpdate deve ser usado para inserir  
                con.close();  
      
            } catch (Exception e) {  
                 e.printStackTrace();  
            }  
        }  
    }  
 */
