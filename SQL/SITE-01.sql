
-- -----------------------------------------------------
-- SITE-01
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `SITE-01` DEFAULT CHARACTER SET utf8 ;
USE `SITE-01` ;

-- -----------------------------------------------------
-- Table `SITE-01`.`ALUNO1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-01`.`ALUNO1` (
  `ID` INT NOT NULL,
  `MATRICULA` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  `IDADE` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(45) NOT NULL,
  `CR` FLOAT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SITE-01`.`INSCRICAO1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-01`.`INSCRICAO1` (
  `ID_ALN` INT NOT NULL,
  `ID_DSCPLN` INT NOT NULL,
  `PERIODO` VARCHAR(15) NOT NULL,
  `TURMA` VARCHAR(10) NOT NULL,
  `NOTA_FINAL` FLOAT NULL,
  PRIMARY KEY (`ID_ALN`, `ID_DSCPLN`, `PERIODO`),
  INDEX `fk_Inscricao_Aluno_idx` (`ID_ALN` ASC),
  CONSTRAINT `fk_Inscricao_Aluno`
    FOREIGN KEY (`ID_ALN`)
    REFERENCES `SITE-01`.`ALUNO1` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- INSERTS
-- -----------------------------------------------------

INSERT INTO `SITE-01`.`ALUNO1` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (1, 10821301, "Dimas Njord", 17, "RJ", 7.24);
INSERT INTO `SITE-01`.`ALUNO1` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (2, 10821302, "Ruby Stewart", 15, "RJ", 9.01);
INSERT INTO `SITE-01`.`ALUNO1` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (3, 10821303, "Stephen Salter", 27, "RJ", 8.49);

INSERT INTO `SITE-01`.`INSCRICAO1` (`ID_ALN`, `ID_DSCPLN`, `PERIODO`, `TURMA`, `NOTA_FINAL`) VALUES (1, 101, "2006-1", "B2", 7.55);
INSERT INTO `SITE-01`.`INSCRICAO1` (`ID_ALN`, `ID_DSCPLN`, `PERIODO`, `TURMA`, `NOTA_FINAL`) VALUES (2, 201, "2007-01", "A7", 5.55);
INSERT INTO `SITE-01`.`INSCRICAO1` (`ID_ALN`, `ID_DSCPLN`, `PERIODO`, `TURMA`, `NOTA_FINAL`) VALUES (3, 403, "2012-02", "C1", 9.94);
