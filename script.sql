-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`veterinarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veterinarios` (
  `id_veterinarios` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_de_admisssao` INT NOT NULL,
  `salario` INT NOT NULL,
  PRIMARY KEY (`id_veterinarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `CPF` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`animais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`animais` (
  `id_animais` INT NOT NULL,
  `raça` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `ano` DATE NOT NULL,
  `cliente_CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id_animais`),
  INDEX `fk_animais_cliente_idx` (`cliente_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_animais_cliente`
    FOREIGN KEY (`cliente_CPF`)
    REFERENCES `mydb`.`cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`consulta` (
  `id_consulta` INT NOT NULL,
  `data_e_horario` DATETIME NOT NULL,
  `motivo` VARCHAR(45) NOT NULL,
  `veterinarios_id_veterinarios` INT NOT NULL,
  `animais_id_animais` INT NOT NULL,
  PRIMARY KEY (`id_consulta`, `veterinarios_id_veterinarios`, `animais_id_animais`),
  INDEX `fk_consulta_animais1_idx` (`animais_id_animais` ASC) VISIBLE,
  CONSTRAINT `fk_consulta_veterinarios1`
    FOREIGN KEY (`veterinarios_id_veterinarios`)
    REFERENCES `mydb`.`veterinarios` (`id_veterinarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_animais1`
    FOREIGN KEY (`animais_id_animais`)
    REFERENCES `mydb`.`animais` (`id_animais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
