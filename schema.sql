-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2024 a las 15:59:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12
-- -------------------------------------------------------
-- ESTRUCTURA PARA LA BASE DE DATOS: iot
-- -------------------------------------------------------
-- Eliminar la base de datos si existe y crearla de nuevo
DROP DATABASE IF EXISTS iot;

CREATE DATABASE IF NOT EXISTS iot CHARACTER SET utf8 COLLATE utf8_bin;

-- Usar la base de datos rrhh
USE iot;

-- Configuración inicial
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;


-- Configuración del juego de caracteres
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8 */
;

-- -------------------------------------------------------
-- Tabla: devices
-- -------------------------------------------------------
CREATE TABLE devices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ip VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    mqtt_topic VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE sensor_readings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    value FLOAT,
    unit VARCHAR(50),
    FOREIGN KEY (device_id) REFERENCES devices(id)
);

CREATE TABLE actuator_commands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    command VARCHAR(255),
    status VARCHAR(50),
    FOREIGN KEY (device_id) REFERENCES devices(id)
);

-- Finalizar transacción
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;