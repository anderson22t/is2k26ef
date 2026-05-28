CREATE DATABASE  IF NOT EXISTS `bd_mrp2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_mrp2`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_mrp
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_almacen`
--

DROP TABLE IF EXISTS `tbl_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_almacen` (
  `Pk_Id_Almacen` int NOT NULL AUTO_INCREMENT,
  `Nombre_Almacen` varchar(100) NOT NULL,
  `Ubicacion_Almacen` varchar(150) NOT NULL,
  `Tipo_Almacen` varchar(50) NOT NULL,
  `Estado_Almacen` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Pk_Id_Almacen`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_almacen`

--
-- Table structure for table `tbl_aplicacion`
--

DROP TABLE IF EXISTS `tbl_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_aplicacion` (
  `Pk_Id_Aplicacion` int NOT NULL,
  `Fk_Id_Reporte_Aplicacion` int DEFAULT NULL,
  `Cmp_Nombre_Aplicacion` varchar(50) DEFAULT NULL,
  `Cmp_Descripcion_Aplicacion` varchar(50) DEFAULT NULL,
  `Cmp_Estado_Aplicacion` bit(1) NOT NULL,
  PRIMARY KEY (`Pk_Id_Aplicacion`),
  KEY `Fk_Aplicacion_Reporte` (`Fk_Id_Reporte_Aplicacion`),
  CONSTRAINT `Fk_Aplicacion_Reporte` FOREIGN KEY (`Fk_Id_Reporte_Aplicacion`) REFERENCES `tbl_reportes` (`Pk_Id_Reporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aplicacion`
--

LOCK TABLES `tbl_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_aplicacion` VALUES (1,1,'Gestion de empleado','Se gestionan los empleados del hotel',_binary ''),(301,5,'Empleados','Control de empleados de la hoteleria',_binary ''),(302,NULL,'Usuarios','Control de usuarios de empleados',_binary ''),(303,3,'Perfiles','Perfiles que se asignan a usuarios',_binary ''),(304,NULL,'Modulos','Mantenimiento de modulos',_binary ''),(305,NULL,'Aplicacion','Mantenimiento de aplicaciones',_binary ''),(306,NULL,'Asig Aplicacion Usuario','Asigna permisos a usuarios',_binary ''),(307,NULL,'Asig aplicacion Perfil','Asigna permisos a perfiles',_binary ''),(308,NULL,'Asig Perfiles','Asigna los perfiles a usuarios',_binary ''),(309,NULL,'Bitacora','Da acceso a bitacora',_binary '');
/*!40000 ALTER TABLE `tbl_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tbl_asignacion_modulo_aplicacion`
--

DROP TABLE IF EXISTS `tbl_asignacion_modulo_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignacion_modulo_aplicacion` (
  `Fk_Id_Modulo` int NOT NULL,
  `Fk_Id_Aplicacion` int NOT NULL,
  PRIMARY KEY (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  KEY `Fk_AsigAplicacion` (`Fk_Id_Aplicacion`),
  CONSTRAINT `Fk_AsigAplicacion` FOREIGN KEY (`Fk_Id_Aplicacion`) REFERENCES `tbl_aplicacion` (`Pk_Id_Aplicacion`),
  CONSTRAINT `Fk_AsigModulo` FOREIGN KEY (`Fk_Id_Modulo`) REFERENCES `tbl_modulo` (`Pk_Id_Modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignacion_modulo_aplicacion`
--

LOCK TABLES `tbl_asignacion_modulo_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_asignacion_modulo_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_asignacion_modulo_aplicacion` VALUES (4,301),(4,302),(4,303),(4,304),(4,305),(4,306),(4,307),(4,308),(4,309),(5,700),(5,701),(5,702),(5,703),(5,704),(5,705),(5,706),(5,707),(5,708),(5,709),(5,710),(5,711),(5,712),(5,713),(5,714),(5,715),(5,716),(5,717),(5,718),(5,719),(5,720),(5,721),(5,722),(5,723),(5,724),(5,725),(5,726),(5,727),(5,728),(5,729),(5,730),(5,731);
/*!40000 ALTER TABLE `tbl_asignacion_modulo_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bitacora`
--

DROP TABLE IF EXISTS `tbl_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bitacora` (
  `Pk_Id_Bitacora` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Usuario` int DEFAULT NULL,
  `Fk_Id_Aplicacion` int DEFAULT NULL,
  `Cmp_Fecha` datetime DEFAULT NULL,
  `Cmp_Accion` varchar(255) DEFAULT NULL,
  `Cmp_Ip` varchar(50) DEFAULT NULL,
  `Cmp_Nombre_Pc` varchar(50) DEFAULT NULL,
  `Cmp_Login_Estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Bitacora`),
  KEY `Fk_Bitacora_Usuario` (`Fk_Id_Usuario`),
  KEY `Fk_Bitacora_Aplicacion` (`Fk_Id_Aplicacion`),
  CONSTRAINT `Fk_Bitacora_Aplicacion` FOREIGN KEY (`Fk_Id_Aplicacion`) REFERENCES `tbl_aplicacion` (`Pk_Id_Aplicacion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_Bitacora_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4822 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bitacora`
--

LOCK TABLES `tbl_bitacora` WRITE;
/*!40000 ALTER TABLE `tbl_bitacora` DISABLE KEYS */;
INSERT INTO `tbl_bitacora` VALUES (4583,23,NULL,'2026-04-28 09:18:19','Ingreso','192.168.167.215','KEVINN',_binary ''),(4584,23,NULL,'2026-04-28 09:38:28','Ingreso','192.168.167.215','KEVINN',_binary ''),(4585,23,NULL,'2026-04-28 17:57:50','Ingreso','192.168.1.28','KEVINN',_binary ''),(4586,23,NULL,'2026-04-28 18:00:38','Ingreso','192.168.1.28','KEVINN',_binary ''),(4587,23,701,'2026-04-28 18:01:29','InsertÃ³ un nuevo registro en la tabla \'Tbl_Categoria_Material\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4588,23,702,'2026-04-28 18:02:30','InsertÃ³ un nuevo registro en la tabla \'Tbl_Unidad_Medida\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4589,23,704,'2026-04-28 18:03:00','InsertÃ³ un nuevo registro en la tabla \'Tbl_Materiales\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4590,23,710,'2026-04-28 18:04:26','InsertÃ³ un nuevo registro en la tabla \'Tbl_Estado_Orden_Recibida\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4591,23,NULL,'2026-04-29 13:27:20','Ingreso','192.168.1.28','KEVINN',_binary ''),(4592,23,NULL,'2026-04-29 13:29:18','Ingreso','192.168.1.28','KEVINN',_binary ''),(4593,23,NULL,'2026-04-29 13:47:57','Ingreso','192.168.1.28','KEVINN',_binary ''),(4594,23,NULL,'2026-04-29 15:52:12','Ingreso','192.168.1.28','KEVINN',_binary ''),(4595,23,NULL,'2026-04-29 15:52:51','Ingreso','192.168.1.28','KEVINN',_binary ''),(4596,23,701,'2026-04-29 15:57:07','InsertÃ³ un nuevo registro en la tabla \'Tbl_Categoria_Material\' con llave: 2','192.168.1.28','KEVINN',_binary ''),(4597,23,702,'2026-04-29 15:58:20','InsertÃ³ un nuevo registro en la tabla \'Tbl_Unidad_Medida\' con llave: 2','192.168.1.28','KEVINN',_binary ''),(4598,23,704,'2026-04-29 15:59:26','InsertÃ³ un nuevo registro en la tabla \'Tbl_Materiales\' con llave: 2','192.168.1.28','KEVINN',_binary ''),(4599,23,NULL,'2026-04-29 16:22:25','Ingreso','192.168.1.28','KEVINN',_binary ''),(4600,23,NULL,'2026-04-29 18:06:04','Ingreso','192.168.1.28','KEVINN',_binary ''),(4601,23,NULL,'2026-04-29 18:13:08','Ingreso','192.168.1.28','KEVINN',_binary ''),(4602,23,NULL,'2026-04-29 18:35:49','Ingreso','192.168.1.28','KEVINN',_binary ''),(4603,23,NULL,'2026-04-29 18:51:49','Ingreso','192.168.1.28','KEVINN',_binary ''),(4604,23,NULL,'2026-04-29 19:02:04','Ingreso','192.168.1.28','KEVINN',_binary ''),(4605,23,NULL,'2026-04-29 19:26:34','Ingreso','192.168.1.28','KEVINN',_binary ''),(4606,23,NULL,'2026-04-29 22:25:30','Ingreso','192.168.1.28','KEVINN',_binary ''),(4607,23,NULL,'2026-04-29 22:26:46','Ingreso','192.168.1.28','KEVINN',_binary ''),(4608,23,NULL,'2026-04-29 22:28:24','Ingreso','192.168.1.28','KEVINN',_binary ''),(4609,23,NULL,'2026-04-29 22:34:42','Ingreso','192.168.1.28','KEVINN',_binary ''),(4610,23,NULL,'2026-04-29 22:36:30','Ingreso','192.168.1.28','KEVINN',_binary ''),(4611,23,NULL,'2026-04-29 22:38:59','Ingreso','192.168.1.28','KEVINN',_binary ''),(4612,23,NULL,'2026-04-29 22:45:15','Ingreso','192.168.1.28','KEVINN',_binary ''),(4613,23,NULL,'2026-04-29 22:54:18','Ingreso','192.168.1.28','KEVINN',_binary ''),(4614,23,NULL,'2026-04-29 22:57:02','Ingreso','192.168.1.28','KEVINN',_binary ''),(4615,23,NULL,'2026-04-29 23:15:13','Ingreso','192.168.1.28','KEVINN',_binary ''),(4616,23,NULL,'2026-04-30 07:00:45','Ingreso','192.168.167.215','KEVINN',_binary ''),(4617,23,NULL,'2026-04-30 07:06:10','Ingreso','192.168.167.215','KEVINN',_binary ''),(4618,23,NULL,'2026-04-30 07:08:53','Ingreso','192.168.167.215','KEVINN',_binary ''),(4619,23,707,'2026-04-30 07:11:43','InsertÃ³ un nuevo registro en la tabla \'Tbl_Estado_BOM\' con llave: 1','192.168.167.215','KEVINN',_binary ''),(4620,23,NULL,'2026-04-30 07:49:40','Ingreso','192.168.167.215','KEVINN',_binary ''),(4621,23,NULL,'2026-04-30 07:54:36','Ingreso','192.168.167.215','KEVINN',_binary ''),(4622,23,NULL,'2026-04-30 07:56:47','Ingreso','192.168.167.215','KEVINN',_binary ''),(4623,23,NULL,'2026-04-30 08:02:08','Ingreso','192.168.167.215','KEVINN',_binary ''),(4624,23,NULL,'2026-04-30 09:33:28','Ingreso','192.168.167.215','KEVINN',_binary ''),(4625,23,NULL,'2026-04-30 09:42:45','Ingreso','192.168.167.215','KEVINN',_binary ''),(4626,23,NULL,'2026-04-30 09:46:23','Ingreso','192.168.167.215','KEVINN',_binary ''),(4627,23,NULL,'2026-04-30 09:52:23','Ingreso','192.168.167.215','KEVINN',_binary ''),(4628,23,NULL,'2026-04-30 16:21:51','Ingreso','192.168.1.28','KEVINN',_binary ''),(4629,23,NULL,'2026-04-30 16:38:56','Ingreso','192.168.1.28','KEVINN',_binary ''),(4630,23,NULL,'2026-04-30 16:50:41','Ingreso','192.168.1.28','KEVINN',_binary ''),(4631,23,NULL,'2026-04-30 16:57:34','Ingreso','192.168.1.28','KEVINN',_binary ''),(4632,23,710,'2026-04-30 16:58:25','InsertÃ³ un nuevo registro en la tabla \'Tbl_Estado_Orden_Recibida\' con llave: 2','192.168.1.28','KEVINN',_binary ''),(4633,23,710,'2026-04-30 16:58:54','InsertÃ³ un nuevo registro en la tabla \'Tbl_Estado_Orden_Recibida\' con llave: 3','192.168.1.28','KEVINN',_binary ''),(4634,23,710,'2026-04-30 16:59:27','InsertÃ³ un nuevo registro en la tabla \'Tbl_Estado_Orden_Recibida\' con llave: 4','192.168.1.28','KEVINN',_binary ''),(4635,23,NULL,'2026-04-30 17:56:26','Ingreso','192.168.1.28','KEVINN',_binary ''),(4636,23,NULL,'2026-04-30 19:22:14','Ingreso','192.168.1.28','KEVINN',_binary ''),(4637,23,NULL,'2026-04-30 19:59:18','Ingreso','192.168.1.28','KEVINN',_binary ''),(4638,23,NULL,'2026-04-30 20:36:16','Ingreso','192.168.1.28','KEVINN',_binary ''),(4639,23,NULL,'2026-05-03 15:52:53','Ingreso','192.168.1.28','KEVINN',_binary ''),(4640,23,NULL,'2026-05-03 16:09:38','Ingreso','192.168.1.28','KEVINN',_binary ''),(4641,23,NULL,'2026-05-03 16:10:32','Ingreso','192.168.1.28','KEVINN',_binary ''),(4642,23,NULL,'2026-05-03 16:12:29','Ingreso','192.168.1.28','KEVINN',_binary ''),(4643,23,NULL,'2026-05-03 16:21:28','Ingreso','192.168.1.28','KEVINN',_binary ''),(4644,23,NULL,'2026-05-03 17:18:12','Ingreso','192.168.1.28','KEVINN',_binary ''),(4645,23,NULL,'2026-05-03 18:37:28','Ingreso','192.168.1.28','KEVINN',_binary ''),(4646,23,NULL,'2026-05-04 08:01:54','Ingreso','192.168.167.215','KEVINN',_binary ''),(4647,23,NULL,'2026-05-05 07:37:01','Ingreso','192.168.167.215','KEVINN',_binary ''),(4648,23,NULL,'2026-05-05 07:57:05','Ingreso','192.168.167.215','KEVINN',_binary ''),(4649,23,NULL,'2026-05-05 08:55:46','Ingreso','192.168.167.215','KEVINN',_binary ''),(4650,23,NULL,'2026-05-07 07:13:08','Ingreso','10.86.58.41','KEVINN',_binary ''),(4651,23,NULL,'2026-05-07 07:15:06','Ingreso','10.86.58.41','KEVINN',_binary ''),(4652,23,NULL,'2026-05-07 07:19:35','Ingreso','10.86.58.41','KEVINN',_binary ''),(4653,23,NULL,'2026-05-07 07:48:57','Ingreso','10.86.58.41','KEVINN',_binary ''),(4654,23,NULL,'2026-05-07 08:00:43','Ingreso','10.86.58.41','KEVINN',_binary ''),(4655,23,NULL,'2026-05-07 08:07:53','Ingreso','10.86.58.41','KEVINN',_binary ''),(4656,23,NULL,'2026-05-07 08:22:36','Ingreso','10.86.58.41','KEVINN',_binary ''),(4657,23,NULL,'2026-05-07 08:23:52','Ingreso','10.86.58.41','KEVINN',_binary ''),(4658,23,NULL,'2026-05-07 08:28:21','Ingreso','10.86.58.41','KEVINN',_binary ''),(4659,23,NULL,'2026-05-07 08:43:28','Ingreso','10.86.58.41','KEVINN',_binary ''),(4660,23,NULL,'2026-05-07 09:01:37','Ingreso','10.86.58.41','KEVINN',_binary ''),(4661,23,731,'2026-05-07 09:03:48','RegistrÃ³ una nueva orden recibida con ID externo \'ORD-010\'','10.86.58.41','KEVINN',_binary ''),(4662,23,731,'2026-05-07 09:04:58','RegistrÃ³ una nueva orden recibida con ID externo \'ORD-011\'','10.86.58.41','KEVINN',_binary ''),(4663,23,NULL,'2026-05-07 09:36:46','Ingreso','10.86.58.41','KEVINN',_binary ''),(4664,23,704,'2026-05-07 09:38:41','InsertÃ³ un nuevo registro en la tabla \'Tbl_Materiales\' con llave: 7','10.86.58.41','KEVINN',_binary ''),(4665,23,731,'2026-05-07 09:44:50','RegistrÃ³ una nueva orden recibida con ID externo \'ORD-012\'','10.86.58.41','KEVINN',_binary ''),(4666,23,NULL,'2026-05-07 14:28:18','Ingreso','192.168.1.28','KEVINN',_binary ''),(4667,23,NULL,'2026-05-09 17:10:02','Ingreso','192.168.1.28','KEVINN',_binary ''),(4668,23,709,'2026-05-09 17:11:44','InsertÃ³ un nuevo registro en la tabla \'Tbl_Estado_Orden_Produccion\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4669,23,NULL,'2026-05-09 17:20:41','Ingreso','192.168.1.28','KEVINN',_binary ''),(4670,23,708,'2026-05-09 17:21:11','InsertÃ³ un nuevo registro en la tabla \'Tbl_Estado_Plan_Produccion\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4671,23,NULL,'2026-05-09 18:07:21','Ingreso','192.168.1.28','KEVINN',_binary ''),(4672,23,708,'2026-05-09 19:56:47','InsertÃ³ un nuevo registro en la tabla \'Tbl_Tipo_Costo_Fase\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4673,23,NULL,'2026-05-09 19:57:37','Ingreso','192.168.1.28','KEVINN',_binary ''),(4674,23,703,'2026-05-09 20:03:51','InsertÃ³ un nuevo registro en la tabla \'Tbl_Almacen\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4675,23,703,'2026-05-09 20:04:14','InsertÃ³ un nuevo registro en la tabla \'Tbl_Almacen\' con llave: 2','192.168.1.28','KEVINN',_binary ''),(4676,23,711,'2026-05-09 20:06:13','InsertÃ³ un nuevo registro en la tabla \'Tbl_Estado_Recepcion_Material\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4677,23,711,'2026-05-09 20:06:40','InsertÃ³ un nuevo registro en la tabla \'Tbl_Estado_Recepcion_Material\' con llave: 2','192.168.1.28','KEVINN',_binary ''),(4678,23,712,'2026-05-09 20:20:40','InsertÃ³ un nuevo registro en la tabla \'Tbl_Tipo_Inventario\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4679,23,NULL,'2026-05-09 21:02:02','Ingreso','192.168.1.28','KEVINN',_binary ''),(4680,23,NULL,'2026-05-09 21:07:09','Ingreso','192.168.1.28','KEVINN',_binary ''),(4681,23,NULL,'2026-05-09 21:09:42','Ingreso','192.168.1.28','KEVINN',_binary ''),(4682,23,NULL,'2026-05-09 21:11:32','Ingreso','192.168.1.28','KEVINN',_binary ''),(4683,23,NULL,'2026-05-09 21:12:26','Ingreso','192.168.1.28','KEVINN',_binary ''),(4684,23,NULL,'2026-05-09 21:14:18','Ingreso','192.168.1.28','KEVINN',_binary ''),(4685,23,NULL,'2026-05-09 21:15:52','Ingreso','192.168.1.28','KEVINN',_binary ''),(4686,23,NULL,'2026-05-09 21:17:03','Ingreso','192.168.1.28','KEVINN',_binary ''),(4687,23,NULL,'2026-05-09 21:18:18','Ingreso','192.168.1.28','KEVINN',_binary ''),(4688,23,NULL,'2026-05-09 21:21:20','Ingreso','192.168.1.28','KEVINN',_binary ''),(4689,23,NULL,'2026-05-09 21:22:56','Ingreso','192.168.1.28','KEVINN',_binary ''),(4690,23,NULL,'2026-05-09 21:25:06','Ingreso','192.168.1.28','KEVINN',_binary ''),(4691,23,NULL,'2026-05-09 21:27:21','Ingreso','192.168.1.28','KEVINN',_binary ''),(4692,23,NULL,'2026-05-09 21:32:08','Ingreso','192.168.1.28','KEVINN',_binary ''),(4693,23,NULL,'2026-05-09 22:07:28','Ingreso','192.168.1.28','KEVINN',_binary ''),(4694,23,NULL,'2026-05-09 22:08:05','Ingreso','192.168.1.28','KEVINN',_binary ''),(4695,23,NULL,'2026-05-09 22:26:11','Ingreso','192.168.1.28','KEVINN',_binary ''),(4696,23,NULL,'2026-05-09 22:33:52','Ingreso','192.168.1.28','KEVINN',_binary ''),(4697,23,NULL,'2026-05-09 22:35:51','Ingreso','192.168.1.28','KEVINN',_binary ''),(4698,23,NULL,'2026-05-09 22:37:38','Ingreso','192.168.1.28','KEVINN',_binary ''),(4699,23,NULL,'2026-05-09 22:40:41','Ingreso','192.168.1.28','KEVINN',_binary ''),(4700,23,NULL,'2026-05-09 22:42:46','Ingreso','192.168.1.28','KEVINN',_binary ''),(4701,23,NULL,'2026-05-10 09:02:01','Ingreso','192.168.1.28','KEVINN',_binary ''),(4702,23,NULL,'2026-05-10 09:15:35','Ingreso','192.168.1.28','KEVINN',_binary ''),(4703,23,NULL,'2026-05-10 16:23:52','Ingreso','192.168.1.28','KEVINN',_binary ''),(4704,23,NULL,'2026-05-10 16:26:16','Cierre de sesiÃ³n','192.168.1.28','KEVINN',_binary '\0'),(4705,23,NULL,'2026-05-10 19:54:32','Ingreso','192.168.1.28','KEVINN',_binary ''),(4706,23,725,'2026-05-10 19:56:06','InsertÃ³ un nuevo registro en la tabla \'Tbl_Tipo_Merma\' con llave: 1','192.168.1.28','KEVINN',_binary ''),(4707,23,725,'2026-05-10 19:56:23','InsertÃ³ un nuevo registro en la tabla \'Tbl_Tipo_Merma\' con llave: 2','192.168.1.28','KEVINN',_binary ''),(4708,23,704,'2026-05-10 20:01:39','InsertÃ³ un nuevo registro en la tabla \'Tbl_Materiales\' con llave: 8','192.168.1.28','KEVINN',_binary ''),(4709,23,704,'2026-05-10 20:04:07','Actualizo un registro en la tabla \'Tbl_Materiales\' Con la llave \'8\' ','192.168.1.28','KEVINN',_binary ''),(4710,23,701,'2026-05-10 20:10:15','InsertÃ³ un nuevo registro en la tabla \'Tbl_Categoria_Material\' con llave: 7','192.168.1.28','KEVINN',_binary ''),(4711,23,704,'2026-05-10 20:11:28','InsertÃ³ un nuevo registro en la tabla \'Tbl_Materiales\' con llave: 9','192.168.1.28','KEVINN',_binary ''),(4712,23,702,'2026-05-10 20:13:22','InsertÃ³ un nuevo registro en la tabla \'Tbl_Unidad_Medida\' con llave: 6','192.168.1.28','KEVINN',_binary ''),(4713,23,704,'2026-05-10 20:14:01','InsertÃ³ un nuevo registro en la tabla \'Tbl_Materiales\' con llave: 10','192.168.1.28','KEVINN',_binary ''),(4714,23,NULL,'2026-05-10 20:15:05','Ingreso','192.168.1.28','KEVINN',_binary ''),(4715,23,302,'2026-05-10 20:15:54','InsertÃ³ un nuevo usuario: UserApi','192.168.1.28','KEVINN',_binary ''),(4716,23,306,'2026-05-10 20:16:44','Al usuario \'\'UserApi\'\' se le asignaron permisos en la aplicaciÃ³n \'\'Orden Recibida\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.1.28','KEVINN',_binary ''),(4717,23,1,'2026-05-10 20:17:36','Se asignÃ³ el perfil \'Administrador\' al usuario \'UserApi\'','192.168.1.28','KEVINN',_binary ''),(4718,23,NULL,'2026-05-10 21:02:13','Cierre de sesiÃ³n','192.168.1.28','KEVINN',_binary '\0'),(4719,23,NULL,'2026-05-10 21:08:05','Ingreso','192.168.1.28','KEVINN',_binary ''),(4720,23,NULL,'2026-05-10 22:02:33','Ingreso','192.168.1.28','KEVINN',_binary ''),(4721,23,NULL,'2026-05-11 20:19:15','Ingreso','192.168.1.28','KEVINN',_binary ''),(4722,23,NULL,'2026-05-12 08:50:00','Ingreso','192.168.167.215','KEVINN',_binary ''),(4723,23,NULL,'2026-05-12 18:48:58','Ingreso','192.168.1.28','KEVINN',_binary ''),(4724,23,NULL,'2026-05-15 16:43:27','Ingreso','192.168.1.28','KEVINN',_binary ''),(4725,23,731,'2026-05-15 16:52:52','RegistrÃ³ una nueva orden recibida con ID externo \'ORD-013\'','192.168.1.28','KEVINN',_binary ''),(4726,23,NULL,'2026-05-15 18:00:05','Ingreso','192.168.1.28','KEVINN',_binary ''),(4727,23,NULL,'2026-05-15 18:09:53','Ingreso','192.168.1.28','KEVINN',_binary ''),(4728,23,NULL,'2026-05-15 18:14:35','Ingreso','192.168.1.28','KEVINN',_binary ''),(4729,23,NULL,'2026-05-15 19:34:34','Ingreso','192.168.1.28','KEVINN',_binary ''),(4730,23,731,'2026-05-15 19:37:57','RegistrÃ³ una nueva orden recibida con ID externo \'ORD-014\'','192.168.1.28','KEVINN',_binary ''),(4731,23,NULL,'2026-05-15 20:04:03','Ingreso','192.168.1.28','KEVINN',_binary ''),(4732,23,NULL,'2026-05-15 20:12:41','Ingreso','192.168.1.28','KEVINN',_binary ''),(4733,23,NULL,'2026-05-15 20:14:27','Ingreso','192.168.1.28','KEVINN',_binary ''),(4734,23,NULL,'2026-05-15 20:18:37','Ingreso','192.168.1.28','KEVINN',_binary ''),(4735,23,NULL,'2026-05-15 20:26:14','Ingreso','192.168.1.28','KEVINN',_binary ''),(4736,23,NULL,'2026-05-15 20:32:21','Ingreso','192.168.1.28','KEVINN',_binary ''),(4737,23,NULL,'2026-05-15 20:41:45','Ingreso','192.168.1.28','KEVINN',_binary ''),(4738,23,NULL,'2026-05-15 21:07:14','Ingreso','192.168.1.28','KEVINN',_binary ''),(4739,23,NULL,'2026-05-15 22:03:16','Ingreso','192.168.1.28','KEVINN',_binary ''),(4740,23,NULL,'2026-05-15 22:04:08','Ingreso','192.168.1.28','KEVINN',_binary ''),(4741,23,NULL,'2026-05-15 22:07:31','Ingreso','192.168.1.28','KEVINN',_binary ''),(4742,23,NULL,'2026-05-15 22:13:13','Ingreso','192.168.1.28','KEVINN',_binary ''),(4743,23,NULL,'2026-05-15 22:16:20','Ingreso','192.168.1.28','KEVINN',_binary ''),(4744,23,NULL,'2026-05-15 22:17:44','Ingreso','192.168.1.28','KEVINN',_binary ''),(4745,23,NULL,'2026-05-15 22:21:09','Ingreso','192.168.1.28','KEVINN',_binary ''),(4746,23,NULL,'2026-05-15 22:50:07','Ingreso','192.168.1.28','KEVINN',_binary ''),(4747,23,NULL,'2026-05-15 22:51:24','Ingreso','192.168.1.28','KEVINN',_binary ''),(4748,23,NULL,'2026-05-15 22:53:14','Ingreso','192.168.1.28','KEVINN',_binary ''),(4749,23,NULL,'2026-05-15 22:55:32','Ingreso','192.168.1.28','KEVINN',_binary ''),(4750,23,NULL,'2026-05-15 22:57:28','Ingreso','192.168.1.28','KEVINN',_binary ''),(4751,23,NULL,'2026-05-15 22:58:59','Ingreso','192.168.1.28','KEVINN',_binary ''),(4752,23,NULL,'2026-05-17 17:03:26','Ingreso','192.168.1.28','KEVINN',_binary ''),(4753,23,NULL,'2026-05-17 17:25:27','Ingreso','192.168.1.28','KEVINN',_binary ''),(4754,23,731,'2026-05-17 17:26:32','EliminÃ³ la orden recibida con ID interno \'10\'','192.168.1.28','KEVINN',_binary ''),(4755,23,731,'2026-05-17 17:26:57','EliminÃ³ la orden recibida con ID interno \'5\'','192.168.1.28','KEVINN',_binary ''),(4756,23,731,'2026-05-17 19:14:46','RegistrÃ³ una nueva orden recibida con ID externo \'ORD-015\'','192.168.1.28','KEVINN',_binary ''),(4757,23,731,'2026-05-17 19:18:27','RegistrÃ³ una nueva orden recibida con ID externo \'ORD-016\'','192.168.1.28','KEVINN',_binary ''),(4758,23,NULL,'2026-05-17 19:43:51','Ingreso','192.168.1.28','KEVINN',_binary ''),(4759,23,NULL,'2026-05-17 20:26:24','Ingreso','192.168.1.28','KEVINN',_binary ''),(4760,23,NULL,'2026-05-17 21:28:21','Ingreso','192.168.1.28','KEVINN',_binary ''),(4761,69,NULL,'2026-05-18 15:18:15','Ingreso','192.168.2.21','KEVINN',_binary ''),(4762,23,NULL,'2026-05-18 15:33:27','Ingreso','192.168.1.28','KEVINN',_binary ''),(4763,23,NULL,'2026-05-18 16:01:23','Ingreso','192.168.1.28','KEVINN',_binary ''),(4764,23,NULL,'2026-05-18 16:04:27','Ingreso','192.168.1.28','KEVINN',_binary ''),(4765,23,NULL,'2026-05-18 16:09:39','Ingreso','192.168.1.28','KEVINN',_binary ''),(4766,23,NULL,'2026-05-18 16:12:56','Ingreso','192.168.1.28','KEVINN',_binary ''),(4767,23,NULL,'2026-05-18 16:15:01','Ingreso','192.168.1.28','KEVINN',_binary ''),(4768,23,NULL,'2026-05-18 16:18:47','Ingreso','192.168.1.28','KEVINN',_binary ''),(4769,23,NULL,'2026-05-18 16:20:15','Ingreso','192.168.1.28','KEVINN',_binary ''),(4770,23,NULL,'2026-05-18 16:22:09','Ingreso','192.168.1.28','KEVINN',_binary ''),(4771,23,NULL,'2026-05-18 16:26:47','Ingreso','192.168.1.28','KEVINN',_binary ''),(4772,23,NULL,'2026-05-18 16:30:10','Ingreso','192.168.1.28','KEVINN',_binary ''),(4773,23,NULL,'2026-05-18 16:37:20','Ingreso','192.168.1.28','KEVINN',_binary ''),(4774,23,NULL,'2026-05-18 16:39:41','Ingreso','192.168.1.28','KEVINN',_binary ''),(4775,23,NULL,'2026-05-18 16:41:49','Ingreso','192.168.1.28','KEVINN',_binary ''),(4776,23,NULL,'2026-05-18 16:44:51','Ingreso','192.168.1.28','KEVINN',_binary ''),(4777,23,NULL,'2026-05-18 16:47:58','Ingreso','192.168.1.28','KEVINN',_binary ''),(4778,23,NULL,'2026-05-18 16:50:12','Ingreso','192.168.1.28','KEVINN',_binary ''),(4779,23,NULL,'2026-05-18 17:18:53','Ingreso','192.168.1.28','KEVINN',_binary ''),(4780,4,NULL,'2026-05-18 17:42:17','Ingreso','192.168.1.28','KEVINN',_binary ''),(4781,23,NULL,'2026-05-18 17:50:01','Ingreso','192.168.1.28','KEVINN',_binary ''),(4782,23,NULL,'2026-05-18 20:30:08','Ingreso','192.168.1.28','KEVINN',_binary ''),(4783,23,NULL,'2026-05-18 22:04:19','Ingreso','192.168.1.28','KEVINN',_binary ''),(4784,23,NULL,'2026-05-18 22:07:01','Ingreso','192.168.1.28','KEVINN',_binary ''),(4785,23,NULL,'2026-05-18 22:09:09','Ingreso','192.168.1.28','KEVINN',_binary ''),(4786,23,NULL,'2026-05-18 22:17:57','Ingreso','192.168.1.28','KEVINN',_binary ''),(4787,23,NULL,'2026-05-18 22:19:39','Ingreso','192.168.1.28','KEVINN',_binary ''),(4788,23,NULL,'2026-05-19 07:45:56','Ingreso','192.168.167.215','KEVINN',_binary ''),(4789,23,NULL,'2026-05-19 07:51:31','Ingreso','192.168.167.215','KEVINN',_binary ''),(4790,23,NULL,'2026-05-19 17:17:07','Ingreso','192.168.1.28','KEVINN',_binary ''),(4791,23,NULL,'2026-05-19 17:29:47','Ingreso','192.168.1.28','KEVINN',_binary ''),(4792,23,704,'2026-05-19 17:31:42','InsertÃ³ un nuevo registro en la tabla \'tbl_materiales\' con llave: 11','192.168.1.28','KEVINN',_binary ''),(4793,23,NULL,'2026-05-19 17:37:45','Ingreso','192.168.1.28','KEVINN',_binary ''),(4794,23,704,'2026-05-19 17:38:01','EliminÃ³ un registro en la tabla \'tbl_materiales\' Con la llave \'11\' ','192.168.1.28','KEVINN',_binary ''),(4795,23,NULL,'2026-05-19 18:02:53','Ingreso','192.168.1.28','KEVINN',_binary ''),(4796,23,731,'2026-05-19 18:05:39','RegistrÃ³ una nueva orden recibida con ID externo \'ORD-017\'','192.168.1.28','KEVINN',_binary ''),(4797,23,740,'2026-05-19 18:09:29','RegistrÃ³ costo de fase para la fase \'7\' con tipo de costo \'1\' y monto \'100\'','192.168.1.28','KEVINN',_binary ''),(4798,23,740,'2026-05-19 18:09:30','Costo Fase guardado','192.168.1.28','KEVINN',_binary ''),(4799,23,734,'2026-05-19 18:10:59','GenerÃ³ una explosiÃ³n de materiales para la orden \'17\'','192.168.1.28','KEVINN',_binary ''),(4800,23,735,'2026-05-19 18:10:59','RegistrÃ³ detalle de materiales para la explosiÃ³n \'9\'','192.168.1.28','KEVINN',_binary ''),(4801,23,732,'2026-05-19 18:12:57','GenerÃ³ la orden de material \'1\' desde la orden \'17\'','192.168.1.28','KEVINN',_binary ''),(4802,23,732,'2026-05-19 18:13:19','No se pudo enviar la orden de material \'1\' a LogÃ­stica por API. Motivo: No se pudo conectar con la API: Error al enviar la solicitud.','192.168.1.28','KEVINN',_binary '\0'),(4803,23,738,'2026-05-19 18:16:39','RegistrÃ³ encabezado de recepciÃ³n \'5\' con ID externo \'5\'','192.168.1.28','KEVINN',_binary ''),(4804,23,739,'2026-05-19 18:16:39','RegistrÃ³ detalle de recepciÃ³n \'5\' para material \'10\' con cantidad \'50\'','192.168.1.28','KEVINN',_binary ''),(4805,23,738,'2026-05-19 18:16:39','ActualizÃ³ inventario del material \'10\' en almacÃ©n \'1\' con cantidad \'50\' y costo \'7.50\'','192.168.1.28','KEVINN',_binary ''),(4806,23,715,'2026-05-19 18:16:40','Guardado de recepciÃ³n material','192.168.1.28','KEVINN',_binary ''),(4807,23,718,'2026-05-19 18:19:56','RegistrÃ³ un nuevo plan maestro \'7\' para el pedido \'17\'','192.168.1.28','KEVINN',_binary ''),(4808,23,718,'2026-05-19 18:19:56','Ingreso de nuevo plan de producciÃ³n','192.168.1.28','KEVINN',_binary ''),(4809,23,730,'2026-05-19 18:21:42','RegistrÃ³ cronograma de producciÃ³n para la orden \'10\'','192.168.1.28','KEVINN',_binary ''),(4810,23,718,'2026-05-19 18:21:44','Ingreso de Cronograma de fases de producciÃ³n','192.168.1.28','KEVINN',_binary ''),(4811,23,730,'2026-05-19 18:22:23','RegistrÃ³ cronograma de producciÃ³n para la orden \'11\'','192.168.1.28','KEVINN',_binary ''),(4812,23,718,'2026-05-19 18:22:24','Ingreso de Cronograma de fases de producciÃ³n','192.168.1.28','KEVINN',_binary ''),(4813,23,737,'2026-05-19 18:24:39','DescontÃ³ materiales de inventario para la orden de producciÃ³n \'10\'','192.168.1.28','KEVINN',_binary ''),(4814,23,737,'2026-05-19 18:25:31','RegistrÃ³ merma del material \'10\' en la orden \'10\' por cantidad \'10\'. Motivo: Tela sobrante','192.168.1.28','KEVINN',_binary ''),(4815,23,737,'2026-05-19 18:26:05','RegistrÃ³ merma del material \'9\' en la orden \'10\' por cantidad \'5\'. Motivo: Material sobrante','192.168.1.28','KEVINN',_binary ''),(4816,23,737,'2026-05-19 18:26:50','RegistrÃ³ costo indirecto \'Agua\' por Q75 en la orden de producciÃ³n \'10\'','192.168.1.28','KEVINN',_binary ''),(4817,23,737,'2026-05-19 18:27:07','RegistrÃ³ costo indirecto \'Electricidad\' por Q50 en la orden de producciÃ³n \'10\'','192.168.1.28','KEVINN',_binary ''),(4818,23,737,'2026-05-19 18:27:32','RegistrÃ³ mano de obra del empleado \'2\' en la orden de producciÃ³n \'10\'','192.168.1.28','KEVINN',_binary ''),(4819,23,737,'2026-05-19 18:28:11','DescontÃ³ materiales de inventario para la orden de producciÃ³n \'11\'','192.168.1.28','KEVINN',_binary ''),(4820,23,737,'2026-05-19 18:28:29','RegistrÃ³ costo indirecto \'Agua\' por Q55 en la orden de producciÃ³n \'11\'','192.168.1.28','KEVINN',_binary ''),(4821,23,737,'2026-05-19 18:28:38','RegistrÃ³ mano de obra del empleado \'3\' en la orden de producciÃ³n \'11\'','192.168.1.28','KEVINN',_binary '');
/*!40000 ALTER TABLE `tbl_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bloqueo_usuario`
--

DROP TABLE IF EXISTS `tbl_bloqueo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bloqueo_usuario` (
  `Pk_Id_Bloqueo` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Usuario` int DEFAULT NULL,
  `Fk_Id_Bitacora` int DEFAULT NULL,
  `Cmp_Fecha_Inicio_Bloqueo_Usuario` datetime DEFAULT NULL,
  `Cmp_Fecha_Fin_Bloqueo_Usuario` datetime DEFAULT NULL,
  `Cmp_Motivo__Bloqueo_Usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Bloqueo`),
  KEY `Fk_Bloqueo_Usuario` (`Fk_Id_Usuario`),
  KEY `Fk_Bloqueo_Bitacora` (`Fk_Id_Bitacora`),
  CONSTRAINT `Fk_Bloqueo_Bitacora` FOREIGN KEY (`Fk_Id_Bitacora`) REFERENCES `tbl_bitacora` (`Pk_Id_Bitacora`),
  CONSTRAINT `Fk_Bloqueo_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bloqueo_usuario`
--

LOCK TABLES `tbl_bloqueo_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_bloqueo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bloqueo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bom`
--

DROP TABLE IF EXISTS `tbl_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bom` (
  `Pk_Id_BOM` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Material` int NOT NULL,
  `Fk_Id_Estado_BOM` int NOT NULL,
  `Version_BOM` varchar(20) NOT NULL,
  `Descripcion_BOM` varchar(255) NOT NULL,
  `Fecha_Creacion_BOM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_BOM`),
  UNIQUE KEY `uq_bom_material_version` (`Fk_Id_Material`,`Version_BOM`),
  KEY `fk_bom_estado` (`Fk_Id_Estado_BOM`),
  CONSTRAINT `fk_bom_estado` FOREIGN KEY (`Fk_Id_Estado_BOM`) REFERENCES `tbl_estado_bom` (`Pk_Id_Estado_BOM`),
  CONSTRAINT `fk_bom_material` FOREIGN KEY (`Fk_Id_Material`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bom`
--

LOCK TABLES `tbl_bom` WRITE;
/*!40000 ALTER TABLE `tbl_bom` DISABLE KEYS */;
INSERT INTO `tbl_bom` VALUES (5,2,1,'3','Prueba de receta','2026-05-03 19:22:24'),(6,2,1,'v5','Bicicleta para deporte','2026-05-03 23:31:10'),(7,2,1,'V4','Bicicleta BMX','2026-05-05 14:58:39'),(8,7,1,'V1','Escritorio de madera','2026-05-07 15:38:49'),(9,8,1,'V1','Cama Matrimonial de madera y algodÃ³n','2026-05-11 02:21:27');
/*!40000 ALTER TABLE `tbl_bom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bom_detalle`
--

DROP TABLE IF EXISTS `tbl_bom_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bom_detalle` (
  `Pk_Id_BOM_Detalle` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_BOM` int NOT NULL,
  `Fk_Id_Materiales` int NOT NULL,
  `Fk_Id_Unidad_Medida` int NOT NULL,
  `Cantidad_Requerida_BOM_Detalle` decimal(12,4) NOT NULL,
  `Porcentaje_Merma_BOM_Detalle` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Pk_Id_BOM_Detalle`),
  UNIQUE KEY `uq_bom_material` (`Fk_Id_BOM`,`Fk_Id_Materiales`),
  KEY `fk_bom_detalle_material` (`Fk_Id_Materiales`),
  KEY `fk_bom_detalle_unidad` (`Fk_Id_Unidad_Medida`),
  CONSTRAINT `fk_bom_detalle_bom` FOREIGN KEY (`Fk_Id_BOM`) REFERENCES `tbl_bom` (`Pk_Id_BOM`),
  CONSTRAINT `fk_bom_detalle_material` FOREIGN KEY (`Fk_Id_Materiales`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`),
  CONSTRAINT `fk_bom_detalle_unidad` FOREIGN KEY (`Fk_Id_Unidad_Medida`) REFERENCES `tbl_unidad_medida` (`Pk_Id_Unidad_Medida`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bom_detalle`
--

LOCK TABLES `tbl_bom_detalle` WRITE;
/*!40000 ALTER TABLE `tbl_bom_detalle` DISABLE KEYS */;
INSERT INTO `tbl_bom_detalle` VALUES (4,5,1,1,10.0000,0.00),(5,5,3,1,4.0000,0.00),(6,6,1,1,5.0000,0.00),(7,6,3,3,4.0000,0.00),(8,6,5,5,1.0000,0.00),(9,7,1,1,11.0000,0.00),(10,7,5,5,1.0000,0.00),(11,7,3,3,2.0000,0.00),(12,8,3,2,20.0000,0.00),(13,8,5,5,2.0000,0.00),(14,8,1,1,10.0000,0.00),(15,9,3,3,10.0000,0.00),(16,9,9,3,30.0000,0.00),(17,9,10,6,7.0000,0.00),(18,9,5,5,2.0000,0.00);
/*!40000 ALTER TABLE `tbl_bom_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_categoria_material`
--

DROP TABLE IF EXISTS `tbl_categoria_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categoria_material` (
  `Pk_Id_Categoria_Material` int NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria_Material` varchar(100) NOT NULL,
  `Fk_Tipo_Material` int NOT NULL,
  PRIMARY KEY (`Pk_Id_Categoria_Material`),
  UNIQUE KEY `Nombre_Categoria_Material` (`Nombre_Categoria_Material`),
  KEY `fk_categoria_tipo_material` (`Fk_Tipo_Material`),
  CONSTRAINT `fk_categoria_tipo_material` FOREIGN KEY (`Fk_Tipo_Material`) REFERENCES `tbl_tipo_material` (`Pk_Id_Tipo_Material`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria_material`
--

LOCK TABLES `tbl_categoria_material` WRITE;
/*!40000 ALTER TABLE `tbl_categoria_material` DISABLE KEYS */;
INSERT INTO `tbl_categoria_material` VALUES (1,'Metales',1),(2,'VehÃ­culo',2),(3,'Madera',1),(4,'Pegamentos',1),(5,'Barnices',1),(6,'Muebles',2),(7,'Costura y SastrerÃ­a',1);
/*!40000 ALTER TABLE `tbl_categoria_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_codigo_barras_material`
--

DROP TABLE IF EXISTS `tbl_codigo_barras_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_codigo_barras_material` (
  `Pk_Id_Codigo_Barras` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Materiales` int NOT NULL,
  `Codigo_Barras` varchar(100) NOT NULL,
  `Tipo_Codigo_Barras` varchar(50) NOT NULL,
  `Imagen_Codigo_Barras` longblob NOT NULL,
  PRIMARY KEY (`Pk_Id_Codigo_Barras`),
  KEY `Fk_Id_Materiales` (`Fk_Id_Materiales`),
  CONSTRAINT `tbl_codigo_barras_material_ibfk_1` FOREIGN KEY (`Fk_Id_Materiales`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_codigo_barras_material`
--

LOCK TABLES `tbl_codigo_barras_material` WRITE;
/*!40000 ALTER TABLE `tbl_codigo_barras_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_codigo_barras_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_costo_fase`
--

DROP TABLE IF EXISTS `tbl_costo_fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_costo_fase` (
  `Pk_Id_Costo_Fase` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Fase_Producto` int NOT NULL,
  `Fk_Id_Tipo_Costo_Fase` int NOT NULL,
  `Costo` decimal(12,4) NOT NULL,
  PRIMARY KEY (`Pk_Id_Costo_Fase`),
  KEY `fk_costo_fase` (`Fk_Id_Fase_Producto`),
  KEY `fk_tipo_costo_fase` (`Fk_Id_Tipo_Costo_Fase`),
  CONSTRAINT `fk_costo_fase` FOREIGN KEY (`Fk_Id_Fase_Producto`) REFERENCES `tbl_fases_produccion` (`Pk_Id_Fase_Producto`),
  CONSTRAINT `fk_tipo_costo_fase` FOREIGN KEY (`Fk_Id_Tipo_Costo_Fase`) REFERENCES `tbl_tipo_costo_fase` (`Pk_Id_Tipo_Costo_Fase`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_costo_fase`
--

LOCK TABLES `tbl_costo_fase` WRITE;
/*!40000 ALTER TABLE `tbl_costo_fase` DISABLE KEYS */;
INSERT INTO `tbl_costo_fase` VALUES (1,1,1,150.0000),(3,8,1,300.0000),(4,12,1,325.0000),(5,13,1,250.0000),(6,7,1,100.0000);
/*!40000 ALTER TABLE `tbl_costo_fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_costo_indirecto_produccion`
--

DROP TABLE IF EXISTS `tbl_costo_indirecto_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_costo_indirecto_produccion` (
  `Pk_Id_Costo_Indirecto_Produccion` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Produccion` int NOT NULL,
  `Concepto_Costo_Indirecto_Produccion` varchar(100) NOT NULL,
  `Monto_Costo_Indirecto_Produccion` decimal(12,4) NOT NULL,
  `Descripcion_Costo_Indirecto_Produccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Costo_Indirecto_Produccion`),
  KEY `fk_costo_indirecto_orden` (`Fk_Id_Orden_Produccion`),
  CONSTRAINT `fk_costo_indirecto_orden` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_orden_produccion` (`Pk_Id_Orden_Produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_costo_indirecto_produccion`
--

LOCK TABLES `tbl_costo_indirecto_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_costo_indirecto_produccion` DISABLE KEYS */;
INSERT INTO `tbl_costo_indirecto_produccion` VALUES (2,1,'Agua',100.0000,'Agua'),(3,1,'Mantenimiento de maquinaria',100.0000,'Mantenimiento'),(5,1,'Gas',95.0000,'Gas'),(6,1,'Electricidad',100.0000,'EnergÃ­a electrica'),(7,4,'Agua',100.0000,'Agua para tratar la madera'),(8,4,'Electricidad',100.0000,'EnergÃ­a elÃ©ctrica para funcionamiento de maquinaria'),(9,5,'Agua',100.0000,'.'),(10,5,'Electricidad',75.0000,'.'),(11,6,'Electricidad',100.0000,'.'),(12,7,'Electricidad',55.0000,'EnergÃ­a para maquinaria'),(13,8,'Electricidad',85.0000,'.'),(14,9,'Agua',75.0000,'.'),(15,10,'Agua',75.0000,'Consumo de agua para fabricacion'),(16,10,'Electricidad',50.0000,'.'),(17,11,'Agua',55.0000,'Prueba final');
/*!40000 ALTER TABLE `tbl_costo_indirecto_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_costo_produccion`
--

DROP TABLE IF EXISTS `tbl_costo_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_costo_produccion` (
  `Pk_Id_Costo_Produccion` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Produccion` int NOT NULL,
  `Costo_Material_Costo_Produccion` decimal(12,4) NOT NULL,
  `Costo_Mano_Obra_Costo_Produccion` decimal(12,4) NOT NULL,
  `Costo_Indirecto_Costo_Produccion` decimal(12,4) NOT NULL,
  `Costo_Total_Costo_Produccion` decimal(12,4) NOT NULL,
  `Costo_Unitario_Costo_Produccion` decimal(12,4) NOT NULL,
  PRIMARY KEY (`Pk_Id_Costo_Produccion`),
  UNIQUE KEY `Fk_Id_Orden_Produccion` (`Fk_Id_Orden_Produccion`),
  CONSTRAINT `fk_costo_produccion_orden` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_orden_produccion` (`Pk_Id_Orden_Produccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_costo_produccion`
--

LOCK TABLES `tbl_costo_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_costo_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_costo_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cronograma_fases_produccion`
--

DROP TABLE IF EXISTS `tbl_cronograma_fases_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cronograma_fases_produccion` (
  `Pk_Id_Cronograma_Fase` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Produccion` int NOT NULL,
  `Fk_Id_Fase_Producto` int NOT NULL,
  `Fecha_Inicio_Fase` date NOT NULL,
  `Fecha_Fin_Fase` date NOT NULL,
  `Horas_Hombres` int NOT NULL,
  `Fk_Id_Encargado` int NOT NULL,
  `Fk_Id_Estado_Fase` int NOT NULL,
  PRIMARY KEY (`Pk_Id_Cronograma_Fase`),
  KEY `Fk_Orden_Produccion` (`Fk_Id_Orden_Produccion`),
  KEY `Fk_Id_Fase_Producto` (`Fk_Id_Fase_Producto`),
  KEY `Fk_Id_Encargado` (`Fk_Id_Encargado`),
  KEY `fk_cronograma_estado_fase` (`Fk_Id_Estado_Fase`),
  CONSTRAINT `fk_cronograma_estado_fase` FOREIGN KEY (`Fk_Id_Estado_Fase`) REFERENCES `tbl_estado_fase_produccion` (`Pk_Id_Estado_Fase`),
  CONSTRAINT `Fk_Id_Encargado` FOREIGN KEY (`Fk_Id_Encargado`) REFERENCES `tbl_empleado` (`Pk_Id_Empleado`),
  CONSTRAINT `Fk_Id_Fase_Producto` FOREIGN KEY (`Fk_Id_Fase_Producto`) REFERENCES `tbl_fases_produccion` (`Pk_Id_Fase_Producto`),
  CONSTRAINT `Fk_Orden_Produccion` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_orden_produccion` (`Pk_Id_Orden_Produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cronograma_fases_produccion`
--

LOCK TABLES `tbl_cronograma_fases_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_cronograma_fases_produccion` DISABLE KEYS */;
INSERT INTO `tbl_cronograma_fases_produccion` VALUES (1,1,7,'2026-04-30','2026-05-01',2,2,1),(2,1,8,'2026-05-01','2026-05-02',2,2,1),(3,2,1,'2026-05-10','2026-05-12',3,2,1),(4,3,11,'2026-05-15','2026-05-17',2,3,1),(5,3,12,'2026-05-18','2026-05-19',2,3,1),(6,3,13,'2026-05-20','2026-05-21',2,2,1),(7,4,7,'2026-05-15','2026-05-16',2,2,1),(8,4,8,'2026-05-17','2026-05-18',2,3,1),(9,4,9,'2026-05-19','2026-05-20',2,3,1),(10,4,10,'2026-05-21','2026-05-22',2,3,1),(11,5,11,'2026-05-16','2026-05-17',3,2,1),(12,6,7,'2026-05-15','2026-05-17',2,2,1),(13,7,7,'2026-05-17','2026-05-19',2,2,1),(14,8,11,'2026-05-18','2026-05-20',3,2,1),(15,9,7,'2026-05-18','2026-05-20',2,2,1),(16,10,11,'2026-05-20','2026-05-22',2,2,1),(17,10,12,'2026-05-21','2026-05-23',2,2,1),(18,11,7,'2026-05-21','2026-05-25',2,2,1);
/*!40000 ALTER TABLE `tbl_cronograma_fases_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_orden_material`
--

DROP TABLE IF EXISTS `tbl_detalle_orden_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_orden_material` (
  `Pk_Id_Detalle_Orden_Material` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Material` int NOT NULL,
  `Fk_Id_Materiales` int NOT NULL,
  `Cantidad_Solicitada` decimal(10,2) NOT NULL,
  `Cantidad_Entregada` decimal(10,2) DEFAULT '0.00',
  `Cantidad_Pendiente` decimal(10,2) GENERATED ALWAYS AS ((`Cantidad_Solicitada` - `Cantidad_Entregada`)) STORED,
  PRIMARY KEY (`Pk_Id_Detalle_Orden_Material`),
  KEY `Fk_Id_Orden_Material` (`Fk_Id_Orden_Material`),
  KEY `Fk_Id_Materiales` (`Fk_Id_Materiales`),
  CONSTRAINT `tbl_detalle_orden_material_ibfk_1` FOREIGN KEY (`Fk_Id_Orden_Material`) REFERENCES `tbl_encabezado_orden_material` (`Pk_Id_Orden_Material`),
  CONSTRAINT `tbl_detalle_orden_material_ibfk_2` FOREIGN KEY (`Fk_Id_Materiales`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_orden_material`
--

LOCK TABLES `tbl_detalle_orden_material` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_orden_material` DISABLE KEYS */;
INSERT INTO `tbl_detalle_orden_material` (`Pk_Id_Detalle_Orden_Material`, `Fk_Id_Orden_Material`, `Fk_Id_Materiales`, `Cantidad_Solicitada`, `Cantidad_Entregada`) VALUES (1,1,10,6.00,0.00);
/*!40000 ALTER TABLE `tbl_detalle_orden_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleado`
--

DROP TABLE IF EXISTS `tbl_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_empleado` (
  `Pk_Id_Empleado` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombres_Empleado` varchar(50) DEFAULT NULL,
  `Cmp_Apellidos_Empleado` varchar(50) DEFAULT NULL,
  `Cmp_Dpi_Empleado` bigint DEFAULT NULL,
  `Cmp_Nit_Empleado` bigint DEFAULT NULL,
  `Cmp_Correo_Empleado` varchar(50) DEFAULT NULL,
  `Cmp_Telefono_Empleado` varchar(15) DEFAULT NULL,
  `Cmp_Genero_Empleado` varchar(10) DEFAULT NULL,
  `Cmp_Fecha_Nacimiento_Empleado` date DEFAULT NULL,
  `Cmp_Fecha_Contratacion__Empleado` date DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleado`
--

LOCK TABLES `tbl_empleado` WRITE;
/*!40000 ALTER TABLE `tbl_empleado` DISABLE KEYS */;
INSERT INTO `tbl_empleado` VALUES (2,'Juan','PÃ©rez LÃ³pez',1234567890101,9876542,'juan.perez@example.com','5555-1234','Masculino','1995-08-20','2025-09-21'),(3,'Juan','pruebas',1234,123,'@pruebas','1234','Masculino','2025-09-26','2025-09-26');
/*!40000 ALTER TABLE `tbl_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_encabezado_orden_material`
--

DROP TABLE IF EXISTS `tbl_encabezado_orden_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_encabezado_orden_material` (
  `Pk_Id_Orden_Material` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Recibida` int NOT NULL,
  `Fk_Id_Estado_Orden_Material` int NOT NULL DEFAULT '2',
  `Fecha_Solicitud` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Recibida` datetime DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Orden_Material`),
  KEY `Fk_Id_Orden_Recibida` (`Fk_Id_Orden_Recibida`),
  KEY `Fk_Id_Estado_Orden_Material` (`Fk_Id_Estado_Orden_Material`),
  CONSTRAINT `tbl_encabezado_orden_material_ibfk_1` FOREIGN KEY (`Fk_Id_Orden_Recibida`) REFERENCES `tbl_orden_recibida` (`Pk_Id_Orden_Recibida`),
  CONSTRAINT `tbl_encabezado_orden_material_ibfk_2` FOREIGN KEY (`Fk_Id_Estado_Orden_Material`) REFERENCES `tbl_tipo_estado_orden_material` (`Pk_Id_Estado_Orden_Material`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_encabezado_orden_material`
--

LOCK TABLES `tbl_encabezado_orden_material` WRITE;
/*!40000 ALTER TABLE `tbl_encabezado_orden_material` DISABLE KEYS */;
INSERT INTO `tbl_encabezado_orden_material` VALUES (1,17,2,'2026-05-19 18:12:57',NULL);
/*!40000 ALTER TABLE `tbl_encabezado_orden_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado_bom`
--

DROP TABLE IF EXISTS `tbl_estado_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado_bom` (
  `Pk_Id_Estado_BOM` int NOT NULL AUTO_INCREMENT,
  `Nombre_Estado_BOM` varchar(100) NOT NULL,
  `Descripcion_Estado_BOM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Estado_BOM`),
  UNIQUE KEY `Nombre_Estado_BOM` (`Nombre_Estado_BOM`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado_bom`
--

LOCK TABLES `tbl_estado_bom` WRITE;
/*!40000 ALTER TABLE `tbl_estado_bom` DISABLE KEYS */;
INSERT INTO `tbl_estado_bom` VALUES (1,'Activo','Receta activa '),(4,'Inactivo','BOM deshabilitado');
/*!40000 ALTER TABLE `tbl_estado_bom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado_fase_produccion`
--

DROP TABLE IF EXISTS `tbl_estado_fase_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado_fase_produccion` (
  `Pk_Id_Estado_Fase` int NOT NULL AUTO_INCREMENT,
  `Nombre_Estado_Fase` varchar(50) NOT NULL,
  `Descripcion_Estado_Fase` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Estado_Fase`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado_fase_produccion`
--

LOCK TABLES `tbl_estado_fase_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_estado_fase_produccion` DISABLE KEYS */;
INSERT INTO `tbl_estado_fase_produccion` VALUES (1,'Fase Iniciada','Se inicia la fase ');
/*!40000 ALTER TABLE `tbl_estado_fase_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado_orden_produccion`
--

DROP TABLE IF EXISTS `tbl_estado_orden_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado_orden_produccion` (
  `Pk_Id_Estado_Orden_Produccion` int NOT NULL AUTO_INCREMENT,
  `Nombre_Estado_Orden_Produccion` varchar(100) NOT NULL,
  `Descripcion_Estado_Orden_Produccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Estado_Orden_Produccion`),
  UNIQUE KEY `Nombre_Estado_Orden_Produccion` (`Nombre_Estado_Orden_Produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado_orden_produccion`
--

LOCK TABLES `tbl_estado_orden_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_estado_orden_produccion` DISABLE KEYS */;
INSERT INTO `tbl_estado_orden_produccion` VALUES (1,'En proceso','Producto en proceso de fabricaciÃ³n');
/*!40000 ALTER TABLE `tbl_estado_orden_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado_orden_recibida`
--

DROP TABLE IF EXISTS `tbl_estado_orden_recibida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado_orden_recibida` (
  `Pk_Id_Estado_Orden_Recibida` int NOT NULL AUTO_INCREMENT,
  `Nombre_Estado_Orden_Recibida` varchar(100) NOT NULL,
  `Descripcion_Estado_Orden_Recibida` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Estado_Orden_Recibida`),
  UNIQUE KEY `Nombre_Estado_Orden_Recibida` (`Nombre_Estado_Orden_Recibida`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado_orden_recibida`
--

LOCK TABLES `tbl_estado_orden_recibida` WRITE;
/*!40000 ALTER TABLE `tbl_estado_orden_recibida` DISABLE KEYS */;
INSERT INTO `tbl_estado_orden_recibida` VALUES (1,'Orden recibida','Orden de logÃ­stica recibida'),(2,'En proceso','Se estÃ¡ trabajando en la orden'),(3,'Completada','Se procesÃ³ exitosamente'),(4,'Cancelada','Se anulÃ³, ya no se procesarÃ¡');
/*!40000 ALTER TABLE `tbl_estado_orden_recibida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado_plan_produccion`
--

DROP TABLE IF EXISTS `tbl_estado_plan_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado_plan_produccion` (
  `Pk_Id_Estado_Plan_Produccion` int NOT NULL AUTO_INCREMENT,
  `Nombre_Estado_Plan_Produccion` varchar(100) NOT NULL,
  `Descripcion_Estado_Plan_Produccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Estado_Plan_Produccion`),
  UNIQUE KEY `Nombre_Estado_Plan_Produccion` (`Nombre_Estado_Plan_Produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado_plan_produccion`
--

LOCK TABLES `tbl_estado_plan_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_estado_plan_produccion` DISABLE KEYS */;
INSERT INTO `tbl_estado_plan_produccion` VALUES (1,'Plan en proceso','Se inicia el plan de producciÃ³n del producto');
/*!40000 ALTER TABLE `tbl_estado_plan_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado_produccion`
--

DROP TABLE IF EXISTS `tbl_estado_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado_produccion` (
  `Pk_Id_Estado_Produccion` int NOT NULL AUTO_INCREMENT,
  `Nombre_Estado_Produccion` varchar(100) NOT NULL,
  `Descripcion_Estado_Produccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Estado_Produccion`),
  UNIQUE KEY `Nombre_Estado_Produccion` (`Nombre_Estado_Produccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado_produccion`
--

LOCK TABLES `tbl_estado_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_estado_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_estado_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado_recepcion_material`
--

DROP TABLE IF EXISTS `tbl_estado_recepcion_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado_recepcion_material` (
  `Pk_Id_Estado_Recepcion_Material` int NOT NULL AUTO_INCREMENT,
  `Nombre_Estado_Recepcion_Material` varchar(100) NOT NULL,
  `Descripcion_Estado_Recepcion_Material` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Estado_Recepcion_Material`),
  UNIQUE KEY `Nombre_Estado_Recepcion_Material` (`Nombre_Estado_Recepcion_Material`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado_recepcion_material`
--

LOCK TABLES `tbl_estado_recepcion_material` WRITE;
/*!40000 ALTER TABLE `tbl_estado_recepcion_material` DISABLE KEYS */;
INSERT INTO `tbl_estado_recepcion_material` VALUES (1,'Recibido','Producto Recibido'),(2,'Producto en mal estado','Producto daÃ±ado o en mal estado');
/*!40000 ALTER TABLE `tbl_estado_recepcion_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_explosion_materiales`
--

DROP TABLE IF EXISTS `tbl_explosion_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_explosion_materiales` (
  `Pk_Id_Explosion` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Recibida` int NOT NULL,
  `Fecha_Explosion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Explosion`),
  KEY `fk_explosion_orden_recibida` (`Fk_Id_Orden_Recibida`),
  CONSTRAINT `fk_explosion_orden_recibida` FOREIGN KEY (`Fk_Id_Orden_Recibida`) REFERENCES `tbl_orden_recibida` (`Pk_Id_Orden_Recibida`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_explosion_materiales`
--

LOCK TABLES `tbl_explosion_materiales` WRITE;
/*!40000 ALTER TABLE `tbl_explosion_materiales` DISABLE KEYS */;
INSERT INTO `tbl_explosion_materiales` VALUES (1,8,'2026-05-07 14:02:25'),(2,11,'2026-05-07 15:33:31'),(3,12,'2026-05-07 15:59:24'),(4,12,'2026-05-11 03:31:13'),(5,13,'2026-05-15 22:54:46'),(6,14,'2026-05-16 01:38:36'),(7,15,'2026-05-18 01:15:14'),(8,16,'2026-05-18 01:18:41'),(9,17,'2026-05-20 00:10:59');
/*!40000 ALTER TABLE `tbl_explosion_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_explosion_materiales_detalle`
--

DROP TABLE IF EXISTS `tbl_explosion_materiales_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_explosion_materiales_detalle` (
  `Pk_Id_Explosion_Detalle` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Explosion` int NOT NULL,
  `Fk_Id_Material` int NOT NULL,
  `Cantidad_Total` decimal(12,4) NOT NULL,
  `Cantidad_Real_Con_Merma` decimal(12,4) NOT NULL,
  PRIMARY KEY (`Pk_Id_Explosion_Detalle`),
  KEY `fk_explosion_detalle_cabecera` (`Fk_Id_Explosion`),
  KEY `fk_explosion_detalle_material` (`Fk_Id_Material`),
  CONSTRAINT `fk_explosion_detalle_cabecera` FOREIGN KEY (`Fk_Id_Explosion`) REFERENCES `tbl_explosion_materiales` (`Pk_Id_Explosion`),
  CONSTRAINT `fk_explosion_detalle_material` FOREIGN KEY (`Fk_Id_Material`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_explosion_materiales_detalle`
--

LOCK TABLES `tbl_explosion_materiales_detalle` WRITE;
/*!40000 ALTER TABLE `tbl_explosion_materiales_detalle` DISABLE KEYS */;
INSERT INTO `tbl_explosion_materiales_detalle` VALUES (1,1,1,10.0000,10.0000),(2,1,1,10.0000,10.0000),(3,1,3,4.0000,4.0000),(4,1,1,5.0000,5.0000),(5,1,3,4.0000,4.0000),(6,1,5,1.0000,1.0000),(7,1,1,11.0000,11.0000),(8,1,5,1.0000,1.0000),(9,1,3,2.0000,2.0000),(10,2,1,100.0000,100.0000),(11,2,1,100.0000,100.0000),(12,2,3,40.0000,40.0000),(13,2,1,110.0000,110.0000),(14,2,3,20.0000,20.0000),(15,2,5,10.0000,10.0000),(16,2,1,50.0000,50.0000),(17,2,3,40.0000,40.0000),(18,2,5,10.0000,10.0000),(19,3,1,200.0000,200.0000),(20,3,3,400.0000,400.0000),(21,3,5,40.0000,40.0000),(22,4,1,200.0000,200.0000),(23,4,3,400.0000,400.0000),(24,4,5,40.0000,40.0000),(25,5,1,50.0000,50.0000),(26,5,3,100.0000,100.0000),(27,5,5,10.0000,10.0000),(28,5,3,100.0000,100.0000),(29,5,5,20.0000,20.0000),(30,5,9,300.0000,300.0000),(31,5,10,70.0000,70.0000),(32,6,1,40.0000,40.0000),(33,6,3,80.0000,80.0000),(34,6,5,8.0000,8.0000),(35,6,3,40.0000,40.0000),(36,6,5,8.0000,8.0000),(37,6,9,120.0000,120.0000),(38,6,10,28.0000,28.0000),(39,7,1,10.0000,10.0000),(40,7,3,20.0000,20.0000),(41,7,5,2.0000,2.0000),(42,7,3,10.0000,10.0000),(43,7,5,2.0000,2.0000),(44,7,9,30.0000,30.0000),(45,7,10,7.0000,7.0000),(46,8,1,10.0000,10.0000),(47,8,3,20.0000,20.0000),(48,8,5,2.0000,2.0000),(49,9,1,20.0000,20.0000),(50,9,3,40.0000,40.0000),(51,9,5,4.0000,4.0000),(52,9,3,30.0000,30.0000),(53,9,5,6.0000,6.0000),(54,9,9,90.0000,90.0000),(55,9,10,21.0000,21.0000);
/*!40000 ALTER TABLE `tbl_explosion_materiales_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_factura_produccion`
--

DROP TABLE IF EXISTS `tbl_factura_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_factura_produccion` (
  `Pk_Id_Factura` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Recibida` int NOT NULL,
  `Fecha_Factura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Total_Factura` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`Pk_Id_Factura`),
  KEY `fk_factura_orden_recibida` (`Fk_Id_Orden_Recibida`),
  CONSTRAINT `fk_factura_orden_recibida` FOREIGN KEY (`Fk_Id_Orden_Recibida`) REFERENCES `tbl_orden_recibida` (`Pk_Id_Orden_Recibida`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_factura_produccion`
--

LOCK TABLES `tbl_factura_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_factura_produccion` DISABLE KEYS */;
INSERT INTO `tbl_factura_produccion` VALUES (1,12,'2026-05-13 22:15:40',38012.5000),(2,13,'2026-05-15 23:16:04',47427.0000),(3,14,'2026-05-16 03:15:54',25068.4000),(4,16,'2026-05-18 01:43:58',1824.5000),(5,15,'2026-05-18 21:41:25',2983.0000),(6,17,'2026-05-20 00:31:09',3183.0000);
/*!40000 ALTER TABLE `tbl_factura_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_factura_produccion_detalle`
--

DROP TABLE IF EXISTS `tbl_factura_produccion_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_factura_produccion_detalle` (
  `Pk_Id_Detalle_Factura` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Factura` int NOT NULL,
  `Fk_Id_Orden_Produccion` int NOT NULL,
  `Total_Materiales` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Total_Mano_Obra` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Total_Costos_Indirectos` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Total_Mermas` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Total_Fases` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`Pk_Id_Detalle_Factura`),
  KEY `fk_detalle_factura` (`Fk_Id_Factura`),
  KEY `fk_detalle_factura_orden` (`Fk_Id_Orden_Produccion`),
  CONSTRAINT `fk_detalle_factura` FOREIGN KEY (`Fk_Id_Factura`) REFERENCES `tbl_factura_produccion` (`Pk_Id_Factura`),
  CONSTRAINT `fk_detalle_factura_orden` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_orden_produccion` (`Pk_Id_Orden_Produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_factura_produccion_detalle`
--

LOCK TABLES `tbl_factura_produccion_detalle` WRITE;
/*!40000 ALTER TABLE `tbl_factura_produccion_detalle` DISABLE KEYS */;
INSERT INTO `tbl_factura_produccion_detalle` VALUES (1,1,1,35700.0000,750.0000,395.0000,867.5000,300.0000,38012.5000),(2,2,3,22546.0000,0.0000,0.0000,0.0000,875.0000,23421.0000),(3,2,4,22546.0000,280.0000,200.0000,105.0000,875.0000,24006.0000),(4,3,5,11648.4000,560.0000,175.0000,0.0000,875.0000,13258.4000),(5,3,6,10340.0000,495.0000,100.0000,0.0000,875.0000,11810.0000),(6,4,7,141.5000,600.0000,55.0000,3.0000,1025.0000,1824.5000),(7,5,8,141.5000,315.0000,85.0000,0.0000,1025.0000,1566.5000),(8,5,9,141.5000,175.0000,75.0000,0.0000,1025.0000,1416.5000),(9,6,10,141.5000,280.0000,125.0000,15.0000,1125.0000,1686.5000),(10,6,11,141.5000,175.0000,55.0000,0.0000,1125.0000,1496.5000);
/*!40000 ALTER TABLE `tbl_factura_produccion_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fases_produccion`
--

DROP TABLE IF EXISTS `tbl_fases_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_fases_produccion` (
  `Pk_Id_Fase_Producto` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_BOM` int NOT NULL,
  `Nombre_Fase_Produccion` varchar(100) NOT NULL,
  `Descripcion_Fase_Produccion` text NOT NULL,
  `Horas_Hombre` int NOT NULL,
  PRIMARY KEY (`Pk_Id_Fase_Producto`),
  KEY `fk_fase_BOM` (`Fk_Id_BOM`),
  CONSTRAINT `fk_fase_BOM` FOREIGN KEY (`Fk_Id_BOM`) REFERENCES `tbl_bom` (`Pk_Id_BOM`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fases_produccion`
--

LOCK TABLES `tbl_fases_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_fases_produccion` DISABLE KEYS */;
INSERT INTO `tbl_fases_produccion` VALUES (1,5,'Cortado','Corte de madera',2),(2,6,'Cortadp','Cortado de material',2),(3,6,'Ensamblado','Ensamble de piezas',2),(4,7,'Corte','Corte de material',1),(5,7,'Ensamblado','Ensable de piezas',2),(6,7,'Pulido','pulido de bicicleta',1),(7,8,'Cortado','Cortado de piezas de madera',2),(8,8,'Lijado','Lijado de piezas',1),(9,8,'Barnizado','AplicaciÃ³n de Barniz a las piezas',3),(10,8,'Ensamblado','Ensamble de piezas individuales',2),(11,9,'Cortado','Cortado de Piezas',2),(12,9,'Barnizado','Barnizado de piezas',3),(13,9,'Ensamblado','Ensamble de las partes de la cama',2);
/*!40000 ALTER TABLE `tbl_fases_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_garantia`
--

DROP TABLE IF EXISTS `tbl_garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_garantia` (
  `Pk_Id_Garantia` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Material` int NOT NULL,
  `Tiempo_Garantia_Dias_Garantia` int NOT NULL,
  `Descripcion_Cobertura_Garantia` varchar(255) NOT NULL,
  `Fecha_Inicio_Vigencia_Garantia` date NOT NULL,
  `Fecha_Fin_Vigencia_Garantia` date NOT NULL,
  PRIMARY KEY (`Pk_Id_Garantia`),
  KEY `fk_garantia_material` (`Fk_Id_Material`),
  CONSTRAINT `fk_garantia_material` FOREIGN KEY (`Fk_Id_Material`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_garantia`
--

LOCK TABLES `tbl_garantia` WRITE;
/*!40000 ALTER TABLE `tbl_garantia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_garantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inventario`
--

DROP TABLE IF EXISTS `tbl_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_inventario` (
  `Pk_Id_Inventario` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Tipo_Inventario` int NOT NULL,
  `Fk_Id_Material` int NOT NULL,
  `Fk_Id_Almacen` int DEFAULT NULL,
  `Fk_Id_Orden_Produccion` int DEFAULT NULL,
  `Fk_Id_Estado_Produccion` int DEFAULT NULL,
  `Cantidad_Disponible` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Costo_Unitario` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Inventario`),
  UNIQUE KEY `uq_inventario` (`Fk_Id_Tipo_Inventario`,`Fk_Id_Material`,`Fk_Id_Almacen`,`Fk_Id_Orden_Produccion`),
  KEY `fk_inventario_material` (`Fk_Id_Material`),
  KEY `fk_inventario_almacen` (`Fk_Id_Almacen`),
  KEY `fk_inventario_estado_produccion` (`Fk_Id_Estado_Produccion`),
  KEY `fk_inventario_orden_produccion` (`Fk_Id_Orden_Produccion`),
  CONSTRAINT `fk_inventario_almacen` FOREIGN KEY (`Fk_Id_Almacen`) REFERENCES `tbl_almacen` (`Pk_Id_Almacen`),
  CONSTRAINT `fk_inventario_estado_produccion` FOREIGN KEY (`Fk_Id_Estado_Produccion`) REFERENCES `tbl_estado_produccion` (`Pk_Id_Estado_Produccion`),
  CONSTRAINT `fk_inventario_material` FOREIGN KEY (`Fk_Id_Material`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`),
  CONSTRAINT `fk_inventario_orden_produccion` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_orden_produccion` (`Pk_Id_Orden_Produccion`),
  CONSTRAINT `fk_inventario_tipo` FOREIGN KEY (`Fk_Id_Tipo_Inventario`) REFERENCES `tbl_tipo_inventario` (`Pk_Id_Tipo_Inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventario`
--

LOCK TABLES `tbl_inventario` WRITE;
/*!40000 ALTER TABLE `tbl_inventario` DISABLE KEYS */;
INSERT INTO `tbl_inventario` VALUES (1,1,3,1,NULL,NULL,170.0000,75.0000,'2026-05-20 00:28:11'),(2,1,1,1,NULL,NULL,1140.0000,23.5000,'2026-05-20 00:28:11'),(3,1,5,1,NULL,NULL,678.0000,25.0000,'2026-05-20 00:28:11'),(4,1,9,1,NULL,NULL,140.0000,10.5000,'2026-05-20 00:28:11'),(5,1,10,1,NULL,NULL,23.0000,7.5000,'2026-05-20 00:28:11');
/*!40000 ALTER TABLE `tbl_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mano_obra`
--

DROP TABLE IF EXISTS `tbl_mano_obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mano_obra` (
  `Pk_Id_Mano_Obra` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Produccion` int NOT NULL,
  `Fk_Id_Empleado` int NOT NULL,
  `Hora_Trabajada_Mano_Obra` decimal(10,2) NOT NULL,
  `Costo_Hora_Mano_Obra` decimal(12,4) NOT NULL,
  `Subtotal_Mano_Obra` decimal(12,4) NOT NULL,
  PRIMARY KEY (`Pk_Id_Mano_Obra`),
  KEY `fk_mano_obra_orden` (`Fk_Id_Orden_Produccion`),
  KEY `fk_mano_obra_empleado` (`Fk_Id_Empleado`),
  CONSTRAINT `fk_mano_obra_empleado` FOREIGN KEY (`Fk_Id_Empleado`) REFERENCES `tbl_empleado` (`Pk_Id_Empleado`),
  CONSTRAINT `fk_mano_obra_orden` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_orden_produccion` (`Pk_Id_Orden_Produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mano_obra`
--

LOCK TABLES `tbl_mano_obra` WRITE;
/*!40000 ALTER TABLE `tbl_mano_obra` DISABLE KEYS */;
INSERT INTO `tbl_mano_obra` VALUES (7,1,2,9.00,25.0000,225.0000),(8,1,3,7.00,75.0000,525.0000),(9,4,2,3.00,35.0000,105.0000),(10,4,3,5.00,35.0000,175.0000),(11,5,2,8.00,70.0000,560.0000),(12,6,3,9.00,55.0000,495.0000),(13,7,2,8.00,75.0000,600.0000),(14,8,2,7.00,45.0000,315.0000),(15,9,2,5.00,35.0000,175.0000),(16,10,2,8.00,35.0000,280.0000),(17,11,3,7.00,25.0000,175.0000);
/*!40000 ALTER TABLE `tbl_mano_obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_materiales`
--

DROP TABLE IF EXISTS `tbl_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_materiales` (
  `Pk_Id_Materiales` int NOT NULL AUTO_INCREMENT,
  `Codigo_Material` varchar(50) NOT NULL,
  `Nombre_Material` varchar(150) NOT NULL,
  `Descripcion_Material` varchar(255) DEFAULT NULL,
  `Fk_Id_Categoria` int NOT NULL,
  `Fk_Id_Unidad_Medida` int NOT NULL,
  `Stock_Minimo` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Lote_Minimo_Compra` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `Lead_Time_Produccion_Dias` int DEFAULT '0',
  `Activo` tinyint(1) NOT NULL DEFAULT '1',
  `Imagen_Material` longblob,
  `Codigo_Barras` varchar(100) DEFAULT NULL,
  `Tipo_Codigo_Barras` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Materiales`),
  UNIQUE KEY `Codigo_Material` (`Codigo_Material`),
  KEY `fk_materiales_categoria` (`Fk_Id_Categoria`),
  KEY `fk_materiales_unidad_medida` (`Fk_Id_Unidad_Medida`),
  CONSTRAINT `fk_materiales_categoria` FOREIGN KEY (`Fk_Id_Categoria`) REFERENCES `tbl_categoria_material` (`Pk_Id_Categoria_Material`),
  CONSTRAINT `fk_materiales_unidad_medida` FOREIGN KEY (`Fk_Id_Unidad_Medida`) REFERENCES `tbl_unidad_medida` (`Pk_Id_Unidad_Medida`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_materiales`
--

LOCK TABLES `tbl_materiales` WRITE;
/*!40000 ALTER TABLE `tbl_materiales` DISABLE KEYS */;
INSERT INTO `tbl_materiales` VALUES (1,'10','Cable de cobre','Cable de cobre de 10mm',1,1,100.0000,150.0000,0,1,NULL,NULL,NULL),(2,'12','Bicicleta','Bicicleta para niÃ±os',2,2,100.0000,75.0000,5,1,NULL,NULL,NULL),(3,'MP001','Madera Pino','Madera de pino para muebles',1,1,50.0000,100.0000,0,1,NULL,NULL,NULL),(4,'MP002','Pegamento Industrial','Pegamento para madera',2,3,10.0000,20.0000,0,1,NULL,NULL,NULL),(5,'MP003','Barniz Transparente','Barniz protector',3,3,5.0000,10.0000,0,1,NULL,NULL,NULL),(6,'PT001','Mesa de Madera','Mesa estÃ¡ndar de comedor',4,2,0.0000,1.0000,3,1,NULL,NULL,NULL),(7,'PT002','Escritorio empresarial','Escritorio de madera tipo empresarial',2,2,50.0000,50.0000,7,1,NULL,NULL,NULL),(8,'PT003','Cama Matrimonial','Cama Matrimonial de AlgodÃ³n',6,4,50.0000,50.0000,3,1,NULL,NULL,NULL),(9,'MP004','AlgodÃ³n','AlgodÃ³n ',7,3,50.0000,100.0000,0,1,NULL,NULL,NULL),(10,'MP005','Tela','Tela blanca',7,6,50.0000,80.0000,0,1,_binary 'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0s\0\0\0²\ä\0\0\0sRGB\0®\Î\é\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0\Ã\0\0\Ã\Ço¨d\0\0IDATx^\íN$Gy\â9ü¯\ÜOðM21¹Õ·ºf\ì\n	e1[jF-t\ØO\ïM3 /G3¤/G3¤/G3¤/G3dù\åxzúg¥2\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7f\î3¡\ß\å²T8«»WVT\Ý,\Ë7~õCþdú\Ü÷ô\åø \Ï}\Ïòý¿?y\î\åû%/ò\Ü\Ë7öKþ^þä¹¯õ&o¥/G3¤/G3¤/G3¤/G3¤/G3¤/G3$¹¿\Þ_ÿA_/oj\Èñ\ç\×_\ßs\Ù{µg\ÅñýnO¿>}z~½m8c\ã\íýÀ×¿=TþR\Ù{µg\ÅU\Þ\Ãý%úü²rº\Çmz~\×\Ïöö¢¿Ü`¼½|¸\ã+{)\ì½Ú³sñ÷p|\ï|p9p£øÄ¯\×÷\ç\ä\\È¯ûò\ÈÞ«=\ßþ¼¸Ç¯¦óÿó¥Ä¯\"\äþ¥<²÷j\Ï^ù=¼\åô\ÌÁq9Òy\Û\â¥|.ü\ê¥<²÷j\ÏÞ¸\ê{H¿\Î\ê\ã>û»\'ð\Ù+\\}ûø÷\Éñï /\ÇÌ³>û\ã/ÿ2»/\ÇÌ³>û\ã/\Ç\é\áügK/\Çù;>x÷\ágo<²÷j\Ï:\Ã\Ï\Þø\ç=¾÷\Ø\åx\èO\"ã«ò\Ý}\ë³ùñ\ï\áô\ß?²tº±O³ÿþ?¦øò¥<¶÷jÏ¸\Ô{8Î}>8]\Û\Ê\ã×}ñR\Þñò\ØÞ«=.ñø\Û\ãü\åg¶\Ë\Üø\Ëüö¥\ì½Ú³\\\æ=Ü®\Ó\çoñ³\É\åh\è\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñ\é\Ë\Ñxÿs+úm0Û\0\0\0\0IEND®B`','010000010006','EAN13');
/*!40000 ALTER TABLE `tbl_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_merma`
--

DROP TABLE IF EXISTS `tbl_merma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_merma` (
  `Pk_Id_Merma` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Produccion` int NOT NULL,
  `Fk_Id_Materiales` int NOT NULL,
  `Fk_Tipo_Merma` int NOT NULL,
  `Cantidad_Merma` decimal(12,4) NOT NULL,
  `Motivo_Merma` varchar(255) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Merma`),
  KEY `fk_merma_orden` (`Fk_Id_Orden_Produccion`),
  KEY `fk_merma_material` (`Fk_Id_Materiales`),
  KEY `fk_merma_tipo` (`Fk_Tipo_Merma`),
  CONSTRAINT `fk_merma_material` FOREIGN KEY (`Fk_Id_Materiales`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`),
  CONSTRAINT `fk_merma_orden` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_orden_produccion` (`Pk_Id_Orden_Produccion`),
  CONSTRAINT `fk_merma_tipo` FOREIGN KEY (`Fk_Tipo_Merma`) REFERENCES `tbl_tipo_merma` (`Pk_Id_Tipo_Merma`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merma`
--

LOCK TABLES `tbl_merma` WRITE;
/*!40000 ALTER TABLE `tbl_merma` DISABLE KEYS */;
INSERT INTO `tbl_merma` VALUES (1,1,1,1,5.0000,'Material sobrante en la elaboraciÃ³n del producto','2026-05-11 01:57:30'),(2,1,3,2,10.0000,'Prueba','2026-05-11 03:45:37'),(3,4,9,1,10.0000,'.','2026-05-15 23:10:44'),(4,7,3,2,3.0000,'Material sobrante','2026-05-18 01:20:50'),(5,10,10,2,10.0000,'Tela sobrante','2026-05-20 00:25:31'),(6,10,9,2,5.0000,'Material sobrante','2026-05-20 00:26:05');
/*!40000 ALTER TABLE `tbl_merma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modulo`
--

DROP TABLE IF EXISTS `tbl_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_modulo` (
  `Pk_Id_Modulo` int NOT NULL,
  `Cmp_Nombre_Modulo` varchar(50) DEFAULT NULL,
  `Cmp_Descripcion_Modulo` varchar(50) DEFAULT NULL,
  `Cmp_Estado_Modulo` bit(1) NOT NULL,
  PRIMARY KEY (`Pk_Id_Modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modulo`
--

LOCK TABLES `tbl_modulo` WRITE;
/*!40000 ALTER TABLE `tbl_modulo` DISABLE KEYS */;
INSERT INTO `tbl_modulo` VALUES (2,'Navegador','MÃ³dulo de navegador',_binary ''),(4,'Seguridad','Modulo de seguridad de la hoteleria',_binary ''),(5,'MRP','PlanificaciÃ³n de requerimientos de materiales',_binary '');
/*!40000 ALTER TABLE `tbl_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_movimiento_inventarios`
--

DROP TABLE IF EXISTS `tbl_movimiento_inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_movimiento_inventarios` (
  `Pk_Id_Movimiento_Inventarios` int NOT NULL AUTO_INCREMENT,
  `Fk_Tipo_Movimiento` int NOT NULL,
  `Fk_Id_Material` int NOT NULL,
  `Cantidad_Movida_Movimiento_Inventarios` decimal(12,4) NOT NULL,
  `Fk_Id_Almacen_Origen` int NOT NULL,
  `Fk_Id_Almacen_Destino` int NOT NULL,
  `Fk_Orden_Produccion` int DEFAULT NULL,
  `Fecha_Movimiento_Inventarios` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Observacion_Movimiento_Inventarios` varchar(255) NOT NULL,
  `Fk_Id_Recepcion_Detalle` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Movimiento_Inventarios`),
  KEY `fk_movimiento_tipo` (`Fk_Tipo_Movimiento`),
  KEY `fk_movimiento_material` (`Fk_Id_Material`),
  KEY `fk_movimiento_almacen_origen` (`Fk_Id_Almacen_Origen`),
  KEY `fk_movimiento_almacen_destino` (`Fk_Id_Almacen_Destino`),
  KEY `fk_movimiento_orden` (`Fk_Orden_Produccion`),
  KEY `fk_movimiento_recepcion_detalle` (`Fk_Id_Recepcion_Detalle`),
  CONSTRAINT `fk_movimiento_almacen_destino` FOREIGN KEY (`Fk_Id_Almacen_Destino`) REFERENCES `tbl_almacen` (`Pk_Id_Almacen`),
  CONSTRAINT `fk_movimiento_almacen_origen` FOREIGN KEY (`Fk_Id_Almacen_Origen`) REFERENCES `tbl_almacen` (`Pk_Id_Almacen`),
  CONSTRAINT `fk_movimiento_material` FOREIGN KEY (`Fk_Id_Material`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`),
  CONSTRAINT `fk_movimiento_orden` FOREIGN KEY (`Fk_Orden_Produccion`) REFERENCES `tbl_orden_produccion` (`Pk_Id_Orden_Produccion`),
  CONSTRAINT `fk_movimiento_recepcion_detalle` FOREIGN KEY (`Fk_Id_Recepcion_Detalle`) REFERENCES `tbl_recepcion_detalle` (`Pk_Id_Recepcion_Detalle`),
  CONSTRAINT `fk_movimiento_tipo` FOREIGN KEY (`Fk_Tipo_Movimiento`) REFERENCES `tbl_tipo_movimiento_inventario` (`Pk_Id_Tipo_Movimiento_Inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_movimiento_inventarios`
--

LOCK TABLES `tbl_movimiento_inventarios` WRITE;
/*!40000 ALTER TABLE `tbl_movimiento_inventarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_movimiento_inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_material`
--

DROP TABLE IF EXISTS `tbl_orden_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orden_material` (
  `Pk_Id_Orden_Material` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Produccion` int NOT NULL,
  `Fk_Id_Materiales` int NOT NULL,
  `Cantidad_Necesaria_Orden_Material` decimal(12,4) NOT NULL,
  `Cantidad_Consumida_Orden_Material` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Cantidad_Restante_Orden_Material` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`Pk_Id_Orden_Material`),
  UNIQUE KEY `uq_orden_material` (`Fk_Id_Orden_Produccion`,`Fk_Id_Materiales`),
  KEY `fk_orden_material_material` (`Fk_Id_Materiales`),
  CONSTRAINT `fk_orden_material_material` FOREIGN KEY (`Fk_Id_Materiales`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`),
  CONSTRAINT `fk_orden_material_orden` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_orden_produccion` (`Pk_Id_Orden_Produccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_material`
--

LOCK TABLES `tbl_orden_material` WRITE;
/*!40000 ALTER TABLE `tbl_orden_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_orden_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_produccion`
--

DROP TABLE IF EXISTS `tbl_orden_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orden_produccion` (
  `Pk_Id_Orden_Produccion` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Plan_Produccion` int NOT NULL,
  `Fk_Id_Material` int NOT NULL,
  `Fk_Id_Estado_Orden_Produccion` int NOT NULL,
  `Cantidad_Programada_Orden_Produccion` decimal(12,4) NOT NULL,
  `Cantidad_Producida_Orden_Produccion` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `Fecha_Inicio_Orden_Produccion` date NOT NULL,
  `Fecha_Fin_Orden_Produccion` date NOT NULL,
  PRIMARY KEY (`Pk_Id_Orden_Produccion`),
  KEY `fk_orden_plan` (`Fk_Id_Plan_Produccion`),
  KEY `fk_orden_material` (`Fk_Id_Material`),
  KEY `fk_orden_estado` (`Fk_Id_Estado_Orden_Produccion`),
  CONSTRAINT `fk_orden_estado` FOREIGN KEY (`Fk_Id_Estado_Orden_Produccion`) REFERENCES `tbl_estado_orden_produccion` (`Pk_Id_Estado_Orden_Produccion`),
  CONSTRAINT `fk_orden_material` FOREIGN KEY (`Fk_Id_Material`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`),
  CONSTRAINT `fk_orden_plan` FOREIGN KEY (`Fk_Id_Plan_Produccion`) REFERENCES `tbl_plan_produccion` (`Pk_Id_Plan_Produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_produccion`
--

LOCK TABLES `tbl_orden_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_orden_produccion` DISABLE KEYS */;
INSERT INTO `tbl_orden_produccion` VALUES (1,1,7,1,20.0000,0.0000,'2026-04-29','2026-09-16'),(2,2,2,1,10.0000,0.0000,'2026-05-10','2026-06-29'),(3,3,8,1,10.0000,0.0000,'2026-05-15','2026-07-24'),(4,3,7,1,5.0000,0.0000,'2026-05-15','2026-05-30'),(5,4,8,1,4.0000,0.0000,'2026-05-15','2026-05-27'),(6,4,7,1,4.0000,0.0000,'2026-05-15','2026-06-12'),(7,5,7,1,1.0000,0.0000,'2026-05-17','2026-05-24'),(8,6,8,1,1.0000,0.0000,'2026-05-18','2026-05-21'),(9,6,7,1,1.0000,0.0000,'2026-05-18','2026-05-25'),(10,7,8,1,3.0000,0.0000,'2026-05-20','2026-05-29'),(11,7,7,1,2.0000,0.0000,'2026-05-21','2026-06-04');
/*!40000 ALTER TABLE `tbl_orden_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_recibida`
--

DROP TABLE IF EXISTS `tbl_orden_recibida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orden_recibida` (
  `Pk_Id_Orden_Recibida` int NOT NULL AUTO_INCREMENT,
  `Id_Externo_Logistica` varchar(100) NOT NULL,
  `Fk_Id_Estado_Orden_Recibida` int NOT NULL,
  `Fecha_Recepcion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Requerida` date NOT NULL,
  `Observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Orden_Recibida`),
  UNIQUE KEY `Id_Externo_Logistica` (`Id_Externo_Logistica`),
  KEY `fk_orden_logistica_estado` (`Fk_Id_Estado_Orden_Recibida`),
  CONSTRAINT `fk_orden_logistica_estado` FOREIGN KEY (`Fk_Id_Estado_Orden_Recibida`) REFERENCES `tbl_estado_orden_recibida` (`Pk_Id_Estado_Orden_Recibida`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_recibida`
--

LOCK TABLES `tbl_orden_recibida` WRITE;
/*!40000 ALTER TABLE `tbl_orden_recibida` DISABLE KEYS */;
INSERT INTO `tbl_orden_recibida` VALUES (1,'ORD-001',1,'2026-04-01 14:00:00','2026-04-20','Primera orden de prueba'),(2,'ORD-002',1,'2026-04-10 15:30:00','2026-04-25','Segunda orden de prueba'),(3,'ORD-003',1,'2026-04-15 16:00:00','2026-04-30','Tercera orden de prueba'),(4,'ORD-004',1,'2026-04-29 16:00:00','2026-05-05','Tercera orden de prueba'),(6,'ORD-006',1,'2026-05-01 02:17:24','2026-05-05','PRueba '),(7,'ORD-007',1,'2026-05-01 02:40:19','2026-06-03','OTra prueba'),(8,'ORD-008',2,'2026-05-03 21:54:32','2026-05-31','Ninguna'),(9,'ORD-009',1,'2026-05-03 23:24:03','2026-05-19','Ninguna'),(11,'ORD-011',1,'2026-05-07 15:04:58','2026-05-07',''),(12,'ORD-012',3,'2026-05-07 15:44:50','2026-05-07','Ninguna'),(13,'ORD-013',3,'2026-05-15 22:52:52','2026-05-22','Orden de prueba para generar factura'),(14,'ORD-014',3,'2026-05-16 01:37:57','2026-05-22','.'),(15,'ORD-015',3,'2026-05-18 01:14:46','2026-05-20','.'),(16,'ORD-016',1,'2026-05-18 01:18:27','2026-05-17','Prueba 2'),(17,'ORD-017',3,'2026-05-20 00:05:39','2026-05-21','Prueba Final');
/*!40000 ALTER TABLE `tbl_orden_recibida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_recibida_detalle`
--

DROP TABLE IF EXISTS `tbl_orden_recibida_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orden_recibida_detalle` (
  `Pk_Id_Detalle` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Recibida` int NOT NULL,
  `Fk_Id_Material` int NOT NULL,
  `Cantidad_Solicitada` decimal(12,4) NOT NULL,
  PRIMARY KEY (`Pk_Id_Detalle`),
  KEY `fk_detalle_orden` (`Fk_Id_Orden_Recibida`),
  KEY `fk_detalle_material` (`Fk_Id_Material`),
  CONSTRAINT `fk_detalle_material` FOREIGN KEY (`Fk_Id_Material`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`),
  CONSTRAINT `fk_detalle_orden` FOREIGN KEY (`Fk_Id_Orden_Recibida`) REFERENCES `tbl_orden_recibida` (`Pk_Id_Orden_Recibida`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_recibida_detalle`
--

LOCK TABLES `tbl_orden_recibida_detalle` WRITE;
/*!40000 ALTER TABLE `tbl_orden_recibida_detalle` DISABLE KEYS */;
INSERT INTO `tbl_orden_recibida_detalle` VALUES (1,1,1,500.0000),(2,2,1,300.0000),(3,3,1,750.0000),(4,4,1,500.0000),(5,4,2,50.0000),(8,6,6,10.0000),(9,6,2,10.0000),(10,7,1,4.0000),(11,7,4,3.0000),(12,7,6,4.0000),(13,7,3,5.0000),(14,8,1,1.0000),(15,8,2,1.0000),(16,8,6,1.0000),(17,8,3,1.0000),(18,9,1,3.0000),(19,9,3,8.0000),(20,9,6,3.0000),(22,11,2,10.0000),(23,12,7,20.0000),(24,13,8,10.0000),(25,13,7,5.0000),(26,14,8,4.0000),(27,14,7,4.0000),(28,15,8,1.0000),(29,15,7,1.0000),(30,16,7,1.0000),(31,17,8,3.0000),(32,17,7,2.0000);
/*!40000 ALTER TABLE `tbl_orden_recibida_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perfil`
--

DROP TABLE IF EXISTS `tbl_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_perfil` (
  `Pk_Id_Perfil` int NOT NULL AUTO_INCREMENT,
  `Cmp_Puesto_Perfil` varchar(50) DEFAULT NULL,
  `Cmp_Descripcion_Perfil` varchar(50) DEFAULT NULL,
  `Cmp_Estado_Perfil` bit(1) NOT NULL,
  `Cmp_Tipo_Perfil` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perfil`
--

LOCK TABLES `tbl_perfil` WRITE;
/*!40000 ALTER TABLE `tbl_perfil` DISABLE KEYS */;
INSERT INTO `tbl_perfil` VALUES (1,'Administrador','Perfil con todos los permisos',_binary '',1);
/*!40000 ALTER TABLE `tbl_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permiso_perfil_aplicacion`
--

DROP TABLE IF EXISTS `tbl_permiso_perfil_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_permiso_perfil_aplicacion` (
  `Fk_Id_Perfil` int NOT NULL,
  `Fk_Id_Modulo` int NOT NULL,
  `Fk_Id_Aplicacion` int NOT NULL,
  `Cmp_Ingresar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Consultar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Modificar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Eliminar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Imprimir_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Fk_Id_Perfil`,`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  KEY `Fk_PermisoPerfil_ModuloAplicacion` (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  CONSTRAINT `Fk_PermisoPerfil` FOREIGN KEY (`Fk_Id_Perfil`) REFERENCES `tbl_perfil` (`Pk_Id_Perfil`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fk_PermisoPerfil_ModuloAplicacion` FOREIGN KEY (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`) REFERENCES `tbl_asignacion_modulo_aplicacion` (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permiso_perfil_aplicacion`
--

LOCK TABLES `tbl_permiso_perfil_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_permiso_perfil_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_permiso_perfil_aplicacion` VALUES (1,4,301,_binary '',_binary '',_binary '',_binary '',_binary ''),(1,4,305,_binary '',_binary '',_binary '',_binary '',_binary ''),(1,4,306,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(1,4,309,_binary '',_binary '',_binary '',_binary '',_binary '');
/*!40000 ALTER TABLE `tbl_permiso_perfil_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permiso_usuario_aplicacion`
--

DROP TABLE IF EXISTS `tbl_permiso_usuario_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_permiso_usuario_aplicacion` (
  `Fk_Id_Usuario` int NOT NULL,
  `Fk_Id_Modulo` int NOT NULL,
  `Fk_Id_Aplicacion` int NOT NULL,
  `Cmp_Ingresar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Consultar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Modificar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Eliminar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Imprimir_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Fk_Id_Usuario`,`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  KEY `Fk_Permiso_Modulo_Aplicacion` (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  CONSTRAINT `Fk_Permiso_Modulo_Aplicacion` FOREIGN KEY (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`) REFERENCES `tbl_asignacion_modulo_aplicacion` (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fk_Permiso_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permiso_usuario_aplicacion`
--

LOCK TABLES `tbl_permiso_usuario_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_permiso_usuario_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_permiso_usuario_aplicacion` VALUES (4,4,301,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,302,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,303,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,304,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,305,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,306,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,307,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,308,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,700,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,701,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,702,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,703,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,704,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,705,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,706,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,707,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,708,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,709,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,710,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,711,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,712,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,713,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,714,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,715,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,716,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,717,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,718,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,719,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,720,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,721,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,722,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,723,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,724,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,725,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,726,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,727,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,728,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,729,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,730,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,5,731,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,301,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,302,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,303,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,304,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,305,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,306,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,307,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,308,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,309,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,700,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,701,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,702,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,703,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,704,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,705,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,706,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,707,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,708,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,709,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,710,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,711,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,712,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,713,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,714,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,715,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,716,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,717,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,718,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,719,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,720,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,721,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,722,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,723,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,724,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,725,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,726,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,727,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,728,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,729,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,730,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,731,_binary '',_binary '',_binary '',_binary '',_binary ''),(69,5,714,_binary '',_binary '',_binary '',_binary '',_binary '');
/*!40000 ALTER TABLE `tbl_permiso_usuario_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_plan_produccion`
--

DROP TABLE IF EXISTS `tbl_plan_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_plan_produccion` (
  `Pk_Id_Plan_Produccion` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Recibida` int NOT NULL,
  `Fk_Id_Estado_Plan_Produccion` int NOT NULL,
  `Fecha_Plan_Produccion` date NOT NULL,
  `Descripcion_Plan_Produccion` varchar(255) NOT NULL,
  PRIMARY KEY (`Pk_Id_Plan_Produccion`),
  KEY `fk_orden_recibida` (`Fk_Id_Orden_Recibida`),
  KEY `fk_plan_estado` (`Fk_Id_Estado_Plan_Produccion`),
  CONSTRAINT `fk_orden_recibida` FOREIGN KEY (`Fk_Id_Orden_Recibida`) REFERENCES `tbl_orden_recibida` (`Pk_Id_Orden_Recibida`),
  CONSTRAINT `fk_plan_estado` FOREIGN KEY (`Fk_Id_Estado_Plan_Produccion`) REFERENCES `tbl_estado_plan_produccion` (`Pk_Id_Estado_Plan_Produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_plan_produccion`
--

LOCK TABLES `tbl_plan_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_plan_produccion` DISABLE KEYS */;
INSERT INTO `tbl_plan_produccion` VALUES (1,12,1,'2026-04-29','FabricaciÃ³n de 20 escritorios empresariales'),(2,11,1,'2026-05-10','Prueba'),(3,13,1,'2026-05-15','ProducciÃ³n de 10 camas matrimoniales'),(4,14,1,'2026-05-15','Orden de prueba para generar factura'),(5,16,1,'2026-05-17','Escritorio'),(6,15,1,'2026-05-18','Escritorios y camas'),(7,17,1,'2026-05-19','Escritorios y Camas');
/*!40000 ALTER TABLE `tbl_plan_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_recepcion_detalle`
--

DROP TABLE IF EXISTS `tbl_recepcion_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_recepcion_detalle` (
  `Pk_Id_Recepcion_Detalle` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Recepcion` int NOT NULL,
  `Fk_Id_Material` int NOT NULL,
  `Cantidad_Recibida` decimal(12,4) NOT NULL,
  `Costo_Unitario_Recibido` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`Pk_Id_Recepcion_Detalle`),
  KEY `Fk_Id_Recepcion` (`Fk_Id_Recepcion`),
  KEY `Fk_Id_Material` (`Fk_Id_Material`),
  CONSTRAINT `tbl_recepcion_detalle_ibfk_1` FOREIGN KEY (`Fk_Id_Recepcion`) REFERENCES `tbl_recepcion_encabezado` (`Pk_Id_Recepcion`) ON DELETE CASCADE,
  CONSTRAINT `tbl_recepcion_detalle_ibfk_2` FOREIGN KEY (`Fk_Id_Material`) REFERENCES `tbl_materiales` (`Pk_Id_Materiales`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recepcion_detalle`
--

LOCK TABLES `tbl_recepcion_detalle` WRITE;
/*!40000 ALTER TABLE `tbl_recepcion_detalle` DISABLE KEYS */;
INSERT INTO `tbl_recepcion_detalle` VALUES (1,1,3,100.0000,150.0000),(2,1,5,100.0000,50.0000),(3,1,1,100.0000,23.5000),(4,2,3,50.0000,60.0000),(5,3,10,2.0000,7.5000),(6,4,10,25.0000,7.5000),(7,5,10,50.0000,7.5000);
/*!40000 ALTER TABLE `tbl_recepcion_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_recepcion_encabezado`
--

DROP TABLE IF EXISTS `tbl_recepcion_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_recepcion_encabezado` (
  `Pk_Id_Recepcion` int NOT NULL AUTO_INCREMENT,
  `Id_Externo_Logistica` varchar(100) NOT NULL,
  `Fk_Id_Almacen_Destino` int NOT NULL,
  `Fk_Id_Estado_Recepcion` int NOT NULL,
  `Fecha_Notificacion` date DEFAULT NULL,
  `Fecha_Ingreso_Almacen` date DEFAULT NULL,
  `Observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Recepcion`),
  UNIQUE KEY `Id_Externo_Logistica` (`Id_Externo_Logistica`),
  KEY `Fk_Id_Almacen_Destino` (`Fk_Id_Almacen_Destino`),
  KEY `Fk_Id_Estado_Recepcion` (`Fk_Id_Estado_Recepcion`),
  CONSTRAINT `tbl_recepcion_encabezado_ibfk_1` FOREIGN KEY (`Fk_Id_Almacen_Destino`) REFERENCES `tbl_almacen` (`Pk_Id_Almacen`),
  CONSTRAINT `tbl_recepcion_encabezado_ibfk_2` FOREIGN KEY (`Fk_Id_Estado_Recepcion`) REFERENCES `tbl_estado_recepcion_material` (`Pk_Id_Estado_Recepcion_Material`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recepcion_encabezado`
--

LOCK TABLES `tbl_recepcion_encabezado` WRITE;
/*!40000 ALTER TABLE `tbl_recepcion_encabezado` DISABLE KEYS */;
INSERT INTO `tbl_recepcion_encabezado` VALUES (1,'1',1,1,'2026-05-08','2026-05-09','Ninguna'),(2,'2',1,1,'2026-05-10','2026-05-10','Prueba'),(3,'3',1,1,'2026-05-17','2026-05-17','.'),(4,'4',1,1,'2026-05-17','2026-05-17','Tela recibida'),(5,'5',1,1,'2026-05-19','2026-05-20','Recepcion de Tela');
/*!40000 ALTER TABLE `tbl_recepcion_encabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reportes`
--

DROP TABLE IF EXISTS `tbl_reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reportes` (
  `Pk_Id_Reporte` int NOT NULL AUTO_INCREMENT,
  `Cmp_Titulo_Reporte` varchar(50) DEFAULT NULL,
  `Cmp_Ruta_Reporte` varchar(500) DEFAULT NULL,
  `Cmp_Fecha_Reporte` date DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Reporte`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reportes`
--

LOCK TABLES `tbl_reportes` WRITE;
/*!40000 ALTER TABLE `tbl_reportes` DISABLE KEYS */;
INSERT INTO `tbl_reportes` VALUES (1,'Reporte final','C:\\Users\\lopez\\OneDrive\\Escritorio\\navegador\\asis2k25p2\\codigo\\componentes\\reporteador\\Base de Datos y Reporte Generado\\ReporteEmpleadosHSC.rpt','2025-01-01'),(2,'Reporte_Prueba','C:\\Users\\lopez\\OneDrive\\Escritorio\\navegador\\asis2k25p2\\codigo\\componentes\\reporteador\\Base de Datos y Reporte Generado\\ReporteEmpleadosHSC.rpt','2025-01-01'),(3,'Perfiles Reporte','C:\\is2k26pf\\codigo\\componentes\\seguridad\\SeguridadMVC\\SeguridadMVC\\CapaVista\\Reporte_perfiles.rpt','2026-02-03'),(5,'Empleados reporte','C:\\is2k26pf\\codigo\\componentes\\seguridad\\SeguridadMVC\\SeguridadMVC\\CapaVista\\Reporte_empleado.rpt','2026-02-05'),(6,'Ordenes Recibidas','C:\\Ing_Soft_Navegador\\is2k26pf\\reportes\\MRP\\Reportes_Transaccionales\\Reporte_Orden_RecibidaV1.rpt','2026-05-03');
/*!40000 ALTER TABLE `tbl_reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_costo_fase`
--

DROP TABLE IF EXISTS `tbl_tipo_costo_fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_costo_fase` (
  `Pk_Id_Tipo_Costo_Fase` int NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Costo` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Tipo_Costo_Fase`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_costo_fase`
--

LOCK TABLES `tbl_tipo_costo_fase` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_costo_fase` DISABLE KEYS */;
INSERT INTO `tbl_tipo_costo_fase` VALUES (1,'Costo de fabricaciÃ³n','Costo de fabricaciÃ³n');
/*!40000 ALTER TABLE `tbl_tipo_costo_fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_estado_orden_material`
--

DROP TABLE IF EXISTS `tbl_tipo_estado_orden_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_estado_orden_material` (
  `Pk_Id_Estado_Orden_Material` int NOT NULL,
  `Nombre_Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`Pk_Id_Estado_Orden_Material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_estado_orden_material`
--

LOCK TABLES `tbl_tipo_estado_orden_material` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_estado_orden_material` DISABLE KEYS */;
INSERT INTO `tbl_tipo_estado_orden_material` VALUES (1,'Enviado'),(2,'Pendiente'),(3,'Entregado');
/*!40000 ALTER TABLE `tbl_tipo_estado_orden_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_inventario`
--

DROP TABLE IF EXISTS `tbl_tipo_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_inventario` (
  `Pk_Id_Tipo_Inventario` int NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Inventario` varchar(50) NOT NULL,
  PRIMARY KEY (`Pk_Id_Tipo_Inventario`),
  UNIQUE KEY `Nombre_Tipo_Inventario` (`Nombre_Tipo_Inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_inventario`
--

LOCK TABLES `tbl_tipo_inventario` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_inventario` DISABLE KEYS */;
INSERT INTO `tbl_tipo_inventario` VALUES (1,'Materia Prima');
/*!40000 ALTER TABLE `tbl_tipo_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_material`
--

DROP TABLE IF EXISTS `tbl_tipo_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_material` (
  `Pk_Id_Tipo_Material` int NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Material` varchar(100) NOT NULL,
  `Estado_Tipo_Material` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Activo, 0=Inactivo',
  PRIMARY KEY (`Pk_Id_Tipo_Material`),
  UNIQUE KEY `Nombre_Tipo_Material` (`Nombre_Tipo_Material`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_material`
--

LOCK TABLES `tbl_tipo_material` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_material` DISABLE KEYS */;
INSERT INTO `tbl_tipo_material` VALUES (1,'Materia Prima',1),(2,'Producto Terminado',1),(3,'Material Defectuoso',0);
/*!40000 ALTER TABLE `tbl_tipo_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_merma`
--

DROP TABLE IF EXISTS `tbl_tipo_merma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_merma` (
  `Pk_Id_Tipo_Merma` int NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Merma` varchar(100) NOT NULL,
  `Descripcion_Tipo_Merma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Tipo_Merma`),
  UNIQUE KEY `Nombre_Tipo_Merma` (`Nombre_Tipo_Merma`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_merma`
--

LOCK TABLES `tbl_tipo_merma` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_merma` DISABLE KEYS */;
INSERT INTO `tbl_tipo_merma` VALUES (1,'Sobrante Reutilizable','Material sobrante que se puede reutilizar'),(2,'Desperdicio','Material desperdiciado');
/*!40000 ALTER TABLE `tbl_tipo_merma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_movimiento_inventario`
--

DROP TABLE IF EXISTS `tbl_tipo_movimiento_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_movimiento_inventario` (
  `Pk_Id_Tipo_Movimiento_Inventario` int NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Movimiento_Inventario` varchar(100) NOT NULL,
  PRIMARY KEY (`Pk_Id_Tipo_Movimiento_Inventario`),
  UNIQUE KEY `Nombre_Tipo_Movimiento_Inventario` (`Nombre_Tipo_Movimiento_Inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_movimiento_inventario`
--

LOCK TABLES `tbl_tipo_movimiento_inventario` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_movimiento_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipo_movimiento_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_token_restaurarcontrasena`
--

DROP TABLE IF EXISTS `tbl_token_restaurarcontrasena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_token_restaurarcontrasena` (
  `Pk_Id_Token` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Usuario` int DEFAULT NULL,
  `Cmp_Token` varchar(50) DEFAULT NULL,
  `Cmp_Fecha_Creacion_Restaurar_Contrasenea` datetime DEFAULT NULL,
  `Cmp_Expiracion_Restaurar_Contrasenea` datetime DEFAULT NULL,
  `Cmp_Utilizado_Restaurar_Contrasenea` bit(1) DEFAULT NULL,
  `Cmp_Fecha_Uso_Restaurar_Contrasenea` datetime DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Token`),
  KEY `Fk_Token_Usuario` (`Fk_Id_Usuario`),
  CONSTRAINT `Fk_Token_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_token_restaurarcontrasena`
--

LOCK TABLES `tbl_token_restaurarcontrasena` WRITE;
/*!40000 ALTER TABLE `tbl_token_restaurarcontrasena` DISABLE KEYS */;
INSERT INTO `tbl_token_restaurarcontrasena` VALUES (1,2,'C43C63DA','2025-09-21 18:24:01','2025-09-21 18:29:01',_binary '','2025-09-21 18:24:38'),(2,1,'901DA0A1','2025-09-21 18:31:36','2025-09-21 18:36:36',_binary '','2025-09-21 18:32:15'),(3,1,'990DD530','2025-09-22 10:05:46','2025-09-22 10:10:46',_binary '\0',NULL),(4,1,'39C03B58','2025-09-24 20:53:40','2025-09-24 20:58:40',_binary '','2025-09-24 20:54:05'),(5,1,'21BE635F','2025-09-25 08:36:46','2025-09-25 08:41:46',_binary '','2025-09-25 08:37:06'),(6,7,'28F08413','2025-09-26 19:21:51','2025-09-26 19:26:51',_binary '\0',NULL),(7,24,'314418EF','2025-09-27 10:09:06','2025-09-27 10:14:06',_binary '','2025-09-27 10:09:27'),(8,7,'C30808F1','2025-09-27 12:22:20','2025-09-27 12:27:20',_binary '','2025-09-27 12:22:29'),(9,7,'B1AE042A','2025-09-27 12:22:53','2025-09-27 12:27:53',_binary '','2025-09-27 12:23:00'),(10,7,'183E762C','2025-09-27 12:30:45','2025-09-27 12:35:45',_binary '','2025-09-27 12:31:30'),(11,7,'AB7B8C02','2025-09-27 12:34:27','2025-09-27 12:39:27',_binary '','2025-09-27 12:34:54'),(12,7,'76A7D51E','2025-09-27 17:50:00','2025-09-27 17:55:00',_binary '\0',NULL),(13,7,'F8C4776A','2025-09-27 23:49:38','2025-09-27 23:54:38',_binary '','2025-09-27 23:49:52'),(14,1,'DE59E51C','2025-10-06 22:27:35','2025-10-06 22:32:35',_binary '','2025-10-06 22:27:56'),(15,29,'C577F481','2025-10-08 13:30:21','2025-10-08 13:35:21',_binary '','2025-10-08 13:31:09'),(16,12,'F7A08D82','2025-10-12 08:03:14','2025-10-12 08:08:14',_binary '','2025-10-12 08:03:29'),(17,12,'B1B0EC64','2025-10-12 08:05:58','2025-10-12 08:10:58',_binary '','2025-10-12 08:06:12'),(18,7,'A8806F00','2025-10-12 14:48:07','2025-10-12 14:53:07',_binary '\0',NULL),(19,7,'A02EE0D6','2025-10-12 14:57:40','2025-10-12 15:02:40',_binary '','2025-10-12 14:58:16'),(20,47,'C319527A','2025-10-13 17:23:42','2025-10-13 17:28:42',_binary '','2025-10-13 17:24:22'),(21,53,'18AE161D','2025-10-14 18:31:41','2025-10-14 18:36:41',_binary '','2025-10-14 18:32:04'),(22,2,'F1E15FAE','2025-10-18 11:49:09','2025-10-18 11:54:09',_binary '','2025-10-18 11:50:16'),(23,4,'B07EF449','2025-10-18 12:07:34','2025-10-18 12:12:34',_binary '','2025-10-18 12:08:27'),(24,4,'0C76A696','2025-10-18 17:08:53','2025-10-18 17:13:53',_binary '','2025-10-18 17:09:11'),(25,2,'9BAAF4CB','2025-10-21 13:44:20','2025-10-21 13:49:20',_binary '','2025-10-21 13:44:51'),(26,7,'46B0AC97','2025-10-25 14:48:38','2025-10-25 14:53:38',_binary '','2025-10-25 14:48:59');
/*!40000 ALTER TABLE `tbl_token_restaurarcontrasena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_unidad_medida`
--

DROP TABLE IF EXISTS `tbl_unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_unidad_medida` (
  `Pk_Id_Unidad_Medida` int NOT NULL AUTO_INCREMENT,
  `Nombre_Unidad_Medida` varchar(100) NOT NULL,
  `Abreviatura_Unidad_Medida` varchar(20) NOT NULL,
  PRIMARY KEY (`Pk_Id_Unidad_Medida`),
  UNIQUE KEY `Abreviatura_Unidad_Medida` (`Abreviatura_Unidad_Medida`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_unidad_medida`
--

LOCK TABLES `tbl_unidad_medida` WRITE;
/*!40000 ALTER TABLE `tbl_unidad_medida` DISABLE KEYS */;
INSERT INTO `tbl_unidad_medida` VALUES (1,'Metro','m'),(2,'Unidad','U'),(3,'Kilogramo','kg'),(4,'Unidad','und'),(5,'Litro','lt'),(6,'Yarda','yd');
/*!40000 ALTER TABLE `tbl_unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario` (
  `Pk_Id_Usuario` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Empleado` int DEFAULT NULL,
  `Cmp_Nombre_Usuario` varchar(50) DEFAULT NULL,
  `Cmp_Contrasena_Usuario` varchar(65) DEFAULT NULL,
  `Cmp_Intentos_Fallidos_Usuario` int DEFAULT NULL,
  `Cmp_Estado_Usuario` bit(1) DEFAULT NULL,
  `Cmp_FechaCreacion_Usuario` datetime DEFAULT NULL,
  `Cmp_Ultimo_Cambio_Contrasenea` datetime DEFAULT NULL,
  `Cmp_Pidio_Cambio_Contrasenea` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Usuario`),
  KEY `Fk_Usuario_Empleado` (`Fk_Id_Empleado`),
  CONSTRAINT `Fk_Usuario_Empleado` FOREIGN KEY (`Fk_Id_Empleado`) REFERENCES `tbl_empleado` (`Pk_Id_Empleado`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (4,2,'brandon','45297c633d331e6ac35169ebaaf75bc7fafd206ebb59ba4efd80566936e46eb0',0,_binary '','2025-09-21 20:49:54','2025-10-18 17:09:11',_binary '\0'),(23,3,'admin','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9',0,_binary '','2025-09-26 20:45:53','2025-09-26 20:45:53',_binary '\0'),(69,3,'UserApi','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,_binary '','2026-05-10 20:15:54','2026-05-10 20:15:54',_binary '\0');
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_perfil`
--

DROP TABLE IF EXISTS `tbl_usuario_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario_perfil` (
  `Fk_Id_Usuario` int NOT NULL,
  `Fk_Id_Perfil` int NOT NULL,
  PRIMARY KEY (`Fk_Id_Usuario`,`Fk_Id_Perfil`),
  KEY `Fk_UsuarioPerfil_Perfil` (`Fk_Id_Perfil`),
  CONSTRAINT `Fk_UsuarioPerfil_Perfil` FOREIGN KEY (`Fk_Id_Perfil`) REFERENCES `tbl_perfil` (`Pk_Id_Perfil`),
  CONSTRAINT `Fk_UsuarioPerfil_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_perfil`
--

LOCK TABLES `tbl_usuario_perfil` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_perfil` DISABLE KEYS */;
INSERT INTO `tbl_usuario_perfil` VALUES (4,1),(69,1);
/*!40000 ALTER TABLE `tbl_usuario_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_listado_cierres`
--

DROP TABLE IF EXISTS `vw_listado_cierres`;
/*!50001 DROP VIEW IF EXISTS `vw_listado_cierres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_listado_cierres` AS SELECT 
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_listado_cierres`
--

/*!50001 DROP VIEW IF EXISTS `vw_listado_cierres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_listado_cierres` AS select 1 AS `id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-19 18:42:32


use bd_mrp2;

INSERT INTO `bd_mrp2`.`tbl_aplicacion` (`Pk_Id_Aplicacion`, `Fk_Id_Reporte_Aplicacion`, `Cmp_Nombre_Aplicacion`, `Cmp_Descripcion_Aplicacion`, `Cmp_Estado_Aplicacion`) 
VALUES 
(732, NULL, 'Encabezado Orden Material', 'Ordenes de compras de materiales', b'1'),
(733, NULL, 'Detalle Orden Material', 'Todos los materiales de una orden', b'1'),
(734, NULL, 'Explosión Materiales', 'Cabecera de explosión de materiales', b'1'),
(735, NULL, 'Detalle Explosión Materiales', 'Detalle de explosión con cantidades y merma', b'1'),
(736, NULL, 'Recetas', 'Gestion de recetas o listas de materiales', b'1'),
(737, NULL, 'Producción', 'Gestion de ordenes y planes de produccion', b'1'),
(738, NULL, 'Recepciones', 'Cabecera de recepcion de materiales', b'1'),
(739, NULL, 'Detalle Recepciones', 'Detalle de materiales recibidos', b'1'),
(740, NULL, 'Costos Fases', 'Gestion de costos por fase de produccion', b'1');

-- -----------------------------------------------------
-- Table `educativo`.`Facultades`
-- -----------------------------------------------------
CREATE TABLE facultades
(
  codigo_facultad VARCHAR(5),
  nombre_facultad VARCHAR(45),
  estatus_facultad VARCHAR(1),
  PRIMARY KEY (codigo_facultad)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;