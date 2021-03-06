/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectobencanto;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.DefaultTableModel;
import static proyectobencanto.ProyectoBEncanto.sql;

/**
 *
 * @author gaby
 */
public class Venta extends javax.swing.JInternalFrame {

    /**
     * Creates new form Venta
     */
    public Venta() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane3 = new javax.swing.JScrollPane();
        jPanel1 = new javax.swing.JPanel();
        Cerrar = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        IngresarDVenta = new javax.swing.JButton();
        Guardar = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        IngresarVentas = new javax.swing.JButton();
        Eliminar = new javax.swing.JButton();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();

        Cerrar.setFont(new java.awt.Font("DejaVu Sans Condensed", 0, 15)); // NOI18N
        Cerrar.setText("Cerrar");
        Cerrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CerrarActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("DejaVu Sans Condensed", 0, 15)); // NOI18N
        jLabel1.setText("                                                           Acerca de la venta");

        jLabel2.setFont(new java.awt.Font("DejaVu Sans Condensed", 0, 15)); // NOI18N
        jLabel2.setText("                                                                   Ventas");

        IngresarDVenta.setFont(new java.awt.Font("DejaVu Sans Condensed", 0, 15)); // NOI18N
        IngresarDVenta.setText("IngresarNuevo");
        IngresarDVenta.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                IngresarDVentaActionPerformed(evt);
            }
        });

        Guardar.setFont(new java.awt.Font("DejaVu Sans Condensed", 0, 15)); // NOI18N
        Guardar.setText("GuardarCambios");
        Guardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                GuardarActionPerformed(evt);
            }
        });

        jTable2.setFont(new java.awt.Font("DejaVu Sans Condensed", 0, 15)); // NOI18N
        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "NumeroVenta", "NumeroArticulo", "Cantidad", "Pagado", "Fechalimite"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, true, true, true, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane2.setViewportView(jTable2);

        jTable1.setFont(new java.awt.Font("DejaVu Sans Condensed", 0, 15)); // NOI18N
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "NumeroVenta", "Numero_articulos", "Nombre_Empleado", "Total", "Fecha", "NombreCliente"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class, java.lang.Float.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, true, true, true, true, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);

        IngresarVentas.setFont(new java.awt.Font("DejaVu Sans Condensed", 0, 15)); // NOI18N
        IngresarVentas.setText("IngresarNuevo");
        IngresarVentas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                IngresarVentasActionPerformed(evt);
            }
        });

        Eliminar.setFont(new java.awt.Font("DejaVu Sans Condensed", 0, 15)); // NOI18N
        Eliminar.setText("Eliminar");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(IngresarDVenta)
                        .addGap(77, 77, 77)
                        .addComponent(Guardar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(Eliminar)
                        .addGap(74, 74, 74)
                        .addComponent(Cerrar))
                    .addComponent(jScrollPane1)
                    .addComponent(IngresarVentas)
                    .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane2)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 600, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(59, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addComponent(IngresarVentas)
                .addGap(21, 21, 21)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(IngresarDVenta)
                    .addComponent(Guardar)
                    .addComponent(Eliminar)
                    .addComponent(Cerrar))
                .addContainerGap(133, Short.MAX_VALUE))
        );

        jScrollPane3.setViewportView(jPanel1);

        jMenu1.setText("Facturas");

        jMenuItem1.setText("Ver");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem1);

        jMenuBar1.add(jMenu1);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 673, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(173, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane3, javax.swing.GroupLayout.Alignment.TRAILING)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void IngresarDVentaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_IngresarDVentaActionPerformed

        
       
    }//GEN-LAST:event_IngresarDVentaActionPerformed

    private void CerrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_CerrarActionPerformed
        //  cierra el entorno abierto y vuelve a menu  principal
        this.setVisible(false);
    }//GEN-LAST:event_CerrarActionPerformed
  
    
    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        // TODO add your handling code here:
        //this.hide();
        Factura fc = new Factura();
        fc.setVisible(true);
        
        
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void IngresarVentasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_IngresarVentasActionPerformed
        // Agrega nuevas filas a la tabla
       DefaultTableModel  model = (DefaultTableModel)jTable1.getModel();
        
        int fila_select = model.getRowCount();
        int dato;
        Object[] fila = new Object [6];
        
        if(fila_select > 0){
            dato = Integer.parseInt(model.getValueAt(fila_select-1, 0).toString());
            fila[0] = dato + 1;
        }else
            
        fila[0] = 1;
        fila[1] = new String();
        fila[2] = new String();
        fila[3] = new String();
        fila[4] = 0;
        fila[5] = new String();
        model.addRow(fila);
        jTable1.setModel(model);   
    }//GEN-LAST:event_IngresarVentasActionPerformed

    private void GuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_GuardarActionPerformed
        // Guarda datos  ingresados en la tabla
        int rows , cols , num_venta = 0;
        rows = jTable1.getRowCount();
        cols = jTable1.getColumnCount();
        String nombre_empleado = null, fecha = null, nombre_cliente = null;
        int numero_articulos = 0;
        float total = 0;
        try {
            ProyectoBEncanto.conectar();
        } catch (SQLException ex) {
            System.out.println("fallo conexion");
        }
        for(int x = 0 ; x < rows ; x ++){
            for(int y = 0 ; y < cols ; y ++){
                if(y == 0)
                    num_venta = Integer.parseInt(
                        jTable1.getValueAt(x, y).toString());
                else if(y == 1)
                    numero_articulos = Integer.parseInt(
                            jTable1.getValueAt(x, y).toString());
                else if(y == 2)
                    nombre_empleado = jTable1.getValueAt(x, y).toString();
                else if(y == 3) 
                   total = Float.parseFloat(jTable1.getValueAt(x, y).
                            toString());
                else if(y == 4)
                    fecha = jTable1.getValueAt(x, y).toString();
                else if(y == 5){    
                    nombre_cliente = jTable1.getValueAt(x, y).toString();
                    
                }

            }

            sql ="INSERT INTO Venta(idVenta,Numero_articulos"
            + ",idempleado,total_venta,fecha_venta,idCliente) "
            + "VALUES("+num_venta+",'"+numero_articulos+"',"
            + "'"+nombre_empleado+"','"+total+"',"+fecha+","+nombre_cliente+")";
            System.out.println(sql);
            try {
                ProyectoBEncanto.funcion(sql, sql);
            } catch (SQLException ex) {
                Logger.getLogger(Venta.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }//GEN-LAST:event_GuardarActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Cerrar;
    private javax.swing.JButton Eliminar;
    private javax.swing.JButton Guardar;
    private javax.swing.JButton IngresarDVenta;
    private javax.swing.JButton IngresarVentas;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTable jTable1;
    private javax.swing.JTable jTable2;
    // End of variables declaration//GEN-END:variables
}
