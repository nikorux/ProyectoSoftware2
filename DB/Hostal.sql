-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: hostal
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bebida`
--

DROP TABLE IF EXISTS `bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bebida` (
  `IdBebida` int(11) NOT NULL AUTO_INCREMENT,
  `NombreBebida` varchar(45) DEFAULT NULL,
  `PrecioBebida` float DEFAULT NULL,
  `IdHistorialPrecio` int(11) DEFAULT NULL,
  `IdCategoria` int(11) DEFAULT NULL,
  `IdReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdBebida`),
  KEY `IdHistorialPrecio_idx` (`IdHistorialPrecio`),
  KEY `IdCategoria_idx` (`IdCategoria`),
  KEY `IdReceta_idx` (`IdReceta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebida`
--

LOCK TABLES `bebida` WRITE;
/*!40000 ALTER TABLE `bebida` DISABLE KEYS */;
INSERT INTO `bebida` VALUES (1,'Refresco Country Club Sabor Merengue',35,NULL,1,NULL),(2,'Refresco Coca Cola, 16.9oz',35,NULL,1,NULL),(3,'Refresco Seven Up, 16.9oz',35,NULL,1,NULL);
/*!40000 ALTER TABLE `bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCategoria` varchar(45) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bebidas',_binary '\0',NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `combo` (
  `IdCombo` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCombo` varchar(45) DEFAULT NULL,
  `Existencia` int(11) DEFAULT NULL,
  `KitMinimo` int(11) DEFAULT NULL,
  `KitMaximo` int(11) DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `PrecioCombo` float DEFAULT NULL,
  `IdHistorialPrecio` int(11) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdCombo`),
  KEY `Id_HistorialPrecio_idx` (`IdHistorialPrecio`),
  CONSTRAINT `Id_HistorialPrecio` FOREIGN KEY (`IdHistorialPrecio`) REFERENCES `historial_precio` (`IdHistorialPrecio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo`
--

LOCK TABLES `combo` WRITE;
/*!40000 ALTER TABLE `combo` DISABLE KEYS */;
/*!40000 ALTER TABLE `combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura_reservacion`
--

DROP TABLE IF EXISTS `detalle_factura_reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_factura_reservacion` (
  `IdDetalleFacturaReservacion` int(11) NOT NULL,
  `IdFacturaReservacion` int(11) DEFAULT NULL,
  `IdReservacion` int(11) DEFAULT NULL,
  `SubTotal` float DEFAULT NULL,
  `ITBIS` float DEFAULT NULL,
  `TotalAPagar` float DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdDetalleFacturaReservacion`),
  KEY `IdFacturaReservacion_idx` (`IdFacturaReservacion`),
  KEY `IdReservacion_idx` (`IdReservacion`),
  CONSTRAINT `IdFacturaReservacion` FOREIGN KEY (`IdFacturaReservacion`) REFERENCES `factura_reservacion` (`IdFacturaReservacion`),
  CONSTRAINT `IdReservaciony` FOREIGN KEY (`IdReservacion`) REFERENCES `reservacion` (`IdReservacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura_reservacion`
--

LOCK TABLES `detalle_factura_reservacion` WRITE;
/*!40000 ALTER TABLE `detalle_factura_reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura_reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_pedido` (
  `IdDetallePedido` int(11) NOT NULL AUTO_INCREMENT,
  `IdPedido` int(11) DEFAULT NULL,
  `IdFactura` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdDetallePedido`),
  KEY `IdPedido_idx` (`IdPedido`),
  KEY `IdFactura_idx` (`IdFactura`),
  CONSTRAINT `IdFactura` FOREIGN KEY (`IdFactura`) REFERENCES `factura` (`IdFactura`),
  CONSTRAINT `IdPedido` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `documento` (
  `NombreDocumento` varchar(45) NOT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  `IdTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`NombreDocumento`),
  UNIQUE KEY `IdTipoDocumento_UNIQUE` (`IdTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES ('Cédula',_binary '\0',NULL,1),('Holaaa',_binary '',NULL,3),('Nada',_binary '',NULL,6),('Pago',_binary '',NULL,7),('Pasaporte',_binary '\0',NULL,8),('Prueba 2',_binary '',NULL,10),('Prueba 3',_binary '',NULL,11);
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empleado` (
  `IdEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `PrimerNombre` varchar(45) DEFAULT NULL,
  `SegundoNombre` varchar(45) DEFAULT NULL,
  `PrimerApellido` varchar(45) DEFAULT NULL,
  `SegundoApellido` varchar(45) DEFAULT NULL,
  `Rol` varchar(45) DEFAULT NULL,
  `TipoDocumento` varchar(45) DEFAULT NULL,
  `NumDocumento` varchar(45) DEFAULT NULL,
  `Sexo` varchar(10) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `Provincia` varchar(45) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdEmpleado`),
  UNIQUE KEY `NumDocumento_UNIQUE` (`NumDocumento`),
  KEY `TipoDocumentoD_idx` (`TipoDocumento`),
  CONSTRAINT `TipoDocumentoD` FOREIGN KEY (`TipoDocumento`) REFERENCES `documento` (`NombreDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Idelsa','Nicole','Polanco','Salas','Cajera','Cédula','40225018411','Femenino','8097154444','Los Reyes','Santiago de los Caballeros','Santiago','República Dominicana','idelsa@gmail.com',_binary '\0',NULL,'admin','admin'),(3,'Joaquín','Luis','Collado','Torres','Cajero','Cédula','40211674177','Masculino','8295847878','El Embrujo III','Santo Domingo','Santo Domingo','República Dominicana','joaluis@gmail.com',_binary '\0',NULL,'joa23','joa23');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `factura` (
  `IdFactura` int(11) NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int(11) DEFAULT NULL,
  `TipoFactura` varchar(45) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `FormaDePago` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `Pagado` float DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdFactura`),
  KEY `IdEmpleado_idx` (`IdEmpleado`),
  CONSTRAINT `IdEmpleado` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleado` (`IdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_empleado`
--

DROP TABLE IF EXISTS `factura_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `factura_empleado` (
  `IdFacturaEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `IdFactura` int(11) DEFAULT NULL,
  `IdEmpleado` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`IdFacturaEmpleado`),
  KEY `IdFactura_idx` (`IdFactura`),
  KEY `Id_Empleado_idx` (`IdEmpleado`),
  CONSTRAINT `Id_Factura` FOREIGN KEY (`IdFactura`) REFERENCES `factura` (`IdFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_empleado`
--

LOCK TABLES `factura_empleado` WRITE;
/*!40000 ALTER TABLE `factura_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_reservacion`
--

DROP TABLE IF EXISTS `factura_reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `factura_reservacion` (
  `IdFacturaReservacion` int(11) NOT NULL AUTO_INCREMENT,
  `IdReservacion` int(11) DEFAULT NULL,
  `IdHuesped` int(11) DEFAULT NULL,
  `Empleado` varchar(45) DEFAULT NULL,
  `SubTotal` float DEFAULT NULL,
  `ITBIS` float DEFAULT NULL,
  `Descuento` float DEFAULT NULL,
  `TotalAPagar` float DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripción` varchar(45) DEFAULT NULL,
  `EfectivoRecibido` float DEFAULT NULL,
  `Devuelta` float DEFAULT NULL,
  `FormaDePago` varchar(45) DEFAULT NULL,
  `CompaniaTarjeta` varchar(45) DEFAULT NULL,
  `UltimosDigitos` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdFacturaReservacion`),
  UNIQUE KEY `IdFacturaReservacion_UNIQUE` (`IdFacturaReservacion`),
  KEY `IdReservacionP_idx` (`IdReservacion`),
  KEY `IdHuesped_idx` (`IdHuesped`),
  CONSTRAINT `IdHuesped` FOREIGN KEY (`IdHuesped`) REFERENCES `huesped` (`IdHuesped`),
  CONSTRAINT `IdReservacionP` FOREIGN KEY (`IdReservacion`) REFERENCES `reservacion` (`IdReservacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_reservacion`
--

LOCK TABLES `factura_reservacion` WRITE;
/*!40000 ALTER TABLE `factura_reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `habitacion` (
  `IdHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `NumHab` int(3) DEFAULT NULL,
  `TipoHab` varchar(45) DEFAULT NULL,
  `CantCamas` int(11) DEFAULT NULL,
  `MaxPersonas` int(11) DEFAULT NULL,
  `Piso` int(11) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Plan` varchar(45) DEFAULT NULL,
  `Detalles` varchar(100) DEFAULT NULL,
  `PrecioPorNoche` float DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  `IsReserved` bit(1) DEFAULT b'0',
  PRIMARY KEY (`IdHabitacion`),
  UNIQUE KEY `IdHabitacion_UNIQUE` (`IdHabitacion`),
  UNIQUE KEY `NumHab_UNIQUE` (`NumHab`),
  KEY `TipoHab_idx` (`TipoHab`),
  CONSTRAINT `TipoHab` FOREIGN KEY (`TipoHab`) REFERENCES `tipo_habitacion` (`NombreTipoHab`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (1,123,'Sencilla',1,3,1,'Disponible',NULL,'',1500,_binary '\0',NULL,_binary '\0'),(2,852,'Matrimonial',1,1,1,'Disponible',NULL,'',1800,_binary '\0',NULL,_binary ''),(3,654,'Doble',2,1,3,'Disponible',NULL,'',2800,_binary '\0',NULL,_binary ''),(4,547,'Sencilla',5,1,3,'Disponible',NULL,'',1500,_binary '\0',NULL,_binary ''),(24,451,'Deluxe',3,6,1,'Disponible',NULL,'',3500,_binary '\0',NULL,_binary ''),(25,742,'Doble',2,4,2,'Disponible',NULL,'',2805,_binary '\0',NULL,_binary '\0'),(26,541,'Doble',3,2,1,'Disponible',NULL,'',2400,_binary '\0',NULL,_binary ''),(27,555,'Doble',3,1,1,'Disponible',NULL,'',2400,_binary '',NULL,_binary '\0'),(29,1456,'Matrimonial',1,2,2,'Disponible',NULL,'',1700,_binary '\0',NULL,_binary '\0'),(30,780,'Matrimonial',2,5,2,'Disponible',NULL,'',1550,_binary '\0',NULL,_binary '\0'),(52,777,'Doble',2,4,1,'Disponible',NULL,'',2500,_binary '\0',NULL,_binary '\0'),(53,554,'Doble',1,1,1,'Disponible',NULL,'',555,_binary '',NULL,_binary '\0');
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_precio`
--

DROP TABLE IF EXISTS `historial_precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `historial_precio` (
  `IdHistorialPrecio` int(11) NOT NULL AUTO_INCREMENT,
  `PrecioActual` float DEFAULT NULL,
  `PrecioCancelado` float DEFAULT NULL,
  `FechaCancelado` date DEFAULT NULL,
  PRIMARY KEY (`IdHistorialPrecio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_precio`
--

LOCK TABLES `historial_precio` WRITE;
/*!40000 ALTER TABLE `historial_precio` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huesped`
--

DROP TABLE IF EXISTS `huesped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `huesped` (
  `IdHuesped` int(11) NOT NULL AUTO_INCREMENT,
  `PrimerNombre` varchar(45) DEFAULT NULL,
  `SegundoNombre` varchar(45) DEFAULT NULL,
  `PrimerApellido` varchar(45) DEFAULT NULL,
  `SegundoApellido` varchar(45) DEFAULT NULL,
  `Compañia` varchar(45) DEFAULT NULL,
  `NombreCompañia` varchar(45) DEFAULT NULL,
  `TipoDocumento` varchar(45) DEFAULT NULL,
  `NumDocumento` varchar(45) DEFAULT NULL,
  `Sexo` varchar(45) DEFAULT NULL,
  `Telefono` char(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `Provincia` varchar(45) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdHuesped`),
  UNIQUE KEY `IdHuesped_UNIQUE` (`IdHuesped`),
  UNIQUE KEY `NumDocumento_UNIQUE` (`NumDocumento`),
  KEY `TipoDocumentoX_idx` (`TipoDocumento`),
  CONSTRAINT `TipoDocumentoX` FOREIGN KEY (`TipoDocumento`) REFERENCES `documento` (`NombreDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huesped`
--

LOCK TABLES `huesped` WRITE;
/*!40000 ALTER TABLE `huesped` DISABLE KEYS */;
INSERT INTO `huesped` VALUES (1,'Nicole','','Espinal','Durán','Sí','Google','Cédula','40209895321','Femenino','8096688194','Los Rieles','Santiago de los Caballeros','Santiago','República Dominicana','nicole.0126@hotmail.es',_binary '\0',NULL),(2,'Marcos','','González','López','Sí','Nintedo','Cédula','40289541232','Masculino','8296654789','Reparto El Este','Santiago de los Caballeros','Santiago','República Dominicana','elvi@hotmail.es',_binary '',NULL),(3,'Rosalina','','Pérez','','Sí','General E','Cédula','40214568896','Femenino','8296547584','dsfsfsa','Santiago de los Caballeros','Santiago','República Dominicana','rosalina@hotmail.com',_binary '\0',NULL),(7,'Josiash','Medrano','Espinal','Castillo','Sí','Ochoa','Cédula','40201454452','Masculino','8296654747','holis','dddd','Santiago','República Dominicana','josias@hotmail.com',_binary '',NULL),(9,'Ironelis','','Herrera','','Sí','Google','Cédula','40202546212','Femenino','8094564525','kkkkkkkkkk','tttttttttttt','Santiago','República Dominicana','ironelis@hotmail.com',_binary '\0',NULL),(35,'Esmeralda','Isa','Peña','','Sí','General E','Cédula','40245615458','Femenino','8099475465','Reparto del Este','Colombia','Santiago','República Dominicana','esmeralda@hotmail.com',_binary '\0',NULL),(43,'Cristian','Omar','Guillén','Santillán','No','','Cédula','40214521565','Masculino','8295458888','Reparto del Este','Santiago de los Caballeros','Santiago','México','cristiansantillan@gmail.com',_binary '\0',NULL),(44,'Jean','Melvin','Lemoine','Torres','No',NULL,'Cédula','40214568595','Masculino','8296655478','Los Reyes','Santiago de los Caballeros','Santiago','Puerto Rico','lemoine@hotmail.com',_binary '\0',NULL);
/*!40000 ALTER TABLE `huesped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `insumo` (
  `IdInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `NombreInsumo` varchar(45) DEFAULT NULL,
  `IdRubro` int(11) DEFAULT NULL,
  `DescripcionInsumo` varchar(45) DEFAULT NULL,
  `Proveedor` int(11) DEFAULT NULL,
  `PrecioCompra` float DEFAULT NULL,
  `PorcientoImpuesto` float DEFAULT NULL,
  `Impuesto` float DEFAULT NULL,
  `PrecioVenta` float DEFAULT NULL,
  `CantActual` int(11) DEFAULT NULL,
  `CantMinima` int(11) DEFAULT NULL,
  `CantMaxima` int(11) DEFAULT NULL,
  `UnidadMedida` int(11) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdInsumo`),
  KEY `Proveedor_idx` (`Proveedor`),
  KEY `Rubro_idx` (`IdRubro`),
  KEY `UnidadMedida_idx` (`UnidadMedida`),
  CONSTRAINT `Proveedor` FOREIGN KEY (`Proveedor`) REFERENCES `proveedor` (`IdProveedor`),
  CONSTRAINT `Rubro` FOREIGN KEY (`IdRubro`) REFERENCES `rubro` (`IdRubro`),
  CONSTRAINT `UnidadMedidaL` FOREIGN KEY (`UnidadMedida`) REFERENCES `unidad_medida` (`IdUnidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'Coca-Cola',1,'Coca-Cola 1 Litro',1,25,0,0,35,50,5,70,1,_binary '\0',NULL),(2,'Agua Cascada',1,'Botella de Agua',1,5,0,0,10,50,5,70,1,_binary '\0',NULL),(3,'Refresco Country Club Sabor Merengue',1,'Refresco ',1,10,0,0,15,50,5,70,1,_binary '\0',NULL);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo_receta`
--

DROP TABLE IF EXISTS `insumo_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `insumo_receta` (
  `IdInsumoReceta` int(11) NOT NULL AUTO_INCREMENT,
  `IdReceta` int(11) DEFAULT NULL,
  `IdInsumo` int(11) DEFAULT NULL,
  `CantidadInsumo` int(11) DEFAULT NULL,
  `UnidadMedida` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdInsumoReceta`),
  KEY `IdRecetaC_idx` (`IdReceta`),
  KEY `IdInsumo_idx` (`IdInsumo`),
  KEY `UnidadMedida_idx` (`UnidadMedida`),
  CONSTRAINT `IdInsumoC` FOREIGN KEY (`IdInsumo`) REFERENCES `insumo` (`IdInsumo`),
  CONSTRAINT `IdRecetaC` FOREIGN KEY (`IdReceta`) REFERENCES `receta` (`IdReceta`),
  CONSTRAINT `UnidadMedida` FOREIGN KEY (`UnidadMedida`) REFERENCES `unidad_medida` (`IdUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo_receta`
--

LOCK TABLES `insumo_receta` WRITE;
/*!40000 ALTER TABLE `insumo_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumo_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `IdPedido` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `TotalAPagar` float DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  `IdPedidoBebida` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `IdPedidoBebida_idx` (`IdPedidoBebida`),
  CONSTRAINT `IdPedidoBebida` FOREIGN KEY (`IdPedidoBebida`) REFERENCES `pedido_bebida` (`IdPedidoBebida`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'2019-07-15',105,_binary '\0',NULL,1),(2,1,'2019-07-15',175,_binary '\0',NULL,2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_bebida`
--

DROP TABLE IF EXISTS `pedido_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido_bebida` (
  `IdPedidoBebida` int(11) NOT NULL AUTO_INCREMENT,
  `IdBebida` int(11) DEFAULT NULL,
  `CantidadBebida` float DEFAULT NULL,
  `SubTotal` float DEFAULT NULL,
  `ITBIS` float DEFAULT NULL,
  `Descuento` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`IdPedidoBebida`),
  KEY `IdBebida_idx` (`IdBebida`),
  CONSTRAINT `IdBebidaD` FOREIGN KEY (`IdBebida`) REFERENCES `bebida` (`IdBebida`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_bebida`
--

LOCK TABLES `pedido_bebida` WRITE;
/*!40000 ALTER TABLE `pedido_bebida` DISABLE KEYS */;
INSERT INTO `pedido_bebida` VALUES (1,1,3,105,0,0,105,_binary '\0',NULL),(2,2,5,175,0,0,175,_binary '\0',NULL);
/*!40000 ALTER TABLE `pedido_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_combo`
--

DROP TABLE IF EXISTS `pedido_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido_combo` (
  `IdPedidoCombo` int(11) NOT NULL AUTO_INCREMENT,
  `IdCombo` int(11) DEFAULT NULL,
  `NombreCombo` varchar(45) DEFAULT NULL,
  `PrecioCombo` float DEFAULT NULL,
  `CantidadCombo` int(11) DEFAULT NULL,
  `SubTotal` float DEFAULT NULL,
  `ITBIS` float DEFAULT NULL,
  `Descuento` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `IdPedido` int(11) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdPedidoCombo`),
  KEY `IdComboT_idx` (`IdCombo`),
  KEY `IdPedidoT_idx` (`IdPedido`),
  CONSTRAINT `IdComboT` FOREIGN KEY (`IdCombo`) REFERENCES `combo` (`IdCombo`),
  CONSTRAINT `IdPedidoT` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_combo`
--

LOCK TABLES `pedido_combo` WRITE;
/*!40000 ALTER TABLE `pedido_combo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_plato`
--

DROP TABLE IF EXISTS `pedido_plato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido_plato` (
  `IdPedidoPlato` int(11) NOT NULL AUTO_INCREMENT,
  `IdPlato` int(11) DEFAULT NULL,
  `NombrePlato` varchar(45) DEFAULT NULL,
  `PrecioPlato` float DEFAULT NULL,
  `CantidadPlato` int(11) DEFAULT NULL,
  `SubTotal` float DEFAULT NULL,
  `ITBIS` float DEFAULT NULL,
  `Descuento` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `IdPedido` int(11) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdPedidoPlato`),
  KEY `IdPlato_idx` (`IdPlato`),
  KEY `IdPedido_idx` (`IdPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_plato`
--

LOCK TABLES `pedido_plato` WRITE;
/*!40000 ALTER TABLE `pedido_plato` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_plato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato`
--

DROP TABLE IF EXISTS `plato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plato` (
  `IdPlato` int(11) NOT NULL AUTO_INCREMENT,
  `NombrePlato` varchar(45) DEFAULT NULL,
  `PrecioPlato` float DEFAULT NULL,
  `IdHistorialPrecio` int(11) DEFAULT NULL,
  `IdCategoria` int(11) DEFAULT NULL,
  `IdReceta` int(11) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdPlato`),
  KEY `IdHistorialPrecio_idx` (`IdHistorialPrecio`),
  KEY `IdCategoria_idx` (`IdCategoria`),
  KEY `IdReceta_idx` (`IdReceta`),
  CONSTRAINT `IdCategoria` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`IdCategoria`),
  CONSTRAINT `IdHistorialPrecio` FOREIGN KEY (`IdHistorialPrecio`) REFERENCES `historial_precio` (`IdHistorialPrecio`),
  CONSTRAINT `IdReceta` FOREIGN KEY (`IdReceta`) REFERENCES `receta` (`IdReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato`
--

LOCK TABLES `plato` WRITE;
/*!40000 ALTER TABLE `plato` DISABLE KEYS */;
/*!40000 ALTER TABLE `plato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_combo`
--

DROP TABLE IF EXISTS `productos_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productos_combo` (
  `IdProductosCombo` int(11) NOT NULL AUTO_INCREMENT,
  `IdPlato` int(11) DEFAULT NULL,
  `IdBebida` int(11) DEFAULT NULL,
  `IdCombo` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdProductosCombo`),
  KEY `IdPlato_idx` (`IdPlato`),
  KEY `IdBebida_idx` (`IdBebida`),
  KEY `IdCombo_idx` (`IdCombo`),
  CONSTRAINT `IdBebida` FOREIGN KEY (`IdBebida`) REFERENCES `bebida` (`IdBebida`),
  CONSTRAINT `IdCombo` FOREIGN KEY (`IdCombo`) REFERENCES `combo` (`IdCombo`),
  CONSTRAINT `IdPlato` FOREIGN KEY (`IdPlato`) REFERENCES `plato` (`IdPlato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_combo`
--

LOCK TABLES `productos_combo` WRITE;
/*!40000 ALTER TABLE `productos_combo` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proveedor` (
  `IdProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `PrimerNombre` varchar(45) DEFAULT NULL,
  `SegundoNombre` varchar(45) DEFAULT NULL,
  `PrimerApellido` varchar(45) DEFAULT NULL,
  `SegundoApellido` varchar(45) DEFAULT NULL,
  `NombreCompañia` varchar(45) DEFAULT NULL,
  `TipoDocumento` varchar(45) DEFAULT NULL,
  `NumDocumento` int(11) DEFAULT NULL,
  `RNC` varchar(45) DEFAULT NULL,
  `IdRubro` int(11) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdProveedor`),
  KEY `IdRubro_idx` (`IdRubro`),
  KEY `TipoDocumentoP_idx` (`TipoDocumento`),
  CONSTRAINT `IdRubro` FOREIGN KEY (`IdRubro`) REFERENCES `rubro` (`IdRubro`),
  CONSTRAINT `TipoDocumentoP` FOREIGN KEY (`TipoDocumento`) REFERENCES `documento` (`NombreDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Miguel','Angel','Sandolval',NULL,'Los Cancos',NULL,NULL,'54645',1,'8296688194','miguel01@hotmail.com',NULL,NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `receta` (
  `IdReceta` int(11) NOT NULL AUTO_INCREMENT,
  `NombreReceta` varchar(45) DEFAULT NULL,
  `DescripcionReceta` varchar(45) DEFAULT NULL,
  `ComentarioReceta` varchar(45) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacion`
--

DROP TABLE IF EXISTS `reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservacion` (
  `IdReservacion` int(11) NOT NULL AUTO_INCREMENT,
  `IdHuesped` int(11) DEFAULT NULL,
  `FechaLlegada` date DEFAULT NULL,
  `FechaSalida` date DEFAULT NULL,
  `FechaCancelacion` date DEFAULT NULL,
  `CantNoches` int(11) DEFAULT NULL,
  `CantAdultos` int(11) DEFAULT NULL,
  `CantInfantes` int(11) DEFAULT NULL,
  `Canal` varchar(45) DEFAULT NULL,
  `Comentario` varchar(100) DEFAULT NULL,
  `PrecioNoche` float DEFAULT NULL,
  `PrecioTotal` float DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  `EstadoReservacion` varchar(45) DEFAULT 'Sin Confirmar',
  `IdHabitacion` int(11) DEFAULT NULL,
  `IsPaid` bit(1) DEFAULT b'0',
  PRIMARY KEY (`IdReservacion`),
  KEY `IdHuesped_idx` (`IdHuesped`),
  KEY `IdHabb_idx` (`IdHabitacion`),
  CONSTRAINT `IdHabb` FOREIGN KEY (`IdHabitacion`) REFERENCES `habitacion` (`IdHabitacion`),
  CONSTRAINT `IdHuespedL` FOREIGN KEY (`IdHuesped`) REFERENCES `huesped` (`IdHuesped`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacion`
--

LOCK TABLES `reservacion` WRITE;
/*!40000 ALTER TABLE `reservacion` DISABLE KEYS */;
INSERT INTO `reservacion` VALUES (34,3,'2020-06-12','2020-06-14',NULL,2,2,0,'Teléfono','',3500,7000,_binary '\0',NULL,'Sin Confirmar',24,_binary '\0'),(35,35,'2020-06-13','2020-06-24',NULL,11,2,0,'Teléfono','',1800,19800,_binary '\0',NULL,'Sin Confirmar',2,_binary '\0');
/*!40000 ALTER TABLE `reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacion_hab`
--

DROP TABLE IF EXISTS `reservacion_hab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservacion_hab` (
  `IdReservacionHab` int(11) NOT NULL AUTO_INCREMENT,
  `IdReservacion` int(11) DEFAULT NULL,
  `IdHabitacion` int(11) NOT NULL,
  PRIMARY KEY (`IdReservacionHab`),
  KEY `IdReservacion_idx` (`IdReservacion`),
  KEY `IdHabitacion_idx` (`IdHabitacion`),
  CONSTRAINT `IdHabitacion` FOREIGN KEY (`IdHabitacion`) REFERENCES `habitacion` (`IdHabitacion`),
  CONSTRAINT `IdReservacion` FOREIGN KEY (`IdReservacion`) REFERENCES `reservacion` (`IdReservacion`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacion_hab`
--

LOCK TABLES `reservacion_hab` WRITE;
/*!40000 ALTER TABLE `reservacion_hab` DISABLE KEYS */;
INSERT INTO `reservacion_hab` VALUES (25,34,24),(26,35,2);
/*!40000 ALTER TABLE `reservacion_hab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubro`
--

DROP TABLE IF EXISTS `rubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rubro` (
  `IdRubro` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdRubro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubro`
--

LOCK TABLES `rubro` WRITE;
/*!40000 ALTER TABLE `rubro` DISABLE KEYS */;
INSERT INTO `rubro` VALUES (1,'Almohadas',NULL,NULL),(3,'Baño',_binary '\0',NULL),(4,'PMS_POS.Model.Rubro',_binary '\0',NULL),(5,'PMS_POS.Model.Rubro',_binary '\0',NULL),(6,'PMS_POS.Model.Rubro',_binary '\0',NULL),(7,'Holisss',_binary '\0',NULL),(8,'Toallas',_binary '\0',NULL),(9,'Kol',_binary '\0',NULL),(10,'Kol',_binary '\0',NULL);
/*!40000 ALTER TABLE `rubro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_habitacion`
--

DROP TABLE IF EXISTS `tipo_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_habitacion` (
  `NombreTipoHab` varchar(45) NOT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  `IdTipoHab` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`NombreTipoHab`),
  UNIQUE KEY `IdTipoHab_UNIQUE` (`IdTipoHab`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_habitacion`
--

LOCK TABLES `tipo_habitacion` WRITE;
/*!40000 ALTER TABLE `tipo_habitacion` DISABLE KEYS */;
INSERT INTO `tipo_habitacion` VALUES ('Deluxe',_binary '\0',NULL,15),('Doble',_binary '\0',NULL,11),('Matrimonial',_binary '\0',NULL,10),('Sencilla',_binary '',NULL,4);
/*!40000 ALTER TABLE `tipo_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `unidad_medida` (
  `IdUnidadMedida` int(11) NOT NULL AUTO_INCREMENT,
  `NombreUnidadMedida` varchar(45) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `DeletedDate` date DEFAULT NULL,
  PRIMARY KEY (`IdUnidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'Litro',_binary '\0',NULL);
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-12 23:50:34
