
-- -----------------------------------------------------
-- SITE-03
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `SITE-03` DEFAULT CHARACTER SET utf8 ;
USE `SITE-03` ;

-- -----------------------------------------------------
-- Table `SITE-03`.`ALUNO3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-03`.`ALUNO3` (
  `ID` INT NOT NULL,
  `MATRICULA` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  `IDADE` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(45) NOT NULL,
  `CR` FLOAT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SITE-03`.`INSCRICAO3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-03`.`INSCRICAO3` (
  `ID_ALN` INT NOT NULL,
  `ID_DSCPLN` INT NOT NULL,
  `PERIODO` VARCHAR(15) NOT NULL,
  `TURMA` VARCHAR(10) NOT NULL,
  `NOTA_FINAL` FLOAT NULL,
  PRIMARY KEY (`ID_ALN`, `ID_DSCPLN`, `PERIODO`),
  INDEX `fk_Inscricao_Aluno_idx` (`ID_ALN` ASC),
  CONSTRAINT `fk_Inscricao_Aluno`
    FOREIGN KEY (`ID_ALN`)
    REFERENCES `SITE-03`.`ALUNO3` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- INSERTS
-- -----------------------------------------------------

INSERT INTO `SITE-03`.`ALUNO3` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (7, 108213047, "Renan Barros", 14, "MT", 7.00);
INSERT INTO `SITE-03`.`ALUNO3` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (8, 108213048, "Gabrielle Sousa", 25, "TO", 6.57);
INSERT INTO `SITE-03`.`ALUNO3` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (9, 108213049, "Leonor Pereira", 19, "SC", 8.71);

INSERT INTO `SITE-03`.`INSCRICAO3` (`ID_ALN`, `ID_DSCPLN`, `PERIODO`, `TURMA`, `NOTA_FINAL`) VALUES (7, 109, "2002-01", "A1", 5.05);
INSERT INTO `SITE-03`.`INSCRICAO3` (`ID_ALN`, `ID_DSCPLN`, `PERIODO`, `TURMA`, `NOTA_FINAL`) VALUES (8, 801, "2014-02", "E3", 4.92);
INSERT INTO `SITE-03`.`INSCRICAO3` (`ID_ALN`, `ID_DSCPLN`, `PERIODO`, `TURMA`, `NOTA_FINAL`) VALUES (9, 309, "2010-02", "A2", 8.22);

