/**
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectobencanto;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import static proyectobencanto.ProyectoBEncanto.conectar;
import static proyectobencanto.ProyectoBEncanto.nombre;
import static proyectobencanto.ProyectoBEncanto.pass;

/**
 *
 * @author gaby
 */
public class metodosloggin {
    
public int validacion(){
    
    String usuario = loggin.txtusuario.getText();
    String  clavedef = String.valueOf(loggin.jpassword.getPassword());
    
    String sql = "select * from usuarios where nombre_usuario = '"+nombre+"'"
            + " and password = '"+pass+"'";
    
    int valor = 0;
    Connection conexion;
    conexion = null;
    
    try{
        Connection con= conectar();
        Statement comando = (Statement) con.createStatement();
        //conexion = metodospool.dataSource.getConnection();
        //Statement st = conexion.createStatement();
        ResultSet resultados = comando.executeQuery(sql);
        
        if(resultados.next()){
        
            valor = 1;
        
        }
   
    }catch(SQLException e){
        
        JOptionPane.showMessageDialog(null, e, "\n Error de conexion",
                JOptionPane.ERROR_MESSAGE);
        
    }/*finally{
        
        try{
            
            conexion.close();
        
        }catch(SQLException e){
            
            JOptionPane.showMessageDialog(null, e, "\n Error de desconexion",
                JOptionPane.ERROR_MESSAGE);

        }
    
    }*/
    
    return valor;   
}
       
}
