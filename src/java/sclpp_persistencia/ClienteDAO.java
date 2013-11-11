
package sclpp_persistencia;
import sclpp.model.Cliente;
import java.util.ArrayList;
import java.util.List;

//MÉTODOS cadastrar
public class ClienteDAO extends sclpp_DAO{
    //PASSA A CLASSE CLIENTE
    public void cadastrar(Cliente c)throws Exception{
    OpenDatabase();
    String SQL = "INSERT INTO tb_cliente VALUES (null,?,?,?)";
    
    //prepareStatement para recerber o pararâmetro 
    pstn = con.prepareStatement(SQL);
    //PASSA OS VALORES
    pstn.setString(1, c.getNome());
    pstn.setString(2,c.getTelefone());
    pstn.setString(3,c.getEmail());
    //fechar o sql
    CloseDatabase();
    
    //passa a query sql
    pstn.execute();
    CloseDatabase();
    
}
    public Cliente buscaporId(Integer id) throws Exception{
        OpenDatabase();
        String SQL = ("SELECT * FROM tb_cliente where cod_cliente=?"); 
        pstn = con.prepareStatement(SQL);
        rs = pstn.executeQuery();
        Cliente  c= new Cliente();
        if(rs.next()){
        c.setNome(rs.getString("nome"));
        c.setTelefone(rs.getString("telefone"));
        c.setEmail(rs.getString("email"));
        }    
        return c;
    }
    
    //não retorna
    //PASSA O OBJETO CLIENTE C
    public void delete(Cliente c) throws Exception{
        String SQL = "DELETE tb_cliente WHERE cod_cliente ";
       //ele prepara o SQL e previne o injection
        pstn = con.prepareStatement(SQL);
        pstn.setInt(1,c.getCod_cliente());
        pstn.execute();
    }
    //NÃO PASSAR PARÂMETROS  *** MÉTODO LISTA
    public List<Cliente> listaClientes()throws Exception{
        //PARA OBTER DADOS ABRIR O BD
        OpenDatabase();
        String SQL = "SELECT * FROM tb_cliente";
        //retorno
        pstn = con.prepareStatement(SQL);
        rs = pstn.executeQuery();
         //criar o objeto
        Cliente c = null;
        List<Cliente> listaClientes = new ArrayList<Cliente>();
       //enquanto tiver pessoas ele vai inserir
        while(rs.next()){
        //adicina a lista e limpa
        c = new Cliente();
        //métodos
        c.setCod_cliente(rs.getInt("cod_cliente"));
        c.setNome(rs.getString("nome"));
        c.setTelefone(rs.getString("telefone"));
        c.setEmail(rs.getString("email"));
        //adiciona na lista e renova a lista
        listaClientes.add(c);
    }
        return listaClientes;
    }
    //pzassa parâmetro
    public void update(Cliente C)throws  Exception{
        //Abre  o banco
        OpenDatabase();                
        String SQL = "UPDATE tb_cliente set nome=?, set telefone=?, set email=? "+
                "WHERE cod_cli pstente=?";
        pstn = con.prepareStatement(SQL);
         //PASSA OS VALORES
         pstn.setString(1, c.getNome());
          pstn.setString(2,c.getTelefone());
        pstn.setString(3,c.getEmail());
        pstn.setInt(3,c.getEmail());
        rs =  pstn.executeQuery();
                
        
        
       
        
        
        
    }
 }
