-- -----------------------------------------------------
-- SITE-02
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `SITE-02` DEFAULT CHARACTER SET utf8 ;
USE `SITE-02` ;

-- -----------------------------------------------------
-- Table `SITE-02`.`Aluno2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-02`.`Aluno2` (
  `ID` INT NOT NULL,
  `MATRICULA` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  `IDADE` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(45) NOT NULL,
  `CR` FLOAT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SITE-02`.`Disciplina2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-02`.`Disciplina2` (
  `ID` INT NOT NULL,
  `CARGA_HORARIA` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SITE-02`.`Inscricao2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SITE-02`.`Inscricao2` (
  `ALUNO_ID` INT NOT NULL,
  `DISCIPLINA_ID` INT NOT NULL,
  `DATA` DATETIME NOT NULL,
  PRIMARY KEY (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`),
  INDEX `fk_DisciplinaCursada_Aluno_idx` (`ALUNO_ID` ASC),
  INDEX `fk_Inscricao_Disciplina2_idx` (`DISCIPLINA_ID` ASC),
  CONSTRAINT `fk_DisciplinaCursada_Aluno`
    FOREIGN KEY (`ALUNO_ID`)
    REFERENCES `SITE-02`.`Aluno2` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inscricao_Disciplina2`
    FOREIGN KEY (`DISCIPLINA_ID`)
    REFERENCES `SITE-02`.`Disciplina2` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- INSERTS
-- -----------------------------------------------------

INSERT INTO `SITE-02`.`ALUNO2` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (4, 4, "Sophia Cavalcanti", 16, "SP", 6.02);
INSERT INTO `SITE-02`.`ALUNO2` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (5, 5, "Felipe Rocha", 16, "SP", 9.57);
INSERT INTO `SITE-02`.`ALUNO2` (`ID`, `MATRICULA`, `NOME`, `IDADE`, `ESTADO`, `CR`) VALUES (6, 6, "Beatriz Azevedo", 22, "SP", 7.49);

INSERT INTO `SITE-02`.`Disciplina2` (`ID`, `CARGA_HORARIA`, `NOME`) VALUES (400, '120', 'Sistemas Operacionais');
INSERT INTO `SITE-02`.`Disciplina2` (`ID`, `CARGA_HORARIA`, `NOME`) VALUES (500, '200', 'Algebra Linear');
INSERT INTO `SITE-02`.`Disciplina2` (`ID`, `CARGA_HORARIA`, `NOME`) VALUES (600, '175', 'Algoritmos em Python');

INSERT INTO `SITE-02`.`Inscricao2` (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`) VALUES (4, 400, '2016-12-18');
INSERT INTO `SITE-02`.`Inscricao2` (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`) VALUES (5, 500, '2004-06-04');
INSERT INTO `SITE-02`.`Inscricao2` (`ALUNO_ID`, `DISCIPLINA_ID`, `DATA`) VALUES (6, 600, '2006-12-14');
