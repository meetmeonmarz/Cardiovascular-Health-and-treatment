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
-- Table `mydb`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patients` (
  `idPatients` VARCHAR(45) NOT NULL,
  `height` INT NULL,
  `age` INT NULL,
  `weight` INT NULL,
  `sex` VARCHAR(45) NULL,
  `ethnicity` VARCHAR(45) NULL,
  `systolicBP` INT NULL,
  `diastolicBP` INT NULL,
  `cholesterol` FLOAT NULL,
  `glucose` FLOAT NULL,
  `smokeResponse` TINYINT NULL,
  `vapeResponse` TINYINT NULL,
  `alcoholIntake` INT NULL,
  `physicalActivity` INT NULL,
  `currentCVD` VARCHAR(45) NULL,
  PRIMARY KEY (`idPatients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AvailableTreatments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AvailableTreatments` (
  `idTreatmentPlan` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `type` TEXT NULL,
  PRIMARY KEY (`idTreatmentPlan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Results`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Results` (
  `idResults` VARCHAR(45) NOT NULL,
  `systolicFinal` INT NULL,
  `diastolicFinal` INT NULL,
  `cholesterolFinal` INT NULL,
  `glucoseFinal` INT NULL,
  `desc` TEXT(10) NULL,
  PRIMARY KEY (`idResults`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Treatment` (
  `idTreatment` VARCHAR(45) NOT NULL,
  `idPatients` VARCHAR(45) NULL,
  `idResults` VARCHAR(45) NULL,
  `lengthPrescribed` INT NULL,
  `idTreatmentPlan` VARCHAR(45) NULL,
  PRIMARY KEY (`idTreatment`),
  INDEX `idPatient_idx` (`idPatients` ASC) VISIBLE,
  INDEX `idTreatmentPlan_idx` (`idTreatmentPlan` ASC) VISIBLE,
  INDEX `idResult_idx` (`idResults` ASC) VISIBLE,
  CONSTRAINT `idPatients`
    FOREIGN KEY (`idPatients`)
    REFERENCES `mydb`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTreatmentPlan`
    FOREIGN KEY (`idTreatmentPlan`)
    REFERENCES `mydb`.`AvailableTreatments` (`idTreatmentPlan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idResults`
    FOREIGN KEY (`idResults`)
    REFERENCES `mydb`.`Results` (`idResults`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CardiovascularDiseases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CardiovascularDiseases` (
  `idCVD` VARCHAR(45) NOT NULL,
  `diseaseName` TEXT NULL,
  PRIMARY KEY (`idCVD`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
