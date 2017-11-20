-- -----------------------------------------------------
-- SITE-03
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `SITE-03` DEFAULT CHARACTER SET utf8 ;
USE `SITE-03` ;

-- -----------------------------------------------------
-- Table `SITE-03`.`Aluno3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-03`.`Aluno3` (
  `ID` INT NOT NULL,
  `MATRICULA` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  `IDADE` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(45) NOT NULL,
  `CR` FLOAT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SITE-03`.`Disciplina3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-03`.`Disciplina3` (
  `ID` INT NOT NULL,
  `CARGA_HORARIA` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SITE-03`.`Inscricao3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-03`.`Inscricao3` (
  `ALUNO_ID` INT NOT NULL,
  `DISCIPLINA_ID` INT NOT NULL,
  `DATA` DATETIME NOT NULL,
  PRIMARY KEY (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`),
  INDEX `fk_DisciplinaCursada_Aluno_idx` (`ALUNO_ID` ASC),
  INDEX `fk_Inscricao_Disciplina3_idx` (`DISCIPLINA_ID` ASC),
  CONSTRAINT `fk_DisciplinaCursada_Aluno`
    FOREIGN KEY (`ALUNO_ID`)
    REFERENCES `SITE-03`.`Aluno3` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inscricao_Disciplina3`
    FOREIGN KEY (`DISCIPLINA_ID`)
    REFERENCES `SITE-03`.`Disciplina3` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- INSERTS
-- -----------------------------------------------------

INSERT INTO `SITE-03`.`ALUNO3` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (7, 7, "Sophia Cavalcanti", 14, "MT", 7.00);
INSERT INTO `SITE-03`.`ALUNO3` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (8, 8, "Felipe Rocha", 25, "TO", 6.57);
INSERT INTO `SITE-03`.`ALUNO3` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (9, 9, "Beatriz Azevedo", 19, "SC", 8.71);

INSERT INTO `SITE-03`.`Disciplina3` (`ID`, `CARGA_HORARIA`, `NOME`) VALUES (700, '120', 'Sistemas Distribuidos');
INSERT INTO `SITE-03`.`Disciplina3` (`ID`, `CARGA_HORARIA`, `NOME`) VALUES (800, '200', 'Inteligência Artificial');
INSERT INTO `SITE-03`.`Disciplina3` (`ID`, `CARGA_HORARIA`, `NOME`) VALUES (900, '175', 'Engenharia de Software');

INSERT INTO `SITE-03`.`Inscricao3` (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`) VALUES (7, 700, '2007-12-22');
INSERT INTO `SITE-03`.`Inscricao3` (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`) VALUES (8, 800, '2009-06-01');
INSERT INTO `SITE-03`.`Inscricao3` (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`) VALUES (9, 900, '2002-12-27');
