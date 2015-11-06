SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Proyecto_Paginas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Proyecto_Paginas` ;
CREATE SCHEMA IF NOT EXISTS `Proyecto_Paginas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Proyecto_Paginas` ;

-- -----------------------------------------------------
-- Table `Proyecto_Paginas`.`Empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto_Paginas`.`Empleados` ;

CREATE TABLE IF NOT EXISTS `Proyecto_Paginas`.`Empleados` (
  `idEmpleados` INT NOT NULL,
  `Nombre_Empleado` VARCHAR(45) NULL,
  `Apellido_Empleado` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Direccion_Empleado` VARCHAR(45) NULL,
  `Cargo` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Paginas`.`Establecimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto_Paginas`.`Establecimiento` ;

CREATE TABLE IF NOT EXISTS `Proyecto_Paginas`.`Establecimiento` (
  `idEstablecimiento` INT NOT NULL,
  `Nombre_Establecimiento` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstablecimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Paginas`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto_Paginas`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `Proyecto_Paginas`.`Clientes` (
  `idClientes` INT NOT NULL,
  `Nombre_Cliente` VARCHAR(45) NULL,
  `Apellido_Cliente` VARCHAR(45) NULL,
  `Direccion_Cliente` VARCHAR(45) NULL,
  `Telefono_Cliente` VARCHAR(45) NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Paginas`.`Mesa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto_Paginas`.`Mesa` ;

CREATE TABLE IF NOT EXISTS `Proyecto_Paginas`.`Mesa` (
  `idMesa` INT NOT NULL,
  `Numero_Mesa` VARCHAR(45) NULL,
  PRIMARY KEY (`idMesa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Paginas`.`Reservaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto_Paginas`.`Reservaciones` ;

CREATE TABLE IF NOT EXISTS `Proyecto_Paginas`.`Reservaciones` (
  `idReservaciones` INT NOT NULL,
  `Fecha_Reservacion` VARCHAR(45) NULL,
  `Clientes_idClientes` INT NOT NULL,
  `Mesa_idMesa` INT NOT NULL,
  `Establecimiento_idEstablecimiento` INT NOT NULL,
  PRIMARY KEY (`idReservaciones`),
  INDEX `fk_Reservaciones_Clientes1_idx` (`Clientes_idClientes` ASC),
  INDEX `fk_Reservaciones_Mesa1_idx` (`Mesa_idMesa` ASC),
  INDEX `fk_Reservaciones_Establecimiento1_idx` (`Establecimiento_idEstablecimiento` ASC),
  CONSTRAINT `fk_Reservaciones_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `Proyecto_Paginas`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservaciones_Mesa1`
    FOREIGN KEY (`Mesa_idMesa`)
    REFERENCES `Proyecto_Paginas`.`Mesa` (`idMesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservaciones_Establecimiento1`
    FOREIGN KEY (`Establecimiento_idEstablecimiento`)
    REFERENCES `Proyecto_Paginas`.`Establecimiento` (`idEstablecimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Paginas`.`Platos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto_Paginas`.`Platos` ;

CREATE TABLE IF NOT EXISTS `Proyecto_Paginas`.`Platos` (
  `idPlatos` INT NOT NULL,
  `Nombre_Plato` VARCHAR(45) NULL,
  `Precio_Plato` VARCHAR(45) NULL,
  PRIMARY KEY (`idPlatos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Paginas`.`Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto_Paginas`.`Factura` ;

CREATE TABLE IF NOT EXISTS `Proyecto_Paginas`.`Factura` (
  `idFactura` INT NOT NULL,
  `Fecha` VARCHAR(45) NULL,
  `Clientes_idClientes` INT NOT NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_Factura_Clientes1_idx` (`Clientes_idClientes` ASC),
  INDEX `fk_Factura_Empleados1_idx` (`Empleados_idEmpleados` ASC),
  CONSTRAINT `fk_Factura_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `Proyecto_Paginas`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Empleados1`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `Proyecto_Paginas`.`Empleados` (`idEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Paginas`.`Detalle_Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto_Paginas`.`Detalle_Factura` ;

CREATE TABLE IF NOT EXISTS `Proyecto_Paginas`.`Detalle_Factura` (
  `Platos_idPlatos` INT NOT NULL,
  `Factura_idFactura` INT NOT NULL,
  `idDetalle` VARCHAR(45) NOT NULL,
  INDEX `fk_Detalle_Factura_Platos1_idx` (`Platos_idPlatos` ASC),
  INDEX `fk_Detalle_Factura_Factura1_idx` (`Factura_idFactura` ASC),
  PRIMARY KEY (`idDetalle`),
  CONSTRAINT `fk_Detalle_Factura_Platos1`
    FOREIGN KEY (`Platos_idPlatos`)
    REFERENCES `Proyecto_Paginas`.`Platos` (`idPlatos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Factura_Factura1`
    FOREIGN KEY (`Factura_idFactura`)
    REFERENCES `Proyecto_Paginas`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Paginas`.`Factura_Mesa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto_Paginas`.`Factura_Mesa` ;

CREATE TABLE IF NOT EXISTS `Proyecto_Paginas`.`Factura_Mesa` (
  `Mesa_idMesa` INT NOT NULL,
  `Factura_idFactura` INT NOT NULL,
  INDEX `fk_Mesa_has_Factura_Factura1_idx` (`Factura_idFactura` ASC),
  INDEX `fk_Mesa_has_Factura_Mesa1_idx` (`Mesa_idMesa` ASC),
  CONSTRAINT `fk_Mesa_has_Factura_Mesa1`
    FOREIGN KEY (`Mesa_idMesa`)
    REFERENCES `Proyecto_Paginas`.`Mesa` (`idMesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mesa_has_Factura_Factura1`
    FOREIGN KEY (`Factura_idFactura`)
    REFERENCES `Proyecto_Paginas`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
