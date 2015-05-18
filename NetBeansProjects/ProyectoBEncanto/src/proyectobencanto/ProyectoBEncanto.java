/**
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectobencanto;

import java.sql.*;
import java.util.Scanner;


/**
 *
 * @author gaby
 */
public class ProyectoBEncanto {
 ///Constantes para la conexion a la base de datos
    public static final String PASSWORD = "zopilote211113";
    public static final String USUARIO = "root";
    public static final String BASE = "jdbc:mysql://localhost/boutique_prueba";
    public static ResultSet resultados;
    public static int opcion, id_cliente,id_venta,modificar,num_articulos;
    public static int idempleado,tipo_dato;
    public static float total,pagado;
    public static String sql ,nombre,ap,am,fecha,descuento;
    public static String plazo_limite_pago,pass,valor;
    public static Scanner sc = new Scanner(System.in);
    
    ///Funcion que realiza la base de datos
   
public static Connection conectar() throws SQLException{
    
    Connection conexion = null;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(BASE,USUARIO,PASSWORD);
            
        }catch(ClassNotFoundException ex){
            System.out.println("\nNo pudo generar la conexion\n"+ex);
        }
        
        return conexion;
    }
   
public static int mostrar(String query, int desicion) throws SQLException{
    
        Connection con= conectar();
        int val = 1;
        
        try {
            Statement comando = (Statement) con.createStatement();            
            resultados = comando.executeQuery(query);
            
        } catch (SQLException e) {            
            System.out.println("\nError de lectura\n");
        }
        
        while(resultados.next()){
          
            if(desicion == 1){
                
                try {   
                    
                    id_cliente = resultados.getInt("idCliente");
                    ap = resultados.getString("apellido_paterno");
                    am = resultados.getString("apellido_materno");
                    nombre = resultados.getString("nombre");
                    total = resultados.getFloat("saldo_restante");
                    val =0;
                    System.out.println("\nidCliente" +id_cliente+
                        "\nApellido_paterno" +ap+ "\nApellido_materno" +am+
                        "\nNombre" +nombre+"\nSaldo:"+total+"\n");
                    
                    } catch (SQLException e) {
                        
                    System.out.println("\nError de lectura\n");
                }
                
            }else{
                
                if(desicion == 2){
                    
                    try {  
                        
                        id_venta = resultados.getInt("id_venta");
                        num_articulos = resultados.getInt("numero_articulos");
                        idempleado = resultados.getInt("idempleado");
                        total =resultados.getFloat("total_venta");
                        fecha = resultados.getString("fecha_venta");
                        id_cliente = resultados.getInt("idCliente");
                        
                        System.out.println("\nid_venta: "+id_venta+
                               "\tNumero_articulos: "+num_articulos+
                               "\tidempleado: "+idempleado+"\ntotal_venta"+total+
                                "\nfecha_venta"+fecha+ 
                                "\nidCliente"+id_cliente+"\n");
                        val = 0;
                        
                    } catch (SQLException e) {
                        
                        System.out.println("\nError de lectura\n");
                    }
                    
                }else{
                    
                    if(desicion == 3){
                        
                        try { 
                            
                            fecha = resultados.getString("fecha");
                            id_venta = resultados.getInt("id_venta");
                            System.out.println("\nfecha : "+fecha+ 
                                "\nid_venta"+id_venta+"\n");
                               
                            val = 0;
                            
                            } catch (SQLException e) {
                                
                                System.out.println("\nError de lectura\n");
                            }
                    }
                    else{
                        
                        if(desicion == 4){
                            
                            try{
                                
                                idempleado = resultados.getInt("idempleado");
                                ap = resultados.getString("apellido_paterno");
                                am = resultados.getString("apellido_materno");
                                nombre = resultados.getString("nombre");
                                System.out.println("\nNumero de empleado:"
                                        +idempleado+"\nApellido Paterno:"+ap+
                                        "\nApellido Materno"+am+"\nNombre"
                                        +nombre+"\n");
                                val = 0;
                            
                            }catch(SQLException e){
                                
                                System.out.println("\nError de lectura");
                            }
                        }else{
                            
                            if(desicion == 5){
                                
                                try{
                                    
                                   idempleado = resultados.getInt("Empleado_idempleado");
                                   nombre = resultados.getString("nombre_usuario");
                                   pass = resultados.getString("password");
                                   System.out.println("\nNumero de empleado:"
                                           +idempleado+"\nNombre de usuario:"
                                           +nombre+"\nContraseña:"+pass+"\n");
                                   val = 0;
                                }catch(SQLException e){
                                    
                                    System.out.println("\nError de lectura");
                                }
                            }else{
                                
                                if(desicion == 6){
                                    
                                    try{
                                        
                                        valor = resultados.getString("valor");
                                        tipo_dato = resultados.getInt("tipo_dato");
                                        id_cliente = resultados.getInt("idCliente");
                                        val = 0;
                                        
                                    }catch(SQLException e){
                                        
                                        System.out.println("\nError de lectura");
                                    }
                                }
                            }
                            
                        }
                    }
                    
                }
                
            }
            
        }
        
        if(val ==1) {
            
            System.out.println("\nNo se encontraron datos\n");
        }
        return val;
    }
 
    public static void main(String[] args) throws SQLException {
        //ProyectoBEncanto a = new ProyectoBEncanto();
        //a.setVisible(true);
        MenuPrincipal Mp = new MenuPrincipal();
        Mp.setVisible(true);
    }

    static void funcion(String sql, String sql2) throws SQLException {
        
        Connection con= conectar();
        
        try{
            try ( ///Crea la sentencia y ejecuta del almacenamiento de informacion
                    
                Statement sentencia = con.createStatement()) {
                sentencia.execute(sql);
                System.out.println(sql);
                System.out.println("Datos ingresados correctamente");
            }
            con.close();
        }
        catch (Exception ex)
        {
            try (Statement sentencia = con.createStatement()) {
                sentencia.execute(sql2);
                System.out.println(sql2);
                System.out.println("Datos modificados correctamente");
            }
            con.close();
        }
    }


 }
