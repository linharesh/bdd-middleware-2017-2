-- -----------------------------------------------------
-- SITE-01
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `SITE-01` DEFAULT CHARACTER SET utf8 ;
USE `SITE-01` ;

-- -----------------------------------------------------
-- Table `SITE-01`.`Aluno1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-01`.`Aluno1` (
  `ID` INT NOT NULL,
  `MATRICULA` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  `IDADE` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(45) NOT NULL,
  `CR` FLOAT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SITE-01`.`Disciplina1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-01`.`Disciplina1` (
  `ID` INT NOT NULL,
  `CARGA_HORARIA` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SITE-01`.`Inscricao1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-01`.`Inscricao1` (
  `ALUNO_ID` INT NOT NULL,
  `DISCIPLINA_ID` INT NOT NULL,
  `DATA` DATETIME NOT NULL,
  PRIMARY KEY (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`),
  INDEX `fk_DisciplinaCursada_Aluno_idx` (`ALUNO_ID` ASC),
  INDEX `fk_Inscricao_Disciplina1_idx` (`DISCIPLINA_ID` ASC),
  CONSTRAINT `fk_DisciplinaCursada_Aluno`
    FOREIGN KEY (`ALUNO_ID`)
    REFERENCES `SITE-01`.`Aluno1` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inscricao_Disciplina1`
    FOREIGN KEY (`DISCIPLINA_ID`)
    REFERENCES `SITE-01`.`Disciplina1` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- INSERTS
-- -----------------------------------------------------

INSERT INTO `SITE-01`.`Aluno1` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (1, 1, "Dimas Njord", 17, "RJ", 7.24);
INSERT INTO `SITE-01`.`Aluno1` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (2, 2, "Ruby Stewart", 15, "RJ", 9.01);
INSERT INTO `SITE-01`.`Aluno1` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (3, 3, "Stephen Salter", 27, "RJ", 8.49);

INSERT INTO `SITE-01`.`Disciplina1` (`ID`, `CARGA_HORARIA`, `NOME`) VALUES (100, '120', 'Estrutura de Dados');
INSERT INTO `SITE-01`.`Disciplina1` (`ID`, `CARGA_HORARIA`, `NOME`) VALUES (200, '200', 'Algoritmos em C');
INSERT INTO `SITE-01`.`Disciplina1` (`ID`, `CARGA_HORARIA`, `NOME`) VALUES (300, '175', 'Banco de dados Distribuidos');

INSERT INTO `SITE-01`.`Inscricao1` (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`) VALUES (1, 100, '2006-12-17');
INSERT INTO `SITE-01`.`Inscricao1` (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`) VALUES (2, 200, '2008-06-05');
INSERT INTO `SITE-01`.`Inscricao1` (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`) VALUES (3, 300, '2005-12-15');
