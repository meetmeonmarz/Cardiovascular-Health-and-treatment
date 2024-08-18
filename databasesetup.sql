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
  `idPatients` INT NOT NULL,
  `height` INT NULL,
  `age` INT NULL,
  `weight` INT NULL,
  `sex` VARCHAR(45) NULL,
  `ethnicity` INT NULL,
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
-- Table `mydb`.`Available Treatments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Available Treatments` (
  `idTreatmentPlan` INT NOT NULL,
  `description` TEXT NULL,
  `type` TEXT NULL,
  PRIMARY KEY (`idTreatmentPlan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Results`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Results` (
  `idResults` INT NOT NULL,
  `systolicFinal` INT NULL,
  `diastolicFinal` INT NULL,
  `cholesterolFinal` INT NULL,
  `glucoseFinal` INT NULL,
  `desc` TEXT(10) NULL,
  `idPatient` INT NULL,
  PRIMARY KEY (`idResults`),
  INDEX `idPatient_idx` (`idPatient` ASC) VISIBLE,
  CONSTRAINT `idPatient`
    FOREIGN KEY (`idPatient`)
    REFERENCES `mydb`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Treatment` (
  `idTreatment` INT NOT NULL,
  `idPatients` INT NULL,
  `idResults` INT NULL,
  `lengthPrescribed` INT NULL,
  `idTreatmentPlan` INT NULL,
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
    REFERENCES `mydb`.`Available Treatments` (`idTreatmentPlan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idResults`
    FOREIGN KEY (`idResults`)
    REFERENCES `mydb`.`Results` (`idResults`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cardiovascular Diseases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cardiovascular Diseases` (
  `idCVD` INT NOT NULL,
  `diseaseName` TEXT NULL,
  PRIMARY KEY (`idCVD`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
