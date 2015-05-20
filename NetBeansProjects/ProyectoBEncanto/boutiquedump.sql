-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: boutique_prueba
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `apellido_paterno` varchar(45) DEFAULT NULL,
  `apellido_materno` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `saldo_restante` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empleado` (
  `idempleado` int(11) NOT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(20) DEFAULT NULL,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (1,'Zepeda','Roque','Jovanny'),(2,'Gonzalez','Ramos','Gabriela');
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Factura`
--

DROP TABLE IF EXISTS `Factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Factura` (
  `fecha` date NOT NULL,
  `folio` int(11) NOT NULL,
  PRIMARY KEY (`folio`),
  KEY `fk_Factura_Venta1` (`folio`),
  CONSTRAINT `fk_Factura_Venta1` FOREIGN KEY (`folio`) REFERENCES `Venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factura`
--

LOCK TABLES `Factura` WRITE;
/*!40000 ALTER TABLE `Factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `Empleado_idempleado` int(11) NOT NULL,
  `nombre_usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Empleado_idempleado`),
  CONSTRAINT `fk_Usuarios_Empleado1` FOREIGN KEY (`Empleado_idempleado`) REFERENCES `Empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Jovanny','1234'),(2,'Gabriela','12345');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venta`
--

DROP TABLE IF EXISTS `Venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_articulos` int(11) DEFAULT NULL,
  `idempleado` int(11) NOT NULL,
  `total_venta` decimal(5,2) NOT NULL,
  `fecha_venta` date DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_Venta_Empleado1` (`idempleado`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `fk_Venta_Empleado1` FOREIGN KEY (`idempleado`) REFERENCES `Empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Venta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venta`
--

LOCK TABLES `Venta` WRITE;
/*!40000 ALTER TABLE `Venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo` (
  `id_articulo` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_articulo`),
  KEY `fk_Articulos_Proveedor1` (`id_proveedor`),
  CONSTRAINT `fk_Articulos_Proveedor1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `idcolor` int(11) NOT NULL,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`idcolor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_articulos`
--

DROP TABLE IF EXISTS `compra_articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_articulos` (
  `folio` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `total_pagar` decimal(6,2) DEFAULT NULL,
  `idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`folio`),
  KEY `fk_compra_articulos_proveedor1` (`idproveedor`),
  CONSTRAINT `fk_compra_articulos_proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_articulos`
--

LOCK TABLES `compra_articulos` WRITE;
/*!40000 ALTER TABLE `compra_articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta` (
  `saldo_restante` decimal(5,2) NOT NULL,
  `abono` decimal(5,2) NOT NULL,
  `folio` int(11) NOT NULL,
  PRIMARY KEY (`folio`),
  KEY `fk_abono_Venta1` (`folio`),
  CONSTRAINT `fk_abono_Venta1` FOREIGN KEY (`folio`) REFERENCES `Venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_adicionales_cliente`
--

DROP TABLE IF EXISTS `datos_adicionales_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_adicionales_cliente` (
  `valor` varchar(45) DEFAULT NULL,
  `tipo_dato` int(11) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`tipo_dato`),
  KEY `fk_telefono_empleado_table11` (`tipo_dato`),
  KEY `fk_datos_adicionales_cliente_Cliente1` (`Cliente_idCliente`),
  CONSTRAINT `datos_adicionales_cliente_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`),
  CONSTRAINT `fk_datos_adicionales_cliente_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefono_empleado_table111` FOREIGN KEY (`tipo_dato`) REFERENCES `tipo_dato` (`tipo_dato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_adicionales_cliente`
--

LOCK TABLES `datos_adicionales_cliente` WRITE;
/*!40000 ALTER TABLE `datos_adicionales_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_adicionales_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_adicionales_empleado`
--

DROP TABLE IF EXISTS `datos_adicionales_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_adicionales_empleado` (
  `valor` varchar(45) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `tipo_dato` int(11) NOT NULL,
  PRIMARY KEY (`tipo_dato`),
  KEY `fk_Empleado_domicilio_Empleado1` (`idEmpleado`),
  KEY `fk_telefono_empleado_table11` (`tipo_dato`),
  CONSTRAINT `fk_Empleado_domicilio_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `Empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefono_empleado_table11` FOREIGN KEY (`tipo_dato`) REFERENCES `tipo_dato` (`tipo_dato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_adicionales_empleado`
--

LOCK TABLES `datos_adicionales_empleado` WRITE;
/*!40000 ALTER TABLE `datos_adicionales_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_adicionales_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_adicionales_proveedor`
--

DROP TABLE IF EXISTS `datos_adicionales_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_adicionales_proveedor` (
  `valor` varchar(45) NOT NULL,
  `tipo_dato` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`tipo_dato`),
  KEY `fk_telefono_empleado_table11` (`tipo_dato`),
  KEY `fk_datos_adicionales_proveedor_Proveedor1` (`idproveedor`),
  CONSTRAINT `fk_datos_adicionales_proveedor_Proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefono_empleado_table110` FOREIGN KEY (`tipo_dato`) REFERENCES `tipo_dato` (`tipo_dato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_adicionales_proveedor`
--

LOCK TABLES `datos_adicionales_proveedor` WRITE;
/*!40000 ALTER TABLE `datos_adicionales_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_adicionales_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_articulo`
--

DROP TABLE IF EXISTS `detalle_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_articulo` (
  `inventario_id_articulo` int(11) NOT NULL,
  `idcolor` int(11) DEFAULT NULL,
  `id_talla` int(11) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  PRIMARY KEY (`inventario_id_articulo`),
  KEY `fk_detalle_articulo_inventario1` (`inventario_id_articulo`),
  KEY `fk_detalle_articulo_color1` (`idcolor`),
  KEY `fk_detalle_articulo_table11` (`id_talla`),
  CONSTRAINT `fk_detalle_articulo_color1` FOREIGN KEY (`idcolor`) REFERENCES `color` (`idcolor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_articulo_inventario1` FOREIGN KEY (`inventario_id_articulo`) REFERENCES `inventario` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_articulo_table11` FOREIGN KEY (`id_talla`) REFERENCES `talla` (`id_talla`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_articulo`
--

LOCK TABLES `detalle_articulo` WRITE;
/*!40000 ALTER TABLE `detalle_articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compra` (
  `folio` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_adquisicion` decimal(5,2) DEFAULT NULL,
  `total_compra_producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`folio`),
  KEY `fk_detalle_compra_articulo1` (`id_articulo`),
  CONSTRAINT `fk_detalle_compra_articulo1` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_compra_compra_articulos1` FOREIGN KEY (`folio`) REFERENCES `compra_articulos` (`folio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `id_articulo` int(11) NOT NULL,
  `cantidad_articulo` varchar(45) DEFAULT NULL,
  `pagado` varchar(45) DEFAULT NULL,
  `fecha_limite_pago` varchar(45) DEFAULT NULL,
  `Venta_id_venta` int(11) NOT NULL,
  PRIMARY KEY (`Venta_id_venta`),
  KEY `fk_detalle_compra_inventario1` (`id_articulo`),
  CONSTRAINT `fk_detalle_compra_inventario1` FOREIGN KEY (`id_articulo`) REFERENCES `inventario` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_Venta1` FOREIGN KEY (`Venta_id_venta`) REFERENCES `Venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id_articulo` int(11) NOT NULL,
  `precio_venta` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_articulo`),
  CONSTRAINT `fk_table1_articulo1` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `apellido_paterno` varchar(45) DEFAULT NULL,
  `apellido_materno` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talla`
--

DROP TABLE IF EXISTS `talla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talla` (
  `id_talla` int(11) NOT NULL,
  `talla` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_talla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talla`
--

LOCK TABLES `talla` WRITE;
/*!40000 ALTER TABLE `talla` DISABLE KEYS */;
/*!40000 ALTER TABLE `talla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_dato`
--

DROP TABLE IF EXISTS `tipo_dato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_dato` (
  `tipo_dato` int(11) NOT NULL AUTO_INCREMENT,
  `dato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tipo_dato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_dato`
--

LOCK TABLES `tipo_dato` WRITE;
/*!40000 ALTER TABLE `tipo_dato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_dato` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-20 10:44:50
