
-- -----------------------------------------------------
-- SITE-02
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `SITE-02` DEFAULT CHARACTER SET utf8 ;
USE `SITE-02` ;

-- -----------------------------------------------------
-- Table `SITE-02`.`ALUNO2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-02`.`ALUNO2` (
  `ID` INT NOT NULL,
  `MATRICULA` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  `IDADE` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(45) NOT NULL,
  `CR` FLOAT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SITE-02`.`INSCRICAO2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-02`.`INSCRICAO2` (
  `ID_ALN` INT NOT NULL,
  `ID_DSCPLN` INT NOT NULL,
  `PERIODO` VARCHAR(15) NOT NULL,
  `TURMA` VARCHAR(10) NOT NULL,
  `NOTA_FINAL` FLOAT NULL,
  PRIMARY KEY (`ID_ALN`, `ID_DSCPLN`, `PERIODO`),
  INDEX `fk_Inscricao_Aluno_idx` (`ID_ALN` ASC),
  CONSTRAINT `fk_Inscricao_Aluno`
    FOREIGN KEY (`ID_ALN`)
    REFERENCES `SITE-02`.`ALUNO2` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- INSERTS
-- -----------------------------------------------------

INSERT INTO `SITE-02`.`ALUNO2` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (4, 10821304, "Sophia Cavalcanti", 16, "SP", 6.02);
INSERT INTO `SITE-02`.`ALUNO2` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (5, 10821305, "Felipe Rocha", 16, "SP", 9.57);
INSERT INTO `SITE-02`.`ALUNO2` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (6, 10821306, "Beatriz Azevedo", 22, "SP", 7.49);

INSERT INTO `SITE-02`.`INSCRICAO2` (`ID_ALN`, `ID_DSCPLN`, `PERIODO`, `TURMA`, `NOTA_FINAL`) VALUES (4, 107, "2001-01", "C2", 5.05);
INSERT INTO `SITE-02`.`INSCRICAO2` (`ID_ALN`, `ID_DSCPLN`, `PERIODO`, `TURMA`, `NOTA_FINAL`) VALUES (5, 501, "2005-01", "B7", 4.00);
INSERT INTO `SITE-02`.`INSCRICAO2` (`ID_ALN`, `ID_DSCPLN`, `PERIODO`, `TURMA`, `NOTA_FINAL`) VALUES (6, 402, "2013-01", "D1", 8.22);
