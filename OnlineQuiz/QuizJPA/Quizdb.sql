-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema quizdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `quizdb` ;

-- -----------------------------------------------------
-- Schema quizdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quizdb` DEFAULT CHARACTER SET utf8 ;
USE `quizdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quiz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quiz` ;

CREATE TABLE IF NOT EXISTS `quiz` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `score`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `score` ;

CREATE TABLE IF NOT EXISTS `score` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `quiz_id` INT NULL,
  `value` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_score_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_score_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `question` ;

CREATE TABLE IF NOT EXISTS `question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quiz_id` INT NULL,
  `questionText` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quiz_question _quiz_id_idx` (`quiz_id` ASC),
  CONSTRAINT `fk_quiz_question _quiz_id`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `quiz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `answer` ;

CREATE TABLE IF NOT EXISTS `answer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `question_id` INT NULL,
  `answerText` VARCHAR(255) NULL,
  `isCorrect` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_question_answer_question_id_idx` (`question_id` ASC),
  CONSTRAINT `fk_question_answer_question_id`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `quizdb`;
INSERT INTO `user` (`id`, `username`, `password`) VALUES (1, 'MickeyMouse', '12345');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (2, 'DonaldDuck', '12345');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (3, 'BugsBunny', '12345');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (4, 'DonaldDuck', '12345');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (5, 'TolandGooch', '12345');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (6, 'PorkyPig', '12345');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (7, 'KrustyKlown', '12345');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (8, 'FoggyhornBarnYard', '12345');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (9, 'KermitFrog', '12345');
INSERT INTO `user` (`id`, `username`, `password`) VALUES (10, 'MissPiggy', '12345');

COMMIT;


-- -----------------------------------------------------
-- Data for table `quiz`
-- -----------------------------------------------------
START TRANSACTION;
USE `quizdb`;
INSERT INTO `quiz` (`id`, `name`) VALUES (1, 'English');
INSERT INTO `quiz` (`id`, `name`) VALUES (2, 'Science');
INSERT INTO `quiz` (`id`, `name`) VALUES (3, 'Math 1');
INSERT INTO `quiz` (`id`, `name`) VALUES (4, 'Algebra');
INSERT INTO `quiz` (`id`, `name`) VALUES (5, 'Earth Science');
INSERT INTO `quiz` (`id`, `name`) VALUES (6, 'Political Science');
INSERT INTO `quiz` (`id`, `name`) VALUES (7, 'Biology');
INSERT INTO `quiz` (`id`, `name`) VALUES (8, 'Physical Ed');

COMMIT;


-- -----------------------------------------------------
-- Data for table `score`
-- -----------------------------------------------------
START TRANSACTION;
USE `quizdb`;
INSERT INTO `score` (`id`, `user_id`, `quiz_id`, `value`) VALUES (1, 1, 1, '80');
INSERT INTO `score` (`id`, `user_id`, `quiz_id`, `value`) VALUES (2, 2, 1, '100');
INSERT INTO `score` (`id`, `user_id`, `quiz_id`, `value`) VALUES (3, 2, 2, '60');
INSERT INTO `score` (`id`, `user_id`, `quiz_id`, `value`) VALUES (4, 3, 1, '65');

COMMIT;


-- -----------------------------------------------------
-- Data for table `question`
-- -----------------------------------------------------
START TRANSACTION;
USE `quizdb`;
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (1, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (2, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (3, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (4, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (5, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (6, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (7, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (8, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (9, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (10, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (11, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (12, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (13, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (14, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (15, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (16, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (17, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (18, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (19, 1, 'This is an test question for test test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (20, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (21, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (22, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (23, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (24, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (25, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (26, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (27, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (28, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (29, 2, 'This is an test question for Science test?');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (30, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (31, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (32, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (33, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (34, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (35, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (36, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (37, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (38, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (39, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (40, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (41, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (42, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (44, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (45, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (46, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (47, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (48, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (49, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (50, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (51, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (52, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (53, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (54, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (55, 3, 'This is a math question guy....');
INSERT INTO `question` (`id`, `quiz_id`, `questionText`) VALUES (56, 3, 'This is a math question guy....');

COMMIT;


-- -----------------------------------------------------
-- Data for table `answer`
-- -----------------------------------------------------
START TRANSACTION;
USE `quizdb`;
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (1, 1, 'this is Test', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (2, 1, 'this is Test', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (3, 2, 'science', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (4, 2, 'science', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (5, 3, 'math', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (6, 3, 'math', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (7, 1, 'this is Test', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (8, 1, 'this is Test', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (9, 2, 'science', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (10, 2, 'science', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (11, 3, 'math', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (12, 3, 'math', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (13, 1, 'this is Test', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (14, 1, 'this is Test', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (15, 2, 'science', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (16, 2, 'science', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (17, 3, 'math', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (18, 3, 'math', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (19, 1, 'this is Test', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (20, 1, 'this is Test', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (21, 2, 'science', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (22, 2, 'science', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (23, 3, 'math', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (24, 3, 'math', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (25, 1, 'this is Test', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (26, 1, 'this is Test', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (27, 2, 'science', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (28, 2, 'science', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (29, 3, 'math', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (30, 3, 'math', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (31, 1, 'this is Test', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (32, 1, 'this is Test', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (33, 2, 'science', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (34, 2, 'science', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (35, 3, 'math', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (36, 3, 'math', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (37, 1, 'this is Test', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (38, 1, 'this is Test', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (39, 2, 'science', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (40, 2, 'science', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (41, 3, 'math', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (42, 3, 'math', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (43, 1, 'this is Test', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (44, 1, 'this is Test', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (45, 2, 'science', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (46, 2, 'science', 1);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (47, 3, 'math', 0);
INSERT INTO `answer` (`id`, `question_id`, `answerText`, `isCorrect`) VALUES (48, 3, 'math', 1);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
