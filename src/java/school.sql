/*
Navicat MySQL Data Transfer

Source Server         : LocalMySQL
Source Server Version : 50544
Source Host           : 10.0.2.2:3306
Source Database       : school

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2015-08-31 10:46:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `AnneeScolaire`
-- ----------------------------
DROP TABLE IF EXISTS `AnneeScolaire`;
CREATE TABLE `AnneeScolaire` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_di0fgoglial7rxyuhpnx1w44n` (`code_createur`),
  KEY `FK_ssd3vtpnmsc0ro0sjrh686hls` (`code_modificateur`),
  CONSTRAINT `FK_di0fgoglial7rxyuhpnx1w44n` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_ssd3vtpnmsc0ro0sjrh686hls` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of AnneeScolaire
-- ----------------------------
INSERT INTO `AnneeScolaire` VALUES ('1', '2015-08-27 20:32:38', null, 'ACTIF', '2014-01-01', '2015-01-01', null, null);

-- ----------------------------
-- Table structure for `Caisse`
-- ----------------------------
DROP TABLE IF EXISTS `Caisse`;
CREATE TABLE `Caisse` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `soldecourant` double DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_gerant` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_97e2rijhppfcn8a5itudvgeej` (`code_createur`),
  KEY `FK_roqhfq4mo4110tuafnu0awdh1` (`code_modificateur`),
  KEY `FK_5amsp7on4ftbttv7w0w86vgob` (`code_gerant`),
  CONSTRAINT `FK_5amsp7on4ftbttv7w0w86vgob` FOREIGN KEY (`code_gerant`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_97e2rijhppfcn8a5itudvgeej` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_roqhfq4mo4110tuafnu0awdh1` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Caisse
-- ----------------------------

-- ----------------------------
-- Table structure for `Classe`
-- ----------------------------
DROP TABLE IF EXISTS `Classe`;
CREATE TABLE `Classe` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  `code_serie` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_90p197gx30yq80cifr938vtf0` (`code_serie`),
  CONSTRAINT `FK_90p197gx30yq80cifr938vtf0` FOREIGN KEY (`code_serie`) REFERENCES `Serie` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Classe
-- ----------------------------
INSERT INTO `Classe` VALUES ('1', 'TALL1', '1');
INSERT INTO `Classe` VALUES ('2', 'TALL2', '1');
INSERT INTO `Classe` VALUES ('3', 'PALL1', '2');
INSERT INTO `Classe` VALUES ('4', 'PALL2', '2');
INSERT INTO `Classe` VALUES ('5', '6M1', '3');
INSERT INTO `Classe` VALUES ('6', '6M2', '3');
INSERT INTO `Classe` VALUES ('7', 'PESP1', '4');
INSERT INTO `Classe` VALUES ('8', 'PESP2', '4');
INSERT INTO `Classe` VALUES ('9', 'TESP1', '5');
INSERT INTO `Classe` VALUES ('10', 'TESP2', '5');
INSERT INTO `Classe` VALUES ('11', 'TD1', '6');
INSERT INTO `Classe` VALUES ('12', 'TD2', '6');
INSERT INTO `Classe` VALUES ('13', 'TC1', '7');
INSERT INTO `Classe` VALUES ('14', 'TC2', '7');
INSERT INTO `Classe` VALUES ('15', '4ESP1', '8');
INSERT INTO `Classe` VALUES ('16', '4ESP2', '8');
INSERT INTO `Classe` VALUES ('17', '2ALL1', '9');
INSERT INTO `Classe` VALUES ('18', '2ALL2', '9');
INSERT INTO `Classe` VALUES ('19', '2ESP1', '10');
INSERT INTO `Classe` VALUES ('20', '2ESP2', '10');
INSERT INTO `Classe` VALUES ('21', '2C1', '11');
INSERT INTO `Classe` VALUES ('22', '2C2', '11');
INSERT INTO `Classe` VALUES ('23', 'PC1', '12');
INSERT INTO `Classe` VALUES ('24', 'PC2', '12');
INSERT INTO `Classe` VALUES ('25', 'PD1', '13');
INSERT INTO `Classe` VALUES ('26', 'PD2', '13');
INSERT INTO `Classe` VALUES ('27', '4ALL1', '14');
INSERT INTO `Classe` VALUES ('28', '4ALL2', '14');
INSERT INTO `Classe` VALUES ('29', '3ESP1', '15');
INSERT INTO `Classe` VALUES ('30', '3ESP2', '15');
INSERT INTO `Classe` VALUES ('31', '5M1', '16');
INSERT INTO `Classe` VALUES ('32', '5M2', '16');
INSERT INTO `Classe` VALUES ('33', '3ALL1', '17');
INSERT INTO `Classe` VALUES ('34', '3ALL2', '17');

-- ----------------------------
-- Table structure for `Coefficient`
-- ----------------------------
DROP TABLE IF EXISTS `Coefficient`;
CREATE TABLE `Coefficient` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` tinyint(4) NOT NULL,
  `code_matiere` int(11) DEFAULT NULL,
  `code_serie` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_c9dr3fykhtxfkcdn8t3pc4dhe` (`code_matiere`),
  KEY `FK_1y1ue4u13p90xks0n7x7yt9ax` (`code_serie`),
  CONSTRAINT `FK_1y1ue4u13p90xks0n7x7yt9ax` FOREIGN KEY (`code_serie`) REFERENCES `Serie` (`code`),
  CONSTRAINT `FK_c9dr3fykhtxfkcdn8t3pc4dhe` FOREIGN KEY (`code_matiere`) REFERENCES `Matiere` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Coefficient
-- ----------------------------
INSERT INTO `Coefficient` VALUES ('1', '2', '6', '1');
INSERT INTO `Coefficient` VALUES ('2', '2', '7', '1');
INSERT INTO `Coefficient` VALUES ('4', '2', '9', '1');
INSERT INTO `Coefficient` VALUES ('6', '2', '11', '1');
INSERT INTO `Coefficient` VALUES ('7', '2', '12', '1');
INSERT INTO `Coefficient` VALUES ('9', '2', '14', '1');
INSERT INTO `Coefficient` VALUES ('10', '2', '15', '1');
INSERT INTO `Coefficient` VALUES ('16', '2', '1', '1');
INSERT INTO `Coefficient` VALUES ('18', '2', '3', '1');

-- ----------------------------
-- Table structure for `Compte`
-- ----------------------------
DROP TABLE IF EXISTS `Compte`;
CREATE TABLE `Compte` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `numerocompte` varchar(255) DEFAULT NULL,
  `solde` double DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `proprietaire_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_a7r1himif34rs1jh6dxjikwm2` (`code_createur`),
  KEY `FK_p482naimfyx518nrtw3tdxiqi` (`code_modificateur`),
  KEY `FK_2bbae07m2fy5mljikyjippgy7` (`proprietaire_code`),
  CONSTRAINT `FK_2bbae07m2fy5mljikyjippgy7` FOREIGN KEY (`proprietaire_code`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_a7r1himif34rs1jh6dxjikwm2` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_p482naimfyx518nrtw3tdxiqi` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Compte
-- ----------------------------

-- ----------------------------
-- Table structure for `Cours`
-- ----------------------------
DROP TABLE IF EXISTS `Cours`;
CREATE TABLE `Cours` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `duree_heures` smallint(6) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `code_annee` int(11) NOT NULL,
  `code_classe` int(11) NOT NULL,
  `code_professeur` int(11) NOT NULL,
  `matiere` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_j5suuf8yoifca1w95a0oyklr6` (`code_annee`),
  KEY `FK_s9cdopdtxws61hwplou6g5crt` (`code_classe`),
  KEY `FK_jan1jsw59t7f2kfija3iae7u5` (`code_professeur`),
  CONSTRAINT `FK_j5suuf8yoifca1w95a0oyklr6` FOREIGN KEY (`code_annee`) REFERENCES `AnneeScolaire` (`code`),
  CONSTRAINT `FK_jan1jsw59t7f2kfija3iae7u5` FOREIGN KEY (`code_professeur`) REFERENCES `Professeur` (`code`),
  CONSTRAINT `FK_s9cdopdtxws61hwplou6g5crt` FOREIGN KEY (`code_classe`) REFERENCES `Classe` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Cours
-- ----------------------------
INSERT INTO `Cours` VALUES ('1', '8', 'Shawna Perkins-TALL1', '1', '1', '38', 'Education a la Citoyennete');
INSERT INTO `Cours` VALUES ('2', '4', 'Heidi Fulton-TALL1', '1', '1', '36', 'Travail Manuel');
INSERT INTO `Cours` VALUES ('3', '2', 'Matt Glover-TALL1', '1', '1', '34', 'ESF');
INSERT INTO `Cours` VALUES ('4', '5', 'Darren Mullen-TALL1', '1', '1', '28', 'Histoire');

-- ----------------------------
-- Table structure for `Creneau`
-- ----------------------------
DROP TABLE IF EXISTS `Creneau`;
CREATE TABLE `Creneau` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `disponible` bit(1) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Creneau
-- ----------------------------
INSERT INTO `Creneau` VALUES ('1', '07:30:00', '08:30:00', '');
INSERT INTO `Creneau` VALUES ('2', '09:30:00', '10:30:00', '');
INSERT INTO `Creneau` VALUES ('3', '10:30:00', '10:45:00', '');
INSERT INTO `Creneau` VALUES ('4', '10:45:00', '11:45:00', '');
INSERT INTO `Creneau` VALUES ('5', '11:45:00', '12:45:00', '');
INSERT INTO `Creneau` VALUES ('6', '12:45:00', '13:45:00', '');
INSERT INTO `Creneau` VALUES ('7', '13:45:00', '14:30:00', '');
INSERT INTO `Creneau` VALUES ('8', '14:30:00', '15:30:00', '');
INSERT INTO `Creneau` VALUES ('9', '15:30:00', '16:30:00', '');

-- ----------------------------
-- Table structure for `Droit`
-- ----------------------------
DROP TABLE IF EXISTS `Droit`;
CREATE TABLE `Droit` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `parametres` longtext,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_profil` int(11) NOT NULL,
  `code_rubrique` int(11) NOT NULL,
  `code_service` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_psyfx2b0uiiiib1xxwy7f8bio` (`code_createur`),
  KEY `FK_91sechnf3hu0ffkb5c8tjci2e` (`code_modificateur`),
  KEY `FK_n6vtej6pirtyi8mx5dijj2xav` (`code_profil`),
  KEY `FK_56xhiux27xw2abg9xmujhgpgm` (`code_rubrique`),
  KEY `FK_8na8h3xi1slyp9hthw51hj3fd` (`code_service`),
  CONSTRAINT `FK_56xhiux27xw2abg9xmujhgpgm` FOREIGN KEY (`code_rubrique`) REFERENCES `Rubrique` (`code`),
  CONSTRAINT `FK_8na8h3xi1slyp9hthw51hj3fd` FOREIGN KEY (`code_service`) REFERENCES `Services` (`code`),
  CONSTRAINT `FK_91sechnf3hu0ffkb5c8tjci2e` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_n6vtej6pirtyi8mx5dijj2xav` FOREIGN KEY (`code_profil`) REFERENCES `Profil` (`code`),
  CONSTRAINT `FK_psyfx2b0uiiiib1xxwy7f8bio` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Droit
-- ----------------------------

-- ----------------------------
-- Table structure for `Ecole`
-- ----------------------------
DROP TABLE IF EXISTS `Ecole`;
CREATE TABLE `Ecole` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email_adresse` varchar(100) DEFAULT NULL,
  `telephone_mobile` varchar(100) DEFAULT NULL,
  `boite_postale` varchar(255) DEFAULT NULL,
  `siteweb` varchar(255) DEFAULT NULL,
  `logo` longblob,
  `nom` varchar(255) NOT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_principal` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_bkxa9uuka3grxxry4gn5qijwr` (`code_createur`),
  KEY `FK_ew1cpmbyk2byt09aril22vu7p` (`code_modificateur`),
  KEY `FK_rt3h7oj5lscggudaxkm60cpbr` (`code_principal`),
  CONSTRAINT `FK_bkxa9uuka3grxxry4gn5qijwr` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_ew1cpmbyk2byt09aril22vu7p` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_rt3h7oj5lscggudaxkm60cpbr` FOREIGN KEY (`code_principal`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Ecole
-- ----------------------------
INSERT INTO `Ecole` VALUES ('1', null, null, null, 'Obili-Yaounde', null, '237679994949', null, null, null, 'College Test', null, null, null);

-- ----------------------------
-- Table structure for `Eleve`
-- ----------------------------
DROP TABLE IF EXISTS `Eleve`;
CREATE TABLE `Eleve` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email_adresse` varchar(100) DEFAULT NULL,
  `telephone_mobile` varchar(100) DEFAULT NULL,
  `civilite` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `nom_prenom` varchar(255) NOT NULL,
  `numero_cni` int(11) DEFAULT NULL,
  `nom_mere` varchar(255) DEFAULT NULL,
  `nom_pere` varchar(255) DEFAULT NULL,
  `photo` longblob,
  `profession_mere` varchar(255) DEFAULT NULL,
  `profession_pere` varchar(255) DEFAULT NULL,
  `telephone_mere` varchar(255) DEFAULT NULL,
  `telephone_pere` varchar(255) DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_im1t4vjai99l27rgwmf9hpnmp` (`code_createur`),
  KEY `FK_attpr6tvuresny79vovy3sw3q` (`code_modificateur`),
  CONSTRAINT `FK_attpr6tvuresny79vovy3sw3q` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_im1t4vjai99l27rgwmf9hpnmp` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Eleve
-- ----------------------------
INSERT INTO `Eleve` VALUES ('1', '2015-08-27 20:42:56', null, null, null, 'csuarez@b1zmail.org', '237 29728131', 'M', '1997-03-01', 'Dixie', 'Lindsey Craft', null, 'Mariah Holcomb', 'Wayne Vasquez', null, null, null, '237 49565512', '237 91460091', '1', null);
INSERT INTO `Eleve` VALUES ('2', '2015-08-27 20:42:57', null, null, null, 'alwaysit@ma1l2u.us', '237 78423976', 'MLLE', '2003-07-30', 'Ellabelle', 'Jan Patton', null, 'Donald Morgan', 'Alisha Dunn', null, null, null, '237 94533137', '237 11169647', '1', null);
INSERT INTO `Eleve` VALUES ('3', '2015-08-27 20:42:57', null, null, null, 'wrongwrong@b1zmail.com', '237 47042339', 'M', '1998-05-03', 'Braselton', 'Mickey Cruz', null, 'Kylie Adams', 'Gabriel Hurst', null, null, null, '237 74571022', '237 48640418', '1', null);
INSERT INTO `Eleve` VALUES ('4', '2015-08-27 20:42:57', null, null, null, 'visionswe55@b1zmail.net', '237 25227510', 'MLLE', '2003-07-07', 'Cuthbert', 'Jody Blackwell', null, 'Bonnie Henderson', 'Carmen Boyer', null, null, null, '237 45965172', '237 63930850', '1', null);
INSERT INTO `Eleve` VALUES ('5', '2015-08-27 20:42:57', null, null, null, 'diedit43@b1zmail.net', '237 88340761', 'M', '2001-05-05', 'Morgan', 'Kyle Cannon', null, 'Chelsea Hurst', 'Katrina Sherman', null, null, null, '237 93174754', '237 31797615', '1', null);
INSERT INTO `Eleve` VALUES ('6', '2015-08-27 20:42:58', null, null, null, 'goodit@b1zmail.org', '237 43988946', 'MLLE', '2003-09-20', 'Alapaha', 'Cassandra Lindsay', null, 'Krista Weber', 'Jeffrey Collins', null, null, null, '237 83748581', '237 46597654', '1', null);
INSERT INTO `Eleve` VALUES ('7', '2015-08-27 20:42:58', null, null, null, 'movedworld0@somema1l.net', '237 11945030', 'M', '1997-10-09', 'Temple', 'Tamara Hobbs', null, 'Grace Butler', 'Lindsey Luna', null, null, null, '237 84645695', '237 41837725', '1', null);
INSERT INTO `Eleve` VALUES ('8', '2015-08-27 20:42:58', null, null, null, 'rmelton@gma1l.co.uk', '237 72373124', 'MLLE', '1998-11-03', 'Lumpkin', 'Tia Yang', null, 'Becky Burch', 'Nina Donovan', null, null, null, '237 14067219', '237 21222278', '1', null);
INSERT INTO `Eleve` VALUES ('9', '2015-08-27 20:42:58', null, null, null, 'dmiddleton@everyma1l.co.uk', '237 62570224', 'M', '1997-06-26', 'Ringgold', 'Jeannie Humphrey', null, 'Chester McPherson', 'Isaac Frederick', null, null, null, '237 45283533', '237 22491499', '1', null);
INSERT INTO `Eleve` VALUES ('10', '2015-08-27 20:42:58', null, null, null, 'deaton@b1zmail.biz', '237 81524907', 'MLLE', '1997-04-19', 'Abba', 'Matt Santana', null, 'Mindy Rutledge', 'Alexandra Duffy', null, null, null, '237 38259132', '237 03829688', '1', null);
INSERT INTO `Eleve` VALUES ('11', '2015-08-27 20:42:59', null, null, null, 'ftran@yah00.co.uk', '237 80768042', 'M', '2003-02-27', 'Jefferson', 'Danielle Fitzpatrick', null, 'Mother Scott', 'Mason Perry', null, null, null, '237 10475049', '237 37831781', '1', null);
INSERT INTO `Eleve` VALUES ('12', '2015-08-27 20:42:59', null, null, null, 'lhopper@ma1l2u.us', '237 39198441', 'MLLE', '2004-11-24', 'Trudie', 'Annette Navarro', null, 'Theresa Tucker', 'Roger Carpenter', null, null, null, '237 76375684', '237 88013976', '1', null);
INSERT INTO `Eleve` VALUES ('13', '2015-08-27 20:42:59', null, null, null, 'tosidekick@ma1l2u.us', '237 35309327', 'M', '1999-10-26', 'Allenhurst', 'Stephen Medina', null, 'Greg Castro', 'Jamie Morin', null, null, null, '237 62423929', '237 47208619', '1', null);
INSERT INTO `Eleve` VALUES ('14', '2015-08-27 20:42:59', null, null, null, 'goodgood@everyma1l.net', '237 99890815', 'MLLE', '2003-06-03', 'Cumming', 'Donna Spears', null, 'Darlene Black', 'Caleb Pollard', null, null, null, '237 05627995', '237 67720970', '1', null);
INSERT INTO `Eleve` VALUES ('15', '2015-08-27 20:43:00', null, null, null, 'holdcomputer@b1zmail.us', '237 99203292', 'M', '1999-03-08', 'Poulan', 'Alicia Grant', null, 'Charlie Bolton', 'Carl Goodwin', null, null, null, '237 01734597', '237 63281310', '1', null);
INSERT INTO `Eleve` VALUES ('16', '2015-08-27 20:43:00', null, null, null, 'lstein87@everyma1l.us', '237 82440341', 'MLLE', '2001-07-23', 'Athens', 'Michelle Morse', null, 'Sue Bradshaw', 'Alyssa Richmond', null, null, null, '237 64207005', '237 37286760', '1', null);
INSERT INTO `Eleve` VALUES ('17', '2015-08-27 20:43:00', null, null, null, 'redsits@hotma1l.net', '237 50756714', 'M', '1998-08-20', 'Sterling', 'Seth Moss', null, 'Hannah Johns', 'Anita Hammond', null, null, null, '237 02079261', '237 47894938', '1', null);
INSERT INTO `Eleve` VALUES ('18', '2015-08-27 20:43:00', null, null, null, 'arein@ma1l2u.net', '237 74902699', 'MLLE', '1998-06-19', 'Kinderlou', 'Kaitlyn Lara', null, 'Lori Crawford', 'Kelly Hines', null, null, null, '237 66285304', '237 64022989', '1', null);
INSERT INTO `Eleve` VALUES ('19', '2015-08-27 20:43:00', null, null, null, 'toin92@yah00.net', '237 75808771', 'M', '2000-07-22', 'Haylon', 'Antonio Bridges', null, 'Jesse Hudson', 'Tony Bishop', null, null, null, '237 02241157', '237 97805589', '1', null);
INSERT INTO `Eleve` VALUES ('20', '2015-08-27 20:43:01', null, null, null, 'rcarpenter@somema1l.us', '237 84329370', 'MLLE', '1996-03-29', 'Lumber City', 'Casey McDonald', null, 'Audrey Casey', 'Roger Vaughn', null, null, null, '237 15438632', '237 02245462', '1', null);
INSERT INTO `Eleve` VALUES ('21', '2015-08-27 20:43:01', null, null, null, 'wantnumbers@yah00.com', '237 17043801', 'M', '1996-05-13', 'Ellenton', 'Kathy Wiggins', null, 'Earl Robinson', 'Vernon Butler', null, null, null, '237 54539467', '237 61585478', '1', null);
INSERT INTO `Eleve` VALUES ('22', '2015-08-27 20:43:02', null, null, null, 'askeduntil@hotma1l.com', '237 61428260', 'MLLE', '2004-04-08', 'West Green', 'Beth Carlson', null, 'Joe Holloway', 'James Meadows', null, null, null, '237 85251841', '237 28964351', '1', null);
INSERT INTO `Eleve` VALUES ('23', '2015-08-27 20:43:02', null, null, null, 'whoit@hotma1l.biz', '237 27530883', 'M', '2004-03-22', 'Cobbtown', 'Andy Vargas', null, 'Kathryn Moses', 'Lois Holmes', null, null, null, '237 93002227', '237 97882431', '1', null);
INSERT INTO `Eleve` VALUES ('24', '2015-08-27 20:43:02', null, null, null, 'generatedwarp@everyma1l.com', '237 56584837', 'MLLE', '2001-10-27', 'Nevils', 'Shannon Baird', null, 'Cassandra Molina', 'Linda Blackburn', null, null, null, '237 19600884', '237 65165975', '1', null);
INSERT INTO `Eleve` VALUES ('25', '2015-08-27 20:43:02', null, null, null, 'jporter@hotma1l.net', '237 38543461', 'M', '2002-01-18', 'Georgetown', 'Steve Mullins', null, 'Drew Ball', 'Ronda Hess', null, null, null, '237 16696675', '237 19169498', '1', null);
INSERT INTO `Eleve` VALUES ('26', '2015-08-27 20:43:02', null, null, null, 'ccastillo@ma1lbox.co.uk', '237 87171977', 'MLLE', '2000-07-19', 'Tifton', 'Diana Garrett', null, 'Thelma Gaines', 'Madison Dodson', null, null, null, '237 55551816', '237 58937965', '1', null);
INSERT INTO `Eleve` VALUES ('27', '2015-08-27 20:43:03', null, null, null, 'schan@gma1l.us', '237 53987673', 'M', '2004-05-27', 'Mcintosh', 'Kathy Parker', null, 'Lewis Bray', 'Ronda Reed', null, null, null, '237 74574248', '237 98079051', '1', null);
INSERT INTO `Eleve` VALUES ('28', '2015-08-27 20:43:03', null, null, null, 'mlopez@gma1l.biz', '237 93868965', 'MLLE', '1998-08-13', 'Crescent', 'Hunter McCarthy', null, 'Brenda Kent', 'Diane Jacobs', null, null, null, '237 79727209', '237 06782021', '1', null);
INSERT INTO `Eleve` VALUES ('29', '2015-08-27 20:43:03', null, null, null, 'ofsits88@gma1l.com', '237 03772083', 'M', '2003-10-23', 'Blakely', 'Shelly Farmer', null, 'Johnny Buckley', 'Alisha Sloan', null, null, null, '237 93166335', '237 99346021', '1', null);
INSERT INTO `Eleve` VALUES ('30', '2015-08-27 20:43:04', null, null, null, 'mballard69@everyma1l.co.uk', '237 50105826', 'MLLE', '2001-11-02', 'Eatonton', 'Jay Allen', null, 'Lacey Gamble', 'Elaine Boyle', null, null, null, '237 72731118', '237 53048393', '1', null);
INSERT INTO `Eleve` VALUES ('31', '2015-08-27 20:43:04', null, null, null, 'goodwhere@ma1l2u.co.uk', '237 54527483', 'M', '1998-03-16', 'Augusta', 'Katherine Dudley', null, 'Shanna Hughes', 'Brittany Pickett', null, null, null, '237 44209844', '237 49087695', '1', null);
INSERT INTO `Eleve` VALUES ('32', '2015-08-27 20:43:04', null, null, null, 'ibird@ma1lbox.org', '237 44720105', 'MLLE', '1999-11-06', 'East Dublin', 'Autumn Dickerson', null, 'Sandra Manning', 'Dallas Martin', null, null, null, '237 07790387', '237 38406787', '1', null);
INSERT INTO `Eleve` VALUES ('33', '2015-08-27 20:43:04', null, null, null, 'whiteof@yah00.org', '237 45720990', 'M', '1996-06-02', 'Milledgeville', 'Alan Mejia', null, 'Brian Mendez', 'Candy Hodge', null, null, null, '237 53945575', '237 81750480', '1', null);
INSERT INTO `Eleve` VALUES ('34', '2015-08-27 20:43:04', null, null, null, 'headphonesuntil@yah00.us', '237 31544665', 'MLLE', '1998-06-06', 'Mcdonough', 'Anna Richard', null, 'Ernest Deleon', 'Cameron Schultz', null, null, null, '237 72584818', '237 32895656', '1', null);
INSERT INTO `Eleve` VALUES ('35', '2015-08-27 20:43:05', null, null, null, 'sjennings@ma1lbox.net', '237 19726776', 'M', '2003-05-11', 'Nicholls', 'Charlotte Rocha', null, 'Andrea Fowler', 'Dave Dillon', null, null, null, '237 87696231', '237 16962974', '1', null);
INSERT INTO `Eleve` VALUES ('36', '2015-08-27 20:43:05', null, null, null, 'lsawyer43@everyma1l.com', '237 24615512', 'MLLE', '2003-09-15', 'Screven', 'Danny Flowers', null, 'Albert Jensen', 'Eva Wilder', null, null, null, '237 24549349', '237 08539949', '1', null);
INSERT INTO `Eleve` VALUES ('37', '2015-08-27 20:43:05', null, null, null, 'lblanchard@hotma1l.net', '237 33878740', 'M', '2002-03-29', 'Rebecca', 'April Gonzales', null, 'Taylor Suarez', 'Jeffery Avila', null, null, null, '237 55223470', '237 05029378', '1', null);
INSERT INTO `Eleve` VALUES ('38', '2015-08-27 20:43:06', null, null, null, 'chouse@gma1l.org', '237 17428177', 'MLLE', '2000-02-29', 'Acworth', 'Sabrina Bartlett', null, 'Bobbie Tate', 'Jake Russo', null, null, null, '237 52592034', '237 02230534', '1', null);
INSERT INTO `Eleve` VALUES ('39', '2015-08-27 20:43:06', null, null, null, 'swells@somema1l.net', '237 30585979', 'M', '2000-02-09', 'Darien', 'Harry Rojas', null, 'Robbie Rich', 'Ann McLeod', null, null, null, '237 56310711', '237 20652859', '1', null);
INSERT INTO `Eleve` VALUES ('40', '2015-08-27 20:43:06', null, null, null, 'endsor maybe@ma1lbox.com', '237 28113710', 'MLLE', '2001-12-07', 'Moniac', 'Charlie Ayala', null, 'Sharon Bender', 'Bonnie Chen', null, null, null, '237 64780983', '237 21256871', '1', null);
INSERT INTO `Eleve` VALUES ('41', '2015-08-27 20:43:06', null, null, null, 'dayscame@hotma1l.biz', '237 29150172', 'M', '1999-07-16', 'Lithonia', 'Lawrence Raymond', null, 'Ryan Green', 'Brandi Gillespie', null, null, null, '237 73773018', '237 75890055', '1', null);
INSERT INTO `Eleve` VALUES ('42', '2015-08-27 20:43:06', null, null, null, 'swong@gma1l.com', '237 82191742', 'MLLE', '1998-12-12', 'Fitzgerald', 'Antonio Livingston', null, 'Angela Spencer', 'Melody Fuentes', null, null, null, '237 58287859', '237 43731164', '1', null);
INSERT INTO `Eleve` VALUES ('43', '2015-08-27 20:43:06', null, null, null, 'iswill@b1zmail.co.uk', '237 28404486', 'M', '2004-08-25', 'Sycamore', 'Jasmine Salazar', null, 'Faith Key', 'Marie Sparks', null, null, null, '237 73062750', '237 30554293', '1', null);
INSERT INTO `Eleve` VALUES ('44', '2015-08-27 20:43:07', null, null, null, 'bmcintyre68@ma1lbox.us', '237 13002395', 'MLLE', '2002-08-21', 'Preston', 'Chasity Bass', null, 'David Koch', 'Carmen Fulton', null, null, null, '237 82504472', '237 42081587', '1', null);
INSERT INTO `Eleve` VALUES ('45', '2015-08-27 20:43:07', null, null, null, 'dparsons@everyma1l.us', '237 79889429', 'M', '1999-12-25', 'Hogansville', 'Rhonda Paul', null, 'Ryan Larsen', 'Kevin Conrad', null, null, null, '237 90252012', '237 93787676', '1', null);
INSERT INTO `Eleve` VALUES ('46', '2015-08-27 20:43:07', null, null, null, 'schang@b1zmail.net', '237 88601945', 'MLLE', '2003-03-19', 'Norcross', 'Mariah Bates', null, 'Abby Graham', 'Sher Harper', null, null, null, '237 18450712', '237 33453513', '1', null);
INSERT INTO `Eleve` VALUES ('47', '2015-08-27 20:43:07', null, null, null, 'jallison@hotma1l.biz', '237 19525137', 'M', '2003-07-09', 'Lithonia', 'Misty Ryan', null, 'Rex Camacho', 'Shaun Byers', null, null, null, '237 03021129', '237 51065086', '1', null);
INSERT INTO `Eleve` VALUES ('48', '2015-08-27 20:43:08', null, null, null, 'sorr@yah00.net', '237 44298379', 'MLLE', '1999-09-12', 'Bloomingdale', 'Denise Dale', null, 'Melody Martinez', 'Jan Patrick', null, null, null, '237 52508095', '237 31763751', '1', null);
INSERT INTO `Eleve` VALUES ('49', '2015-08-27 20:43:08', null, null, null, 'piquepique@hotma1l.biz', '237 51335544', 'M', '2003-11-18', 'Lexington', 'Barb Wooten', null, 'Summer Craft', 'Toni Schroeder', null, null, null, '237 14626270', '237 73965525', '1', null);
INSERT INTO `Eleve` VALUES ('50', '2015-08-27 20:43:08', null, null, null, 'willpeople@yah00.net', '237 41263594', 'MLLE', '1998-08-29', 'Grovetown', 'Shawn Cervantes', null, 'Sydney Higgins', 'Teresa Gilliam', null, null, null, '237 77401098', '237 16033744', '1', null);
INSERT INTO `Eleve` VALUES ('51', '2015-08-27 20:43:08', null, null, null, 'ccervantes65@everyma1l.org', '237 72980839', 'M', '1998-05-12', 'Sylvania', 'Clayton Woods', null, 'Isaac Ewing', 'Denise Harmon', null, null, null, '237 02335724', '237 31073845', '1', null);
INSERT INTO `Eleve` VALUES ('52', '2015-08-27 20:43:08', null, null, null, 'nowicket@somema1l.co.uk', '237 96376310', 'MLLE', '2000-07-23', 'Bainbridge', 'Marion Wolf', null, 'Holly Parrish', 'Kayla Haney', null, null, null, '237 48336230', '237 46411417', '1', null);
INSERT INTO `Eleve` VALUES ('53', '2015-08-27 20:43:08', null, null, null, 'imcdonald@gma1l.biz', '237 21775691', 'M', '2001-03-17', 'Appling', 'Gloria Stephens', null, 'Christoph Norris', 'Logan Rosa', null, null, null, '237 61897764', '237 08325018', '1', null);
INSERT INTO `Eleve` VALUES ('54', '2015-08-27 20:43:09', null, null, null, 'dcash6@b1zmail.co.uk', '237 93571088', 'MLLE', '1996-12-14', 'Brinson', 'Betty Bartlett', null, 'Jeffery Willis', 'Brandi Sellers', null, null, null, '237 84519254', '237 26594355', '1', null);
INSERT INTO `Eleve` VALUES ('55', '2015-08-27 20:43:09', null, null, null, 'speedwho@ma1lbox.co.uk', '237 75270855', 'M', '1999-08-15', 'Abbeville', 'Levi Vega', null, 'Melanie Valenzuela', 'Grace Jimenez', null, null, null, '237 94293460', '237 49655134', '1', null);
INSERT INTO `Eleve` VALUES ('56', '2015-08-27 20:43:09', null, null, null, 'bwilliams@everyma1l.biz', '237 06506630', 'MLLE', '1999-07-27', 'Chauncey', 'Kathy Deleon', null, 'Randy Ware', 'Anna Kline', null, null, null, '237 12281750', '237 54373237', '1', null);
INSERT INTO `Eleve` VALUES ('57', '2015-08-27 20:43:10', null, null, null, 'bsmith@somema1l.net', '237 96663902', 'M', '2004-04-18', 'Crescent', 'Shawn Luna', null, 'Charlotte Gould', 'Penny Merritt', null, null, null, '237 68916525', '237 38686967', '1', null);
INSERT INTO `Eleve` VALUES ('58', '2015-08-27 20:43:10', null, null, null, 'tshepard@ma1lbox.com', '237 60492183', 'MLLE', '1999-05-02', 'Whigham', 'Francis Mullins', null, 'Lacey Pena', 'Brooke Hood', null, null, null, '237 04228902', '237 68009629', '1', null);
INSERT INTO `Eleve` VALUES ('59', '2015-08-27 20:43:10', null, null, null, 'bbridges@yah00.biz', '237 24722256', 'M', '2000-01-10', 'Dallas', 'Juanita Garrison', null, 'Angie Hinton', 'Alex Peters', null, null, null, '237 33241323', '237 05886385', '1', null);
INSERT INTO `Eleve` VALUES ('60', '2015-08-27 20:43:10', null, null, null, 'jemerson@yah00.biz', '237 04046917', 'MLLE', '2003-06-29', 'Nevils', 'Maria Dorsey', null, 'Tracie Hale', 'Miranda Logan', null, null, null, '237 75467266', '237 18349618', '1', null);
INSERT INTO `Eleve` VALUES ('61', '2015-08-27 20:43:10', null, null, null, 'tfinch@ma1lbox.biz', '237 22919165', 'M', '2001-04-20', 'Moultrie', 'Mindy Garrett', null, 'Don Moran', 'Pamela Sweeney', null, null, null, '237 04939378', '237 10693893', '1', null);
INSERT INTO `Eleve` VALUES ('62', '2015-08-27 20:43:11', null, null, null, 'islandtelevision59@b1zmail.net', '237 62119729', 'MLLE', '1999-11-14', 'Mcrae', 'Shaun Barry', null, 'Johnathan Macias', 'Brandon Bonner', null, null, null, '237 69539965', '237 34264856', '1', null);
INSERT INTO `Eleve` VALUES ('63', '2015-08-27 20:43:11', null, null, null, 'throwhold@b1zmail.co.uk', '237 86969578', 'M', '1996-01-14', 'Holt', 'Jade Hayden', null, 'Alice Weaver', 'Judy Kidd', null, null, null, '237 69970984', '237 68766313', '1', null);
INSERT INTO `Eleve` VALUES ('64', '2015-08-27 20:43:11', null, null, null, 'smokeof@somema1l.com', '237 51015586', 'MLLE', '2003-10-30', 'Rebecca', 'Andrew Spears', null, 'Sheila Aguirre', 'Kristina Hendricks', null, null, null, '237 13105507', '237 86155263', '1', null);
INSERT INTO `Eleve` VALUES ('65', '2015-08-27 20:43:11', null, null, null, 'islandi68@ma1lbox.co.uk', '237 74604407', 'M', '2002-02-22', 'Thalman', 'Donald Haynes', null, 'Father Carver', 'Myron McCray', null, null, null, '237 05067964', '237 78154906', '1', null);
INSERT INTO `Eleve` VALUES ('66', '2015-08-27 20:43:12', null, null, null, 'jrogers24@ma1l2u.net', '237 98521812', 'MLLE', '2004-11-21', 'Pine Lake', 'Ray Moon', null, 'Nick Walter', 'Haley Rivera', null, null, null, '237 01651346', '237 37592261', '1', null);
INSERT INTO `Eleve` VALUES ('67', '2015-08-27 20:43:12', null, null, null, 'sitsrescue@gma1l.us', '237 06129313', 'M', '2001-11-02', 'Alston', 'Glen Gay', null, 'Maria Contreras', 'Tracie Butler', null, null, null, '237 28924265', '237 96255650', '1', null);
INSERT INTO `Eleve` VALUES ('68', '2015-08-27 20:43:12', null, null, null, 'rbarr19@everyma1l.us', '237 23720932', 'MLLE', '2000-08-01', 'Townsend', 'Beverly Whitehead', null, 'Becky Buckner', 'Marilyn Mann', null, null, null, '237 34030598', '237 80015767', '1', null);
INSERT INTO `Eleve` VALUES ('69', '2015-08-27 20:43:12', null, null, null, 'whileothers@hotma1l.net', '237 40756890', 'M', '1996-08-26', 'Claxton', 'Alyssa Maldonado', null, 'Allison McConnell', 'Clayton Simon', null, null, null, '237 84479508', '237 11839089', '1', null);
INSERT INTO `Eleve` VALUES ('70', '2015-08-27 20:43:12', null, null, null, 'swall@gma1l.co.uk', '237 69209611', 'MLLE', '2000-02-08', 'Cohutta', 'Christopher Raymond', null, 'Thelma Mills', 'Rick Goff', null, null, null, '237 27308953', '237 45638962', '1', null);
INSERT INTO `Eleve` VALUES ('71', '2015-08-27 20:43:13', null, null, null, 'ssanford@gma1l.com', '237 84578925', 'M', '1996-09-16', 'Dahlonega', 'Jim Knapp', null, 'Levi Cameron', 'Johnathan Weeks', null, null, null, '237 40565117', '237 73813079', '1', null);
INSERT INTO `Eleve` VALUES ('72', '2015-08-27 20:43:13', null, null, null, 'ofenter60@gma1l.net', '237 37552892', 'MLLE', '2000-07-19', 'Alamo', 'Karen Juarez', null, 'Diana Lyons', 'Kristina McKinney', null, null, null, '237 92936662', '237 84628065', '1', null);
INSERT INTO `Eleve` VALUES ('73', '2015-08-27 20:43:13', null, null, null, 'holdlock@ma1lbox.net', '237 90874744', 'M', '1996-09-21', 'Flowery Branch', 'Patricia Simmons', null, 'Donna Levine', 'Cory Kline', null, null, null, '237 43496894', '237 10611215', '1', null);
INSERT INTO `Eleve` VALUES ('74', '2015-08-27 20:43:14', null, null, null, 'handledsacrifice@hotma1l.org', '237 04070980', 'MLLE', '2001-07-25', 'Loganville', 'Peggy Peters', null, 'Roberta Fernandez', 'Candy Chan', null, null, null, '237 10971439', '237 48385985', '1', null);
INSERT INTO `Eleve` VALUES ('75', '2015-08-27 20:43:14', null, null, null, 'toends15@hotma1l.us', '237 71986507', 'M', '2003-09-06', 'Hazlehurst', 'Nick Duran', null, 'Allison Wong', 'Tracie Kim', null, null, null, '237 33877844', '237 24188389', '1', null);
INSERT INTO `Eleve` VALUES ('76', '2015-08-27 20:43:14', null, null, null, 'televisionfind@everyma1l.us', '237 02326643', 'MLLE', '2003-07-13', 'Watkinsville', 'Robbie Bean', null, 'Diane Miller', 'Cassandra Cline', null, null, null, '237 13994003', '237 75610640', '1', null);
INSERT INTO `Eleve` VALUES ('77', '2015-08-27 20:43:14', null, null, null, 'haveit\'s@b1zmail.com', '237 36205171', 'M', '1996-02-27', 'Pineora', 'Megan Schroeder', null, 'Brian Duncan', 'Tyrone Navarro', null, null, null, '237 93398794', '237 89401967', '1', null);
INSERT INTO `Eleve` VALUES ('78', '2015-08-27 20:43:14', null, null, null, 'hnorton@gma1l.co.uk', '237 02690207', 'MLLE', '2004-06-19', 'Alma', 'Martha Bryant', null, 'Jason King', 'Greg Patterson', null, null, null, '237 09526365', '237 44505280', '1', null);
INSERT INTO `Eleve` VALUES ('79', '2015-08-27 20:43:15', null, null, null, 'wewords@everyma1l.org', '237 30909451', 'M', '1999-07-13', 'Leefield', 'Holly Stanley', null, 'Veronica Dalton', 'Crystal Heath', null, null, null, '237 24818231', '237 72368718', '1', null);
INSERT INTO `Eleve` VALUES ('80', '2015-08-27 20:43:15', null, null, null, 'havepeople@hotma1l.org', '237 21261460', 'MLLE', '2002-08-05', 'Sunbury', 'Toni Hyde', null, 'Sharon Anderson', 'Leslie Wallace', null, null, null, '237 55729844', '237 32806084', '1', null);
INSERT INTO `Eleve` VALUES ('81', '2015-08-27 20:43:15', null, null, null, 'lotsdays@yah00.biz', '237 87955934', 'M', '2002-11-07', 'Lakeland', 'Cindy Lang', null, 'Jeremiah Zamora', 'Candy Calhoun', null, null, null, '237 01442280', '237 38628384', '1', null);
INSERT INTO `Eleve` VALUES ('82', '2015-08-27 20:43:16', null, null, null, 'numbersspeed2@yah00.us', '237 95323768', 'MLLE', '1998-05-25', 'Newnan', 'Ronnie Franklin', null, 'Shane McKay', 'Marcus Kerr', null, null, null, '237 81198143', '237 40156077', '1', null);
INSERT INTO `Eleve` VALUES ('83', '2015-08-27 20:43:16', null, null, null, 'rfaulkner@ma1lbox.org', '237 38828303', 'M', '2000-04-18', 'Mcrae', 'Danielle Farmer', null, 'Wyatt Warner', 'Rocky Olsen', null, null, null, '237 12718313', '237 64805928', '1', null);
INSERT INTO `Eleve` VALUES ('84', '2015-08-27 20:43:16', null, null, null, 'iswith@b1zmail.us', '237 73114285', 'MLLE', '2004-09-24', 'Wray', 'Mark McPherson', null, 'David Perez', 'Nancy Owens', null, null, null, '237 90150080', '237 25250802', '1', null);
INSERT INTO `Eleve` VALUES ('85', '2015-08-27 20:43:17', null, null, null, 'bangingdemanded@gma1l.co.uk', '237 58296129', 'M', '2000-09-05', 'Baden', 'Jesse Gordon', null, 'Tabitha Fulton', 'Lance Sanders', null, null, null, '237 85523161', '237 04260766', '1', null);
INSERT INTO `Eleve` VALUES ('86', '2015-08-27 20:43:17', null, null, null, 'hatwith28@ma1l2u.com', '237 25851908', 'MLLE', '2002-03-11', 'Ellaville', 'Kylie Marsh', null, 'Ryan Cline', 'Kristin Keller', null, null, null, '237 81828267', '237 37549038', '1', null);
INSERT INTO `Eleve` VALUES ('87', '2015-08-27 20:43:17', null, null, null, 'trosales@gma1l.com', '237 88070163', 'M', '2002-04-24', 'Dunwoody', 'Kevin Oliver', null, 'Grace Pitts', 'Patricia Christensen', null, null, null, '237 94412255', '237 27974353', '1', null);
INSERT INTO `Eleve` VALUES ('88', '2015-08-27 20:43:17', null, null, null, 'dbradshaw@yah00.us', '237 36789853', 'MLLE', '2000-03-16', 'Clyatteville', 'Justin Rice', null, 'Randy Holmes', 'Veronica Barton', null, null, null, '237 16368107', '237 57998941', '1', null);
INSERT INTO `Eleve` VALUES ('89', '2015-08-27 20:43:17', null, null, null, 'ptyler@hotma1l.com', '237 48593638', 'M', '1996-09-08', 'Buena Vista', 'Mickey Delaney', null, 'Mark Gray', 'Theresa Chapman', null, null, null, '237 86311918', '237 81416402', '1', null);
INSERT INTO `Eleve` VALUES ('90', '2015-08-27 20:43:17', null, null, null, 'banginghold@hotma1l.com', '237 52428257', 'MLLE', '2002-05-09', 'Bogart', 'Ashley Acevedo', null, 'Francis Abbott', 'Joel Jacobs', null, null, null, '237 59275357', '237 95276572', '1', null);
INSERT INTO `Eleve` VALUES ('91', '2015-08-27 20:43:18', null, null, null, 'monstersecretly@ma1lbox.us', '237 23217214', 'M', '2004-03-01', 'Tifton', 'Dalton Rios', null, 'Travis Santiago', 'Vickie Kirkland', null, null, null, '237 21190131', '237 02978721', '1', null);
INSERT INTO `Eleve` VALUES ('92', '2015-08-27 20:43:18', null, null, null, 'kleach@ma1lbox.biz', '237 34577709', 'MLLE', '2000-10-27', 'Leary', 'Shirley Knowles', null, 'Jan Foley', 'Ginger Strong', null, null, null, '237 72418883', '237 66961699', '1', null);
INSERT INTO `Eleve` VALUES ('93', '2015-08-27 20:43:18', null, null, null, 'computerisland@hotma1l.net', '237 83721294', 'M', '1999-11-14', 'Preston', 'Kristy Horne', null, 'Danielle Conrad', 'Molly Sweet', null, null, null, '237 34558701', '237 86491107', '1', null);
INSERT INTO `Eleve` VALUES ('94', '2015-08-27 20:43:19', null, null, null, 'lknight@b1zmail.co.uk', '237 81461624', 'MLLE', '1997-05-13', 'Riverdale', 'Bruce Davis', null, 'Myron Ewing', 'Jeannie Tyler', null, null, null, '237 43361825', '237 71120020', '1', null);
INSERT INTO `Eleve` VALUES ('95', '2015-08-27 20:43:19', null, null, null, 'findmoved@b1zmail.org', '237 50000586', 'M', '1998-05-18', 'Fitzgerald', 'Alissa Durham', null, 'Vicky Fitzgerald', 'Anna Calderon', null, null, null, '237 33907634', '237 68182230', '1', null);
INSERT INTO `Eleve` VALUES ('96', '2015-08-27 20:43:19', null, null, null, 'btate@ma1lbox.us', '237 50694429', 'MLLE', '2004-04-26', 'Axson', 'Sandy Gallegos', null, 'Nina Merrill', 'Shaun Barton', null, null, null, '237 71634863', '237 89744066', '1', null);
INSERT INTO `Eleve` VALUES ('97', '2015-08-27 20:43:19', null, null, null, 'smokesofa@ma1l2u.biz', '237 18993811', 'M', '1997-10-25', 'Chatsworth', 'Nathan Wilkins', null, 'Nathan Nichols', 'Nick Clay', null, null, null, '237 10388556', '237 54841836', '1', null);
INSERT INTO `Eleve` VALUES ('98', '2015-08-27 20:43:19', null, null, null, 'havesill@b1zmail.net', '237 84206259', 'MLLE', '1998-08-01', 'Columbus', 'Hunter Alford', null, 'Eric Holder', 'Pete Boyle', null, null, null, '237 99090791', '237 51466691', '1', null);
INSERT INTO `Eleve` VALUES ('99', '2015-08-27 20:43:20', null, null, null, 'sidekickmy67@ma1l2u.net', '237 88337548', 'M', '2002-06-17', 'Smyrna', 'Terry Mitchell', null, 'Deanna Huff', 'Glen Morse', null, null, null, '237 01373879', '237 40702172', '1', null);
INSERT INTO `Eleve` VALUES ('100', '2015-08-27 20:43:20', null, null, null, 'hsandoval@somema1l.net', '237 42497294', 'MLLE', '2001-09-05', 'Thunderbolt', 'Gary Rush', null, 'Heath Cantu', 'Mike Lane', null, null, null, '237 47758663', '237 92848369', '1', null);

-- ----------------------------
-- Table structure for `EleveInscrit`
-- ----------------------------
DROP TABLE IF EXISTS `EleveInscrit`;
CREATE TABLE `EleveInscrit` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `redoublant` bit(1) DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_annee` int(11) DEFAULT NULL,
  `code_classe` int(11) DEFAULT NULL,
  `code_eleve` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_jcc7lh3y8c7i2pwkj5k61px9y` (`code_createur`),
  KEY `FK_n1x4ecayk852uffrvoe4wpcjf` (`code_modificateur`),
  KEY `FK_qf45k7ee7nf5m9wojk3n8ek5u` (`code_annee`),
  KEY `FK_fcp24w36l6eqjcpnpwmhflye7` (`code_classe`),
  KEY `FK_23lqkecsjkcf2auvt60dixvrn` (`code_eleve`),
  CONSTRAINT `FK_23lqkecsjkcf2auvt60dixvrn` FOREIGN KEY (`code_eleve`) REFERENCES `Eleve` (`code`),
  CONSTRAINT `FK_fcp24w36l6eqjcpnpwmhflye7` FOREIGN KEY (`code_classe`) REFERENCES `Classe` (`code`),
  CONSTRAINT `FK_jcc7lh3y8c7i2pwkj5k61px9y` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_n1x4ecayk852uffrvoe4wpcjf` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_qf45k7ee7nf5m9wojk3n8ek5u` FOREIGN KEY (`code_annee`) REFERENCES `AnneeScolaire` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of EleveInscrit
-- ----------------------------
INSERT INTO `EleveInscrit` VALUES ('16', null, null, 'ACTIF', null, null, null, '1', '1', '1');
INSERT INTO `EleveInscrit` VALUES ('17', null, null, 'ACTIF', null, null, null, '1', '1', '2');
INSERT INTO `EleveInscrit` VALUES ('18', null, null, 'ACTIF', null, null, null, '1', '1', '3');
INSERT INTO `EleveInscrit` VALUES ('19', null, null, 'ACTIF', null, null, null, '1', '1', '4');
INSERT INTO `EleveInscrit` VALUES ('20', null, null, 'ACTIF', null, null, null, '1', '1', '5');
INSERT INTO `EleveInscrit` VALUES ('21', null, null, 'ACTIF', null, null, null, '1', '1', '6');
INSERT INTO `EleveInscrit` VALUES ('22', null, null, 'ACTIF', null, null, null, '1', '1', '7');
INSERT INTO `EleveInscrit` VALUES ('23', null, null, 'ACTIF', null, null, null, '1', '1', '8');
INSERT INTO `EleveInscrit` VALUES ('24', null, null, 'ACTIF', null, null, null, '1', '1', '9');
INSERT INTO `EleveInscrit` VALUES ('31', null, null, 'ACTIF', null, null, null, '1', '2', '10');
INSERT INTO `EleveInscrit` VALUES ('32', null, null, 'ACTIF', null, null, null, '1', '2', '11');
INSERT INTO `EleveInscrit` VALUES ('33', null, null, 'ACTIF', null, null, null, '1', '2', '12');
INSERT INTO `EleveInscrit` VALUES ('34', null, null, 'ACTIF', null, null, null, '1', '2', '13');
INSERT INTO `EleveInscrit` VALUES ('35', null, null, 'ACTIF', null, null, null, '1', '2', '14');
INSERT INTO `EleveInscrit` VALUES ('36', null, null, 'ACTIF', null, null, null, '1', '2', '15');
INSERT INTO `EleveInscrit` VALUES ('37', null, null, 'ACTIF', null, null, null, '1', '2', '16');
INSERT INTO `EleveInscrit` VALUES ('38', null, null, 'ACTIF', null, null, null, '1', '2', '17');
INSERT INTO `EleveInscrit` VALUES ('39', null, null, 'ACTIF', null, null, null, '1', '2', '18');
INSERT INTO `EleveInscrit` VALUES ('40', null, null, 'ACTIF', null, null, null, '1', '2', '19');
INSERT INTO `EleveInscrit` VALUES ('46', null, null, 'ACTIF', null, null, null, '1', '3', '20');
INSERT INTO `EleveInscrit` VALUES ('47', null, null, 'ACTIF', null, null, null, '1', '3', '21');
INSERT INTO `EleveInscrit` VALUES ('48', null, null, 'ACTIF', null, null, null, '1', '3', '22');
INSERT INTO `EleveInscrit` VALUES ('49', null, null, 'ACTIF', null, null, null, '1', '3', '23');
INSERT INTO `EleveInscrit` VALUES ('50', null, null, 'ACTIF', null, null, null, '1', '3', '24');
INSERT INTO `EleveInscrit` VALUES ('51', null, null, 'ACTIF', null, null, null, '1', '3', '25');
INSERT INTO `EleveInscrit` VALUES ('52', null, null, 'ACTIF', null, null, null, '1', '3', '26');
INSERT INTO `EleveInscrit` VALUES ('53', null, null, 'ACTIF', null, null, null, '1', '3', '27');
INSERT INTO `EleveInscrit` VALUES ('54', null, null, 'ACTIF', null, null, null, '1', '3', '28');
INSERT INTO `EleveInscrit` VALUES ('55', null, null, 'ACTIF', null, null, null, '1', '3', '29');
INSERT INTO `EleveInscrit` VALUES ('61', null, null, 'ACTIF', null, null, null, '1', '4', '30');
INSERT INTO `EleveInscrit` VALUES ('62', null, null, 'ACTIF', null, null, null, '1', '4', '31');
INSERT INTO `EleveInscrit` VALUES ('63', null, null, 'ACTIF', null, null, null, '1', '4', '32');
INSERT INTO `EleveInscrit` VALUES ('64', null, null, 'ACTIF', null, null, null, '1', '4', '33');
INSERT INTO `EleveInscrit` VALUES ('65', null, null, 'ACTIF', null, null, null, '1', '4', '34');
INSERT INTO `EleveInscrit` VALUES ('66', null, null, 'ACTIF', null, null, null, '1', '4', '35');
INSERT INTO `EleveInscrit` VALUES ('67', null, null, 'ACTIF', null, null, null, '1', '4', '36');
INSERT INTO `EleveInscrit` VALUES ('68', null, null, 'ACTIF', null, null, null, '1', '4', '37');
INSERT INTO `EleveInscrit` VALUES ('69', null, null, 'ACTIF', null, null, null, '1', '4', '38');
INSERT INTO `EleveInscrit` VALUES ('70', null, null, 'ACTIF', null, null, null, '1', '4', '39');
INSERT INTO `EleveInscrit` VALUES ('76', null, null, 'ACTIF', null, null, null, '1', '5', '40');
INSERT INTO `EleveInscrit` VALUES ('77', null, null, 'ACTIF', null, null, null, '1', '5', '41');
INSERT INTO `EleveInscrit` VALUES ('78', null, null, 'ACTIF', null, null, null, '1', '5', '42');
INSERT INTO `EleveInscrit` VALUES ('79', null, null, 'ACTIF', null, null, null, '1', '5', '43');
INSERT INTO `EleveInscrit` VALUES ('80', null, null, 'ACTIF', null, null, null, '1', '5', '44');
INSERT INTO `EleveInscrit` VALUES ('81', null, null, 'ACTIF', null, null, null, '1', '5', '45');
INSERT INTO `EleveInscrit` VALUES ('82', null, null, 'ACTIF', null, null, null, '1', '5', '46');
INSERT INTO `EleveInscrit` VALUES ('83', null, null, 'ACTIF', null, null, null, '1', '5', '47');
INSERT INTO `EleveInscrit` VALUES ('84', null, null, 'ACTIF', null, null, null, '1', '5', '48');
INSERT INTO `EleveInscrit` VALUES ('85', null, null, 'ACTIF', null, null, null, '1', '5', '49');
INSERT INTO `EleveInscrit` VALUES ('91', null, null, 'ACTIF', null, null, null, '1', '6', '50');
INSERT INTO `EleveInscrit` VALUES ('92', null, null, 'ACTIF', null, null, null, '1', '6', '51');
INSERT INTO `EleveInscrit` VALUES ('93', null, null, 'ACTIF', null, null, null, '1', '6', '52');
INSERT INTO `EleveInscrit` VALUES ('94', null, null, 'ACTIF', null, null, null, '1', '6', '53');
INSERT INTO `EleveInscrit` VALUES ('95', null, null, 'ACTIF', null, null, null, '1', '6', '54');
INSERT INTO `EleveInscrit` VALUES ('96', null, null, 'ACTIF', null, null, null, '1', '6', '55');
INSERT INTO `EleveInscrit` VALUES ('97', null, null, 'ACTIF', null, null, null, '1', '6', '56');
INSERT INTO `EleveInscrit` VALUES ('98', null, null, 'ACTIF', null, null, null, '1', '6', '57');
INSERT INTO `EleveInscrit` VALUES ('99', null, null, 'ACTIF', null, null, null, '1', '6', '58');
INSERT INTO `EleveInscrit` VALUES ('100', null, null, 'ACTIF', null, null, null, '1', '6', '59');
INSERT INTO `EleveInscrit` VALUES ('106', null, null, 'ACTIF', null, null, null, '1', '7', '60');
INSERT INTO `EleveInscrit` VALUES ('107', null, null, 'ACTIF', null, null, null, '1', '7', '61');
INSERT INTO `EleveInscrit` VALUES ('108', null, null, 'ACTIF', null, null, null, '1', '7', '62');
INSERT INTO `EleveInscrit` VALUES ('109', null, null, 'ACTIF', null, null, null, '1', '7', '63');
INSERT INTO `EleveInscrit` VALUES ('110', null, null, 'ACTIF', null, null, null, '1', '7', '64');
INSERT INTO `EleveInscrit` VALUES ('111', null, null, 'ACTIF', null, null, null, '1', '7', '65');
INSERT INTO `EleveInscrit` VALUES ('112', null, null, 'ACTIF', null, null, null, '1', '7', '66');
INSERT INTO `EleveInscrit` VALUES ('113', null, null, 'ACTIF', null, null, null, '1', '7', '67');
INSERT INTO `EleveInscrit` VALUES ('114', null, null, 'ACTIF', null, null, null, '1', '7', '68');
INSERT INTO `EleveInscrit` VALUES ('115', null, null, 'ACTIF', null, null, null, '1', '7', '69');
INSERT INTO `EleveInscrit` VALUES ('121', null, null, 'ACTIF', null, null, null, '1', '8', '70');
INSERT INTO `EleveInscrit` VALUES ('122', null, null, 'ACTIF', null, null, null, '1', '8', '71');
INSERT INTO `EleveInscrit` VALUES ('123', null, null, 'ACTIF', null, null, null, '1', '8', '72');
INSERT INTO `EleveInscrit` VALUES ('124', null, null, 'ACTIF', null, null, null, '1', '8', '73');
INSERT INTO `EleveInscrit` VALUES ('125', null, null, 'ACTIF', null, null, null, '1', '8', '74');
INSERT INTO `EleveInscrit` VALUES ('126', null, null, 'ACTIF', null, null, null, '1', '8', '75');
INSERT INTO `EleveInscrit` VALUES ('127', null, null, 'ACTIF', null, null, null, '1', '8', '76');
INSERT INTO `EleveInscrit` VALUES ('128', null, null, 'ACTIF', null, null, null, '1', '8', '77');
INSERT INTO `EleveInscrit` VALUES ('129', null, null, 'ACTIF', null, null, null, '1', '8', '78');
INSERT INTO `EleveInscrit` VALUES ('130', null, null, 'ACTIF', null, null, null, '1', '8', '79');
INSERT INTO `EleveInscrit` VALUES ('136', null, null, 'ACTIF', null, null, null, '1', '9', '80');
INSERT INTO `EleveInscrit` VALUES ('137', null, null, 'ACTIF', null, null, null, '1', '9', '81');
INSERT INTO `EleveInscrit` VALUES ('138', null, null, 'ACTIF', null, null, null, '1', '9', '82');
INSERT INTO `EleveInscrit` VALUES ('139', null, null, 'ACTIF', null, null, null, '1', '9', '83');
INSERT INTO `EleveInscrit` VALUES ('140', null, null, 'ACTIF', null, null, null, '1', '9', '84');
INSERT INTO `EleveInscrit` VALUES ('141', null, null, 'ACTIF', null, null, null, '1', '9', '85');
INSERT INTO `EleveInscrit` VALUES ('142', null, null, 'ACTIF', null, null, null, '1', '9', '86');
INSERT INTO `EleveInscrit` VALUES ('143', null, null, 'ACTIF', null, null, null, '1', '9', '87');
INSERT INTO `EleveInscrit` VALUES ('144', null, null, 'ACTIF', null, null, null, '1', '9', '88');
INSERT INTO `EleveInscrit` VALUES ('145', null, null, 'ACTIF', null, null, null, '1', '9', '89');
INSERT INTO `EleveInscrit` VALUES ('151', null, null, 'ACTIF', null, null, null, '1', '10', '90');
INSERT INTO `EleveInscrit` VALUES ('152', null, null, 'ACTIF', null, null, null, '1', '10', '91');
INSERT INTO `EleveInscrit` VALUES ('153', null, null, 'ACTIF', null, null, null, '1', '10', '92');
INSERT INTO `EleveInscrit` VALUES ('154', null, null, 'ACTIF', null, null, null, '1', '10', '93');
INSERT INTO `EleveInscrit` VALUES ('155', null, null, 'ACTIF', null, null, null, '1', '10', '94');
INSERT INTO `EleveInscrit` VALUES ('156', null, null, 'ACTIF', null, null, null, '1', '10', '95');
INSERT INTO `EleveInscrit` VALUES ('157', null, null, 'ACTIF', null, null, null, '1', '10', '96');
INSERT INTO `EleveInscrit` VALUES ('158', null, null, 'ACTIF', null, null, null, '1', '10', '97');
INSERT INTO `EleveInscrit` VALUES ('159', null, null, 'ACTIF', null, null, null, '1', '10', '98');
INSERT INTO `EleveInscrit` VALUES ('160', null, null, 'ACTIF', null, null, null, '1', '10', '99');
INSERT INTO `EleveInscrit` VALUES ('161', null, null, 'ACTIF', null, null, null, '1', '10', '100');

-- ----------------------------
-- Table structure for `Events`
-- ----------------------------
DROP TABLE IF EXISTS `Events`;
CREATE TABLE `Events` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `description` longtext,
  `libelle` varchar(255) NOT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_eventtopic` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_lu4331mb2buicpv8jnr6tov4p` (`code_createur`),
  KEY `FK_mej3oe0n3c6ig1w288ojor7pi` (`code_modificateur`),
  KEY `FK_75ypefbt4u030t4cveql9eknt` (`code_eventtopic`),
  CONSTRAINT `FK_75ypefbt4u030t4cveql9eknt` FOREIGN KEY (`code_eventtopic`) REFERENCES `EventTopic` (`code`),
  CONSTRAINT `FK_lu4331mb2buicpv8jnr6tov4p` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_mej3oe0n3c6ig1w288ojor7pi` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Events
-- ----------------------------

-- ----------------------------
-- Table structure for `EventTask`
-- ----------------------------
DROP TABLE IF EXISTS `EventTask`;
CREATE TABLE `EventTask` (
  `status` varchar(100) NOT NULL,
  `urgence` varchar(100) NOT NULL,
  `code` int(11) NOT NULL,
  `code_responsable` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_7g6169ci18wctqxmylf3498o0` (`code_responsable`),
  CONSTRAINT `FK_7g6169ci18wctqxmylf3498o0` FOREIGN KEY (`code_responsable`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_gfxm4mhlw1ih3c2poi3c1p27f` FOREIGN KEY (`code`) REFERENCES `EventTopic` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of EventTask
-- ----------------------------

-- ----------------------------
-- Table structure for `EventTopic`
-- ----------------------------
DROP TABLE IF EXISTS `EventTopic`;
CREATE TABLE `EventTopic` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_ki52s05428ryptdti7l0pnlu7` (`code_createur`),
  KEY `FK_n85mjse5uephhj65lvhwl1hhr` (`code_modificateur`),
  CONSTRAINT `FK_ki52s05428ryptdti7l0pnlu7` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_n85mjse5uephhj65lvhwl1hhr` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of EventTopic
-- ----------------------------

-- ----------------------------
-- Table structure for `Icon`
-- ----------------------------
DROP TABLE IF EXISTS `Icon`;
CREATE TABLE `Icon` (
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Icon
-- ----------------------------
INSERT INTO `Icon` VALUES ('fa  fa-institution');
INSERT INTO `Icon` VALUES ('fa fa-calendar');
INSERT INTO `Icon` VALUES ('fa fa-graduation-cap');
INSERT INTO `Icon` VALUES ('fa fa-money');
INSERT INTO `Icon` VALUES ('fa fa-wrench');
INSERT INTO `Icon` VALUES ('fa fa-wreng');
INSERT INTO `Icon` VALUES ('fa icon-settings');

-- ----------------------------
-- Table structure for `Jour`
-- ----------------------------
DROP TABLE IF EXISTS `Jour`;
CREATE TABLE `Jour` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Jour
-- ----------------------------
INSERT INTO `Jour` VALUES ('1', 'Lundi');
INSERT INTO `Jour` VALUES ('2', 'Mardi');
INSERT INTO `Jour` VALUES ('3', 'Mercredi');
INSERT INTO `Jour` VALUES ('4', 'Jeudi');
INSERT INTO `Jour` VALUES ('5', 'Vendredi');

-- ----------------------------
-- Table structure for `Matiere`
-- ----------------------------
DROP TABLE IF EXISTS `Matiere`;
CREATE TABLE `Matiere` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_ah426wko6dkv7kqx1qbwhcog8` (`type`),
  CONSTRAINT `FK_ah426wko6dkv7kqx1qbwhcog8` FOREIGN KEY (`type`) REFERENCES `TypeMatiere` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Matiere
-- ----------------------------
INSERT INTO `Matiere` VALUES ('1', 'Mathematique', '1');
INSERT INTO `Matiere` VALUES ('2', 'Physique', '1');
INSERT INTO `Matiere` VALUES ('3', 'Informatique', '1');
INSERT INTO `Matiere` VALUES ('4', 'PCT', '1');
INSERT INTO `Matiere` VALUES ('5', 'SVT', '1');
INSERT INTO `Matiere` VALUES ('6', 'Francais', '2');
INSERT INTO `Matiere` VALUES ('7', 'Anglais', '2');
INSERT INTO `Matiere` VALUES ('8', 'Redaction', '2');
INSERT INTO `Matiere` VALUES ('9', 'Allemand', '2');
INSERT INTO `Matiere` VALUES ('10', 'Espagnol', '2');
INSERT INTO `Matiere` VALUES ('11', 'Litterature', '2');
INSERT INTO `Matiere` VALUES ('12', 'Philosophie', '2');
INSERT INTO `Matiere` VALUES ('13', 'Etude de Texte', '2');
INSERT INTO `Matiere` VALUES ('14', 'Histoire', '2');
INSERT INTO `Matiere` VALUES ('15', 'Geographie', '2');
INSERT INTO `Matiere` VALUES ('16', 'Education Vie Et Amour', '3');
INSERT INTO `Matiere` VALUES ('17', 'ESF', '3');
INSERT INTO `Matiere` VALUES ('18', 'Travail Manuel', '3');
INSERT INTO `Matiere` VALUES ('19', 'Education a la Citoyennete', '3');

-- ----------------------------
-- Table structure for `Menu`
-- ----------------------------
DROP TABLE IF EXISTS `Menu`;
CREATE TABLE `Menu` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `code_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_oytepumsam0jvxieqkuti3ihu` (`libelle`),
  KEY `FK_s248ipg025n7ghnwte6yma0lg` (`code_icon`),
  CONSTRAINT `FK_s248ipg025n7ghnwte6yma0lg` FOREIGN KEY (`code_icon`) REFERENCES `Icon` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Menu
-- ----------------------------
INSERT INTO `Menu` VALUES ('1', 'Timetable', 'fa fa-calendar');
INSERT INTO `Menu` VALUES ('2', 'Securite', 'fa icon-settings');
INSERT INTO `Menu` VALUES ('6', 'Finance', 'fa fa-money');
INSERT INTO `Menu` VALUES ('7', 'Highschool', 'fa  fa-institution');
INSERT INTO `Menu` VALUES ('9', 'Exams', 'fa fa-graduation-cap');

-- ----------------------------
-- Table structure for `MouvementCaisse`
-- ----------------------------
DROP TABLE IF EXISTS `MouvementCaisse`;
CREATE TABLE `MouvementCaisse` (
  `type` varchar(31) NOT NULL,
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `date_mouvement` datetime NOT NULL,
  `description` longtext,
  `montant` decimal(19,2) NOT NULL,
  `objectMouvement` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `solde` decimal(19,2) DEFAULT NULL,
  `objectentree` varchar(255) DEFAULT NULL,
  `objectsortie` varchar(255) DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_caisse` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_alyy4o513k7nxvqr56ywjdasu` (`code_createur`),
  KEY `FK_nqso0pqx4nrt3t59tvwga6576` (`code_modificateur`),
  KEY `FK_n910t1htj65gxkr98amh6ryc4` (`code_caisse`),
  CONSTRAINT `FK_alyy4o513k7nxvqr56ywjdasu` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_n910t1htj65gxkr98amh6ryc4` FOREIGN KEY (`code_caisse`) REFERENCES `Caisse` (`code`),
  CONSTRAINT `FK_nqso0pqx4nrt3t59tvwga6576` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of MouvementCaisse
-- ----------------------------

-- ----------------------------
-- Table structure for `Notes`
-- ----------------------------
DROP TABLE IF EXISTS `Notes`;
CREATE TABLE `Notes` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `note` double NOT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_coefficient` int(11) NOT NULL,
  `code_eleveinscrit` int(11) NOT NULL,
  `code_sequence` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_crdyrkd4334n55v2hgp6gvx6m` (`code_createur`),
  KEY `FK_rdogm3qi2rwmoooibfhgdrped` (`code_modificateur`),
  KEY `FK_r719rb5bkinnnrunwrcwtwxsa` (`code_coefficient`),
  KEY `FK_2ak8n65bl3ctarm8khmk0nope` (`code_eleveinscrit`),
  KEY `FK_30x3u3wqs02wvghqbuy894mq0` (`code_sequence`),
  CONSTRAINT `FK_2ak8n65bl3ctarm8khmk0nope` FOREIGN KEY (`code_eleveinscrit`) REFERENCES `EleveInscrit` (`code`),
  CONSTRAINT `FK_30x3u3wqs02wvghqbuy894mq0` FOREIGN KEY (`code_sequence`) REFERENCES `Sequence` (`code`),
  CONSTRAINT `FK_crdyrkd4334n55v2hgp6gvx6m` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_r719rb5bkinnnrunwrcwtwxsa` FOREIGN KEY (`code_coefficient`) REFERENCES `Coefficient` (`code`),
  CONSTRAINT `FK_rdogm3qi2rwmoooibfhgdrped` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Notes
-- ----------------------------

-- ----------------------------
-- Table structure for `Professeur`
-- ----------------------------
DROP TABLE IF EXISTS `Professeur`;
CREATE TABLE `Professeur` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email_adresse` varchar(100) DEFAULT NULL,
  `telephone_mobile` varchar(100) DEFAULT NULL,
  `civilite` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `nom_prenom` varchar(255) NOT NULL,
  `numero_cni` int(11) DEFAULT NULL,
  `date_recrutement` date DEFAULT NULL,
  `diplome` varchar(255) DEFAULT NULL,
  `quota_horaire_hebdomadaire` tinyint(4) DEFAULT NULL,
  `vacataire` bit(1) DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_matiere` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_abqxlljwximadpgqx5e9c89id` (`code_createur`),
  KEY `FK_nn4ktdej1o8rekkccatnk7j5i` (`code_modificateur`),
  KEY `FK_nc8h4kpo206c2pn5xv8wqigcb` (`code_matiere`),
  CONSTRAINT `FK_abqxlljwximadpgqx5e9c89id` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_nc8h4kpo206c2pn5xv8wqigcb` FOREIGN KEY (`code_matiere`) REFERENCES `Matiere` (`code`),
  CONSTRAINT `FK_nn4ktdej1o8rekkccatnk7j5i` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Professeur
-- ----------------------------
INSERT INTO `Professeur` VALUES ('1', '2015-08-27 20:34:43', null, null, null, 'mroman@somema1l.org', '237 22491499', 'M', '1954-01-03', 'Garfield', 'Howard Duran', '28353352', null, null, null, '', '1', null, '1');
INSERT INTO `Professeur` VALUES ('2', '2015-08-27 20:34:43', null, null, null, 'bdaugherty93@ma1lbox.biz', '237 24907438', 'MME', '1952-07-06', 'Nevils', 'Julia Buck', '48447038', null, null, null, '', '1', null, '1');
INSERT INTO `Professeur` VALUES ('3', '2015-08-27 20:34:43', null, null, null, 'movedgood32@somema1l.net', '237 87954671', 'M', '1953-02-06', 'Fort Gaines', 'Terri Benjamin', '67807680', null, null, null, '', '1', null, '2');
INSERT INTO `Professeur` VALUES ('4', '2015-08-27 20:34:43', null, null, null, 'librarywe@b1zmail.co.uk', '237 17811047', 'MME', '1952-01-18', 'Odum', 'Catherine Winters', '49832057', null, null, null, '', '1', null, '2');
INSERT INTO `Professeur` VALUES ('5', '2015-08-27 20:34:44', null, null, null, 'muchhatch@b1zmail.com', '237 41955208', 'M', '1958-01-27', 'Madison', 'Jill Weiss', '69880139', null, null, null, '', '1', null, '3');
INSERT INTO `Professeur` VALUES ('6', '2015-08-27 20:34:44', null, null, null, 'rmelendez@ma1l2u.org', '237 15393807', 'MME', '1977-08-12', 'Smithville', 'Curtis Farley', '35309327', null, null, null, '', '1', null, '3');
INSERT INTO `Professeur` VALUES ('7', '2015-08-27 20:34:44', null, null, null, 'withwrite12@somema1l.co.uk', '237 96242392', 'M', '1955-01-31', 'Darien', 'Kyle Butler', '42725403', null, null, null, '', '1', null, '4');
INSERT INTO `Professeur` VALUES ('8', '2015-08-27 20:34:44', null, null, null, 'towaited@ma1l2u.org', '237 01529086', 'MME', '1963-09-03', 'Hartwell', 'Tasha Curtis', '77209700', null, null, null, '', '1', null, '4');
INSERT INTO `Professeur` VALUES ('9', '2015-08-27 20:34:44', null, null, null, 'agrant92@everyma1l.us', '237 72489299', 'M', '1968-04-09', 'New Rock Hill', 'Joann Luna', '32920013', null, null, null, '', '1', null, '5');
INSERT INTO `Professeur` VALUES ('10', '2015-08-27 20:34:44', null, null, null, 'bblackburn@hotma1l.co.uk', '237 73459747', 'MME', '1975-03-16', 'Thomasville', 'Tracie Gallegos', '26528102', null, null, null, '', '1', null, '5');
INSERT INTO `Professeur` VALUES ('11', '2015-08-27 20:34:44', null, null, null, 'dosomething@somema1l.biz', '237 14893533', 'M', '1976-02-02', 'Euharlee', 'Tasha Dyer', '86760642', null, null, null, '', '1', null, '6');
INSERT INTO `Professeur` VALUES ('12', '2015-08-27 20:34:44', null, null, null, 'ofweb@everyma1l.org', '237 20585507', 'MME', '1962-03-12', 'Bronwood', 'Bob Sanchez', '71467204', null, null, null, '', '1', null, '6');
INSERT INTO `Professeur` VALUES ('13', '2015-08-27 20:34:44', null, null, null, 'thaley@gma1l.org', '237 79261911', 'M', '1965-06-21', 'Homeland', 'Marty Moreno', '92639083', null, null, null, '', '1', null, '7');
INSERT INTO `Professeur` VALUES ('14', '2015-08-27 20:34:44', null, null, null, 'rhines@ma1l2u.biz', '237 76446640', 'MME', '1956-02-18', 'Lawrenceville', 'Ronda Bond', '98966285', null, null, null, '', '1', null, '7');
INSERT INTO `Professeur` VALUES ('15', '2015-08-27 20:34:44', null, null, null, 'warpwill@hotma1l.org', '237 69457580', 'M', '1969-04-07', 'Wrightsville', 'Marsha Whitney', '71005504', null, null, null, '', '1', null, '8');
INSERT INTO `Professeur` VALUES ('16', '2015-08-27 20:34:44', null, null, null, 'lrivers@somema1l.com', '237 11576794', 'MME', '1959-09-24', 'Colesburg', 'Tony Bishop', '297556', null, null, null, '', '1', null, '8');
INSERT INTO `Professeur` VALUES ('17', '2015-08-27 20:34:44', null, null, null, 'pwheeler@ma1l2u.org', '237 06030224', 'M', '1971-03-16', 'Lumber City', 'Troy Bryant', '62154386', null, null, null, '', '1', null, '9');
INSERT INTO `Professeur` VALUES ('18', '2015-08-27 20:34:44', null, null, null, 'handledwant@hotma1l.net', '237 48170438', 'MME', '1962-12-05', 'Dallas', 'Wyatt Bartlett', '19470571', null, null, null, '', '1', null, '9');
INSERT INTO `Professeur` VALUES ('19', '2015-08-27 20:34:44', null, null, null, 'kadams@somema1l.us', '237 67211793', 'M', '1970-04-07', 'Leefield', 'Krista Schneider', '56479150', null, null, null, '', '1', null, '10');
INSERT INTO `Professeur` VALUES ('20', '2015-08-27 20:34:44', null, null, null, 'sacrificetook@yah00.us', '237 39289643', 'MME', '1957-03-14', 'Meldrim', 'Andrea Rice', '85251841', null, null, null, '', '1', null, '10');
INSERT INTO `Professeur` VALUES ('21', '2015-08-27 20:34:44', null, null, null, 'whoit@hotma1l.biz', '237 27530883', 'M', '1977-05-26', 'Cobbtown', 'Andy Vargas', '17260276', null, null, null, '', '1', null, '11');
INSERT INTO `Professeur` VALUES ('22', '2015-08-27 20:34:44', null, null, null, 'areuntil@ma1l2u.net', '237 58184548', 'MME', '1960-06-08', 'Hopeulikit', 'Pete Kelly', '5800056', null, null, null, '', '1', null, '11');
INSERT INTO `Professeur` VALUES ('23', '2015-08-27 20:34:44', null, null, null, 'captainto@somema1l.net', '237 65165975', 'M', '1959-06-19', 'Glory', 'Aaron Macdonald', '60088412', null, null, null, '', '1', null, '12');
INSERT INTO `Professeur` VALUES ('24', '2015-08-27 20:34:45', null, null, null, 'codeill@hotma1l.us', '237 54346102', 'MME', '1952-08-10', 'Lyons', 'Toni Evans', '30597119', null, null, null, '', '1', null, '12');
INSERT INTO `Professeur` VALUES ('25', '2015-08-27 20:34:45', null, null, null, 'bdouglas@gma1l.org', '237 13790067', 'M', '1966-06-09', 'Carrollton', 'Mason Cross', '54538717', null, null, null, '', '1', null, '13');
INSERT INTO `Professeur` VALUES ('26', '2015-08-27 20:34:45', null, null, null, 'wicketends@ma1l2u.com', '237 93796555', 'MME', '1955-04-02', 'Arlington', 'Eva Sampson', '18168274', null, null, null, '', '1', null, '13');
INSERT INTO `Professeur` VALUES ('27', '2015-08-27 20:34:45', null, null, null, 'diedthey@hotma1l.us', '237 76732242', 'M', '1978-01-13', 'Baldwin', 'Nathan Clark', '1009807', null, null, null, '', '1', null, '14');
INSERT INTO `Professeur` VALUES ('28', '2015-08-27 20:34:45', null, null, null, 'wordssmoke@gma1l.net', '237 18542342', 'MME', '1971-02-05', 'Strongsville', 'Darren Mullen', '39938689', null, null, null, '', '1', null, '14');
INSERT INTO `Professeur` VALUES ('29', '2015-08-27 20:34:45', null, null, null, 'discoveredin@somema1l.us', '237 20217972', 'M', '1953-09-08', 'Willacoochee', 'Grace Garcia', '9959846', null, null, null, '', '1', null, '15');
INSERT INTO `Professeur` VALUES ('30', '2015-08-27 20:34:45', null, null, null, 'muchleader@yah00.us', '237 08350642', 'MME', '1957-10-14', 'Rutledge', 'Gina Hurley', '73399346', null, null, null, '', '1', null, '15');
INSERT INTO `Professeur` VALUES ('31', '2015-08-27 20:34:45', null, null, null, 'onbadly53@everyma1l.com', '237 41496799', 'M', '1976-02-20', 'Wrightsville', 'Patrick Rice', '95010582', null, null, null, '', '1', null, '16');
INSERT INTO `Professeur` VALUES ('32', '2015-08-27 20:34:45', null, null, null, 'eboyle@everyma1l.com', '237 39372731', 'MME', '1974-12-17', 'Georgetown', 'Joseph Collins', '80895367', null, null, null, '', '1', null, '16');
INSERT INTO `Professeur` VALUES ('33', '2015-08-27 20:34:45', null, null, null, 'cbradley@hotma1l.com', '237 39930415', 'M', '1956-05-24', 'Dock Junction', 'Sean Quinn', '64908769', null, null, null, '', '1', null, '17');
INSERT INTO `Professeur` VALUES ('34', '2015-08-27 20:34:45', null, null, null, 'deverett@everyma1l.org', '237 64995808', 'MME', '1952-06-05', 'Dock Junction', 'Matt Glover', '47201052', null, null, null, '', '1', null, '17');
INSERT INTO `Professeur` VALUES ('35', '2015-08-27 20:34:45', null, null, null, 'inhat@everyma1l.org', '237 70779038', 'M', '1960-05-30', 'Offerman', 'Marvin Higgins', '15213545', null, null, null, '', '1', null, '18');
INSERT INTO `Professeur` VALUES ('36', '2015-08-27 20:34:45', null, null, null, 'somethingwarp@hotma1l.co.uk', '237 02817413', 'MME', '1968-11-14', 'Thomasville', 'Heidi Fulton', '17504805', null, null, null, '', '1', null, '18');
INSERT INTO `Professeur` VALUES ('37', '2015-08-27 20:34:45', null, null, null, 'arichard@yah00.org', '237 94262263', 'M', '1962-01-29', 'Upton', 'Barbara Hooper', '44665846', null, null, null, '', '1', null, '19');
INSERT INTO `Professeur` VALUES ('38', '2015-08-27 20:34:45', null, null, null, 'cameare@b1zmail.biz', '237 25848180', 'MME', '1952-10-03', 'Trudie', 'Shawna Perkins', '87553327', null, null, null, '', '1', null, '19');

-- ----------------------------
-- Table structure for `Profil`
-- ----------------------------
DROP TABLE IF EXISTS `Profil`;
CREATE TABLE `Profil` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `libelle` varchar(100) NOT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_9q68md5aemgsn0xluu9xcqyr0` (`code_createur`),
  KEY `FK_l9ad0mufmnyiv21s75h85x27i` (`code_modificateur`),
  CONSTRAINT `FK_9q68md5aemgsn0xluu9xcqyr0` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_l9ad0mufmnyiv21s75h85x27i` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Profil
-- ----------------------------
INSERT INTO `Profil` VALUES ('1', '2015-08-27 20:32:41', null, 'ACTIF', 'ADMIN', null, null);
INSERT INTO `Profil` VALUES ('2', '2015-08-27 20:32:41', null, 'ACTIF', 'USER', null, null);

-- ----------------------------
-- Table structure for `Reglement`
-- ----------------------------
DROP TABLE IF EXISTS `Reglement`;
CREATE TABLE `Reglement` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `montant` decimal(19,2) NOT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_eleveinscrit` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_d4jxnueb1wbk3cve0awsi8qgi` (`code_createur`),
  KEY `FK_9jbt2j1edgq9rjc1rq2gsk0w0` (`code_modificateur`),
  KEY `FK_rh2ru7kgwju5538qf3sakhk3` (`code_eleveinscrit`),
  CONSTRAINT `FK_9jbt2j1edgq9rjc1rq2gsk0w0` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_d4jxnueb1wbk3cve0awsi8qgi` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_rh2ru7kgwju5538qf3sakhk3` FOREIGN KEY (`code_eleveinscrit`) REFERENCES `EleveInscrit` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Reglement
-- ----------------------------

-- ----------------------------
-- Table structure for `Rubrique`
-- ----------------------------
DROP TABLE IF EXISTS `Rubrique`;
CREATE TABLE `Rubrique` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `form_description` longtext,
  `grille_description` longtext,
  `libelle` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `code_menu` int(11) NOT NULL,
  `code_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_iq9gkoroq3dd39wu3etcwyteu` (`libelle`),
  KEY `FK_f4dxpxlidlvajy7gy6ylh6qgu` (`code_menu`),
  KEY `FK_9sggkqtdrwawrwbv1l2o3ox1k` (`code_icon`),
  CONSTRAINT `FK_9sggkqtdrwawrwbv1l2o3ox1k` FOREIGN KEY (`code_icon`) REFERENCES `Icon` (`code`),
  CONSTRAINT `FK_f4dxpxlidlvajy7gy6ylh6qgu` FOREIGN KEY (`code_menu`) REFERENCES `Menu` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Rubrique
-- ----------------------------
INSERT INTO `Rubrique` VALUES ('1', null, null, 'Timetable', 'Timetable', '1', null);
INSERT INTO `Rubrique` VALUES ('2', null, null, 'User', 'User', '2', null);
INSERT INTO `Rubrique` VALUES ('3', '', '', 'Compte', 'Compte', '6', null);
INSERT INTO `Rubrique` VALUES ('4', '', '', 'EleveInscrit', 'EleveInscrit', '7', null);
INSERT INTO `Rubrique` VALUES ('6', null, null, 'Cours', 'Cours', '1', null);
INSERT INTO `Rubrique` VALUES ('7', null, null, 'EntreeCaisse', 'EntreeCaisse', '6', null);
INSERT INTO `Rubrique` VALUES ('8', null, null, 'Ecole', 'Ecole', '7', null);
INSERT INTO `Rubrique` VALUES ('9', null, null, 'SortieCaisse', 'SortieCaisse', '6', null);
INSERT INTO `Rubrique` VALUES ('10', '', '', 'Eleve', 'Eleve', '7', null);
INSERT INTO `Rubrique` VALUES ('13', null, null, 'Matiere', 'Matiere', '7', null);
INSERT INTO `Rubrique` VALUES ('14', null, null, 'TypeMatiere', 'TypeMatiere', '7', null);
INSERT INTO `Rubrique` VALUES ('15', null, null, 'Menu', 'Menu', '2', null);
INSERT INTO `Rubrique` VALUES ('16', null, null, 'Serie', 'Serie', '7', null);
INSERT INTO `Rubrique` VALUES ('17', null, null, 'Notes', 'Notes', '9', null);
INSERT INTO `Rubrique` VALUES ('18', null, null, 'Droit', 'Droit', '2', null);
INSERT INTO `Rubrique` VALUES ('20', null, null, 'Profil', 'Profil', '2', null);
INSERT INTO `Rubrique` VALUES ('21', null, null, 'Coefficient', 'Coefficient', '9', null);
INSERT INTO `Rubrique` VALUES ('22', null, null, 'AnneeScolaire', 'AnneeScolaire', '7', null);
INSERT INTO `Rubrique` VALUES ('23', null, null, 'MouvementCaisse', 'MouvementCaisse', '6', null);
INSERT INTO `Rubrique` VALUES ('25', null, null, 'Rubrique', 'Rubrique', '2', null);
INSERT INTO `Rubrique` VALUES ('26', null, null, 'Caisse', 'Caisse', '6', null);
INSERT INTO `Rubrique` VALUES ('27', null, null, 'Sequence', 'Sequence', '9', null);
INSERT INTO `Rubrique` VALUES ('28', null, null, 'Creneau', 'Creneau', '1', null);
INSERT INTO `Rubrique` VALUES ('29', null, null, 'Services', 'Services', '2', null);
INSERT INTO `Rubrique` VALUES ('32', '', '', 'Professeur', 'Professeur', '7', null);
INSERT INTO `Rubrique` VALUES ('33', null, null, 'Classe', 'Classe', '7', null);
INSERT INTO `Rubrique` VALUES ('34', '', '', 'Reglement', 'Reglement', '6', null);
INSERT INTO `Rubrique` VALUES ('35', null, null, 'Icon', 'Icon', '2', null);
INSERT INTO `Rubrique` VALUES ('36', null, null, 'UserProfil', 'UserProfil', '2', null);

-- ----------------------------
-- Table structure for `Sequence`
-- ----------------------------
DROP TABLE IF EXISTS `Sequence`;
CREATE TABLE `Sequence` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Sequence
-- ----------------------------
INSERT INTO `Sequence` VALUES ('1');
INSERT INTO `Sequence` VALUES ('2');
INSERT INTO `Sequence` VALUES ('3');
INSERT INTO `Sequence` VALUES ('4');
INSERT INTO `Sequence` VALUES ('5');
INSERT INTO `Sequence` VALUES ('6');

-- ----------------------------
-- Table structure for `Serie`
-- ----------------------------
DROP TABLE IF EXISTS `Serie`;
CREATE TABLE `Serie` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `abreviation` varchar(255) DEFAULT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `montant_inscription` decimal(19,2) NOT NULL,
  `niveau` varchar(255) DEFAULT NULL,
  `tranche1` decimal(19,2) NOT NULL,
  `tranche2` decimal(19,2) DEFAULT NULL,
  `tranche3` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Serie
-- ----------------------------
INSERT INTO `Serie` VALUES ('1', 'TALL', 'Terminale Allemand', '10000.00', 'NIVEAU7', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('2', 'PALL', 'Premiere Allemand', '10000.00', 'NIVEAU6', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('3', '6M', 'Sixieme', '10000.00', 'NIVEAU1', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('4', 'PESP', 'Premiere Espagnol', '10000.00', 'NIVEAU6', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('5', 'TESP', 'Terminale Espagnol', '10000.00', 'NIVEAU7', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('6', 'TD', 'Terminale D', '10000.00', 'NIVEAU7', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('7', 'TC', 'Terminale C', '10000.00', 'NIVEAU7', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('8', '4ESP', 'Quatrieme Espagnol', '10000.00', 'NIVEAU3', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('9', '2ALL', 'Seconde Allemand', '10000.00', 'NIVEAU5', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('10', '2ESP', 'Seconde Espagnol', '10000.00', 'NIVEAU5', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('11', '2C', 'Seconde C', '10000.00', 'NIVEAU5', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('12', 'PC', 'Premiere C', '10000.00', 'NIVEAU6', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('13', 'PD', 'Premiere D', '10000.00', 'NIVEAU6', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('14', '4ALL', 'Quatrieme Allemand', '10000.00', 'NIVEAU3', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('15', '3ESP', 'Troisieme Espagnol', '10000.00', 'NIVEAU4', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('16', '5M', 'Cinquieme', '10000.00', 'NIVEAU2', '50000.00', null, null);
INSERT INTO `Serie` VALUES ('17', '3ALL', 'Troisieme Allemand', '10000.00', 'NIVEAU4', '50000.00', null, null);

-- ----------------------------
-- Table structure for `Services`
-- ----------------------------
DROP TABLE IF EXISTS `Services`;
CREATE TABLE `Services` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `libelle` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_re35qlkavuinfhlwj0x20b1nm` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Services
-- ----------------------------
INSERT INTO `Services` VALUES ('1', 'Permet de cloturer une annee scolaire.Cette action est irreversible', 'Ctorure Annee Scolaire', 'clotureAnneeScolaire', 'ACTION');
INSERT INTO `Services` VALUES ('2', '', 'Definition Coefficient', 'coefficientController', 'CUSTOM');
INSERT INTO `Services` VALUES ('3', '', 'Etat des paiements', 'reportPayment', 'ACTION');
INSERT INTO `Services` VALUES ('8', '', 'Bulletin Sequence', 'bulletinSeqService', 'REPORT');
INSERT INTO `Services` VALUES ('9', '', 'Saisie des notes', 'notesController', 'CUSTOM');
INSERT INTO `Services` VALUES ('11', '', 'Emploi de Temps', 'timetableController', 'CUSTOM');
INSERT INTO `Services` VALUES ('12', '', 'Generation EDT', 'coursGraphColoring', 'ACTION');
INSERT INTO `Services` VALUES ('13', '', 'Statistiques Examen', 'reportExam', 'CUSTOM');
INSERT INTO `Services` VALUES ('14', '', 'Bulletin Trimestre', 'bulletinTriService', 'REPORT');

-- ----------------------------
-- Table structure for `Timetable`
-- ----------------------------
DROP TABLE IF EXISTS `Timetable`;
CREATE TABLE `Timetable` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_annee` int(11) NOT NULL,
  `code_cours` int(11) NOT NULL,
  `code_creneau` int(11) NOT NULL,
  `code_jour` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_palutdxfigvh5erx6cw7y3xx6` (`code_createur`),
  KEY `FK_gg2swbn9xi43v45judb1uff4j` (`code_modificateur`),
  KEY `FK_a1ktadw7gspihkc35611d9q0u` (`code_annee`),
  KEY `FK_4kwwlw12fqr30jj3k8g7gw5dw` (`code_cours`),
  KEY `FK_15fy0gpyq7xg2w4tr9ipejbdj` (`code_creneau`),
  KEY `FK_fu22hmg59fet7okr3v9kp4ta8` (`code_jour`),
  CONSTRAINT `FK_fu22hmg59fet7okr3v9kp4ta8` FOREIGN KEY (`code_jour`) REFERENCES `Jour` (`code`),
  CONSTRAINT `FK_15fy0gpyq7xg2w4tr9ipejbdj` FOREIGN KEY (`code_creneau`) REFERENCES `Creneau` (`code`),
  CONSTRAINT `FK_4kwwlw12fqr30jj3k8g7gw5dw` FOREIGN KEY (`code_cours`) REFERENCES `Cours` (`code`),
  CONSTRAINT `FK_a1ktadw7gspihkc35611d9q0u` FOREIGN KEY (`code_annee`) REFERENCES `AnneeScolaire` (`code`),
  CONSTRAINT `FK_gg2swbn9xi43v45judb1uff4j` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_palutdxfigvh5erx6cw7y3xx6` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Timetable
-- ----------------------------
INSERT INTO `Timetable` VALUES ('20', '2015-08-30 18:23:32', null, null, '1', null, '1', '1', '6', '5');
INSERT INTO `Timetable` VALUES ('21', '2015-08-30 18:23:32', null, null, '1', null, '1', '1', '2', '1');
INSERT INTO `Timetable` VALUES ('22', '2015-08-30 18:23:32', null, null, '1', null, '1', '1', '5', '3');
INSERT INTO `Timetable` VALUES ('23', '2015-08-30 18:23:32', null, null, '1', null, '1', '1', '8', '5');
INSERT INTO `Timetable` VALUES ('24', '2015-08-30 18:23:32', null, null, '1', null, '1', '1', '1', '2');
INSERT INTO `Timetable` VALUES ('25', '2015-08-30 18:23:32', null, null, '1', null, '1', '1', '4', '1');
INSERT INTO `Timetable` VALUES ('26', '2015-08-30 18:23:32', null, null, '1', null, '1', '1', '2', '5');
INSERT INTO `Timetable` VALUES ('27', '2015-08-30 18:23:32', null, null, '1', null, '1', '1', '1', '4');
INSERT INTO `Timetable` VALUES ('28', '2015-08-30 18:23:32', null, null, '1', null, '1', '2', '1', '3');
INSERT INTO `Timetable` VALUES ('29', '2015-08-30 18:23:33', null, null, '1', null, '1', '2', '2', '4');
INSERT INTO `Timetable` VALUES ('30', '2015-08-30 18:23:33', null, null, '1', null, '1', '2', '1', '1');
INSERT INTO `Timetable` VALUES ('31', '2015-08-30 18:23:33', null, null, '1', null, '1', '2', '4', '2');
INSERT INTO `Timetable` VALUES ('32', '2015-08-30 18:23:33', null, null, '1', null, '1', '3', '8', '4');
INSERT INTO `Timetable` VALUES ('33', '2015-08-30 18:23:33', null, null, '1', null, '1', '3', '6', '2');
INSERT INTO `Timetable` VALUES ('34', '2015-08-30 18:23:33', null, null, '1', null, '1', '4', '9', '2');
INSERT INTO `Timetable` VALUES ('35', '2015-08-30 18:23:33', null, null, '1', null, '1', '4', '4', '5');
INSERT INTO `Timetable` VALUES ('36', '2015-08-30 18:23:33', null, null, '1', null, '1', '4', '6', '4');
INSERT INTO `Timetable` VALUES ('37', '2015-08-30 18:23:33', null, null, '1', null, '1', '4', '8', '2');
INSERT INTO `Timetable` VALUES ('38', '2015-08-30 18:23:33', null, null, '1', null, '1', '4', '4', '4');

-- ----------------------------
-- Table structure for `TypeMatiere`
-- ----------------------------
DROP TABLE IF EXISTS `TypeMatiere`;
CREATE TABLE `TypeMatiere` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of TypeMatiere
-- ----------------------------
INSERT INTO `TypeMatiere` VALUES ('1', 'MATIERES SCIENTIFIQUES');
INSERT INTO `TypeMatiere` VALUES ('2', 'MATIERES LITTERAIRES');
INSERT INTO `TypeMatiere` VALUES ('3', 'MATIERES FORMATIONS HUMAINES');

-- ----------------------------
-- Table structure for `User`
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email_adresse` varchar(100) DEFAULT NULL,
  `telephone_mobile` varchar(100) DEFAULT NULL,
  `civilite` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `nom_prenom` varchar(255) NOT NULL,
  `numero_cni` int(11) DEFAULT NULL,
  `accountNonExpired` bit(1) DEFAULT NULL,
  `date_changementpwd` datetime DEFAULT NULL,
  `date_expirationpwd` datetime DEFAULT NULL,
  `lastaccessdate` datetime DEFAULT NULL,
  `login_attempts` tinyint(4) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `question_secrete` varchar(255) DEFAULT NULL,
  `reponse_question_secrete` varchar(255) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_jreodf78a7pl5qidfh43axdfb` (`username`),
  KEY `FK_fvt5ciaahuniadlm0ymjf9onc` (`code_createur`),
  KEY `FK_rdye15peix89i7cdybfgc5b9q` (`code_modificateur`),
  CONSTRAINT `FK_fvt5ciaahuniadlm0ymjf9onc` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_rdye15peix89i7cdybfgc5b9q` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES ('1', null, '2015-08-31 10:45:47', 'ACTIF', '', 'csuarez@b1zmail.org', '237 29728131', null, null, 'Dixie', 'Lindsey Craft', null, '', '2015-08-31 10:45:38', '2016-02-29 10:45:38', '2015-08-31 10:45:47', '0', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'papa', 'fad9a0a6f25df623a055091fe7e403534c7e9536', 'admin', null, '1');
INSERT INTO `User` VALUES ('2', '2015-08-27 20:32:41', null, 'ACTIF', null, 'aretrees@everyma1l.net', '237 56551235', null, '1973-12-14', 'Ellijay', 'Nancy Stevens', null, '', null, null, null, '0', '93f9892cb654d0de9ccf4a903a85841d4faa94ed', null, null, 'O\'neill', null, null);
INSERT INTO `User` VALUES ('3', '2015-08-27 20:32:41', null, 'ACTIF', null, 'kelliott@ma1l2u.net', '237 76557336', null, '1972-03-04', 'Rome', 'Janet Abbott', null, '', null, null, null, '0', '4d6d294d6601c7a4bb7f36f2133a749685a35a20', null, null, 'Suarez', null, null);
INSERT INTO `User` VALUES ('4', '2015-08-27 20:32:41', null, 'ACTIF', null, 'fdrake@yah00.biz', '237 49470058', null, '1977-01-12', 'Louisville', 'Marty Franco', null, '', null, null, null, '0', 'a90de9701e67a358423874204d032971f44aa671', null, null, 'Dunn', null, null);
INSERT INTO `User` VALUES ('5', '2015-08-27 20:32:41', null, 'ACTIF', null, 'theof@ma1l2u.com', '237 18422948', null, '1961-04-04', 'Donalsonville', 'Michael Gross', null, '', null, null, null, '0', '2b28d1cd5b792fa708e928e31ce80d0772ca71da', null, null, 'Schneider', null, null);
INSERT INTO `User` VALUES ('6', '2015-08-27 20:32:41', null, 'ACTIF', null, 'hlarson@gma1l.com', '237 43931350', null, '1964-08-22', 'Atlanta', 'Patrick Walker', null, '', null, null, null, '0', '8413dfbfdc785f396b85aa5e9aa87c58c9caf0f2', null, null, 'Richardson', null, null);
INSERT INTO `User` VALUES ('7', '2015-08-27 20:32:41', null, 'ACTIF', null, 'wheath43@ma1l2u.org', '237 63930850', null, '1969-05-07', 'Darien', 'Carrie McDowell', null, '', null, null, null, '0', '868c9f5323309397b8934005f3dddce4fa2193fc', null, null, 'Chang', null, null);
INSERT INTO `User` VALUES ('8', '2015-08-27 20:32:41', null, 'ACTIF', null, 'diedcame@b1zmail.co.uk', '237 36151883', null, '1968-05-14', 'Chula', 'Sharon Fuentes', null, '', null, null, null, '0', '77cdd861e986d3dfc6279c044f3b7561243adf24', null, null, 'Daugherty', null, null);
INSERT INTO `User` VALUES ('9', '2015-08-27 20:32:41', null, 'ACTIF', null, 'ksherman31@ma1l2u.us', '237 15931747', null, '1974-11-16', 'Dupont', 'Ralph Logan', null, '', null, null, null, '0', '6e7f4c6b99bfd07f34928d4325175ac99dfa6844', null, null, 'Cotton', null, null);
INSERT INTO `User` VALUES ('10', '2015-08-27 20:32:41', null, 'ACTIF', null, 'eblevins@gma1l.co.uk', '237 98894618', null, '1961-12-17', 'Bloomingdale', 'Kyle Dudley', null, '', null, null, null, '0', '4b5f11b4a597f1401798aaac31ccff812cb08a59', null, null, 'Howell', null, null);
INSERT INTO `User` VALUES ('11', '2015-08-27 20:32:41', null, 'ACTIF', null, 'islandon@everyma1l.us', '237 85811963', null, '1975-08-25', 'Dawsonville', 'Jeffrey Collins', null, '', null, null, null, '0', '4bdba3d7565a762da2da4073cd27c331ba78f6d0', null, null, 'Weber', null, null);
INSERT INTO `User` VALUES ('12', '2015-08-27 20:32:41', null, 'ACTIF', null, 'camesidekick@gma1l.co.uk', '237 02450273', null, '1954-07-18', 'Norcross', 'Marlene Mays', null, '', null, null, null, '0', '23b1bcb69bb91dec50bb13e875fb9401ed3d2cf6', null, null, 'Cleveland', null, null);
INSERT INTO `User` VALUES ('13', '2015-08-27 20:32:41', null, 'ACTIF', null, 'mjennings@ma1lbox.co.uk', '237 78949335', null, '1962-12-14', 'Buena Vista', 'Penny Spears', null, '', null, null, null, '0', '7da240ad5f55280b4c300231d6d9f6d4b913328f', null, null, 'Odom', null, null);
INSERT INTO `User` VALUES ('14', '2015-08-27 20:32:41', null, 'ACTIF', null, 'rcantrell@yah00.net', '237 63569212', null, '1971-01-31', 'Preston', 'Tashia Robles', null, '', null, null, null, '0', 'e8b685271238adf161cffed3c91f54d97023262b', null, null, 'Fields', null, null);
INSERT INTO `User` VALUES ('15', '2015-08-27 20:32:41', null, 'ACTIF', null, 'generatedenter88@hotma1l.net', '237 66675689', null, '1973-08-18', 'Doraville', 'Abigail Orr', null, '', null, null, null, '0', '6fdc79dedbf873fb5b1d753550ea4809943c3c42', null, null, 'Lawson', null, null);

-- ----------------------------
-- Table structure for `UserProfil`
-- ----------------------------
DROP TABLE IF EXISTS `UserProfil`;
CREATE TABLE `UserProfil` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_profil` int(11) DEFAULT NULL,
  `code_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_punwxlagt0cwefx9mujmr1rd5` (`code_createur`),
  KEY `FK_myfdd9rgjwlbqavfy0tkyiip8` (`code_modificateur`),
  KEY `FK_9285rcv8f16yc5v30iny32dok` (`code_profil`),
  KEY `FK_a12i6ysur3emn9ux6vplbaocc` (`code_user`),
  CONSTRAINT `FK_9285rcv8f16yc5v30iny32dok` FOREIGN KEY (`code_profil`) REFERENCES `Profil` (`code`),
  CONSTRAINT `FK_a12i6ysur3emn9ux6vplbaocc` FOREIGN KEY (`code_user`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_myfdd9rgjwlbqavfy0tkyiip8` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_punwxlagt0cwefx9mujmr1rd5` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of UserProfil
-- ----------------------------
INSERT INTO `UserProfil` VALUES ('1', '2015-08-27 20:32:41', null, 'ACTIF', null, null, '1', '1');

-- ----------------------------
-- Function structure for `appreceate`
-- ----------------------------
DROP FUNCTION IF EXISTS `appreceate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `appreceate`(note double) RETURNS varchar(20) CHARSET latin1
    DETERMINISTIC
return 
case
 when  (note>=00 and note<08)   then 'Faible'
 when  (note>=08 and note<10)   then 'Mediocre'
  when  (note>=10 and note<12)   then 'Passable'
  when  (note>=12 and note<14)   then 'Assez bien'
   when  (note>=14 and note<16)   then  'Bien'
 when ( note>=16 and note<18)   then 'Tres Bien'
 when  (note>=18 and note<=20)   then 'Excellent'
  when note is null then ''
  else ''
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `looptest`
-- ----------------------------
DROP FUNCTION IF EXISTS `looptest`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `looptest`(nompersonne varchar(100)) RETURNS int(11)
    READS SQL DATA
BEGIN
  DECLARE v_total INT;
  DECLARE v_counter INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE csr CURSOR FOR 
    SELECT code FROM Eleve where nom like nompersonne;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  SET v_total = 0;
  OPEN csr;
  read_loop: LOOP
    FETCH csr INTO v_counter;

    IF done THEN
      LEAVE read_loop;
    END IF;

    SET v_total = v_total + v_counter;
  END LOOP;
  CLOSE csr;

  RETURN v_total;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `maxnotematiere`
-- ----------------------------
DROP FUNCTION IF EXISTS `maxnotematiere`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `maxnotematiere`(cours int(11),classe int(11),numseq int(3)) RETURNS double
    READS SQL DATA
BEGIN
DECLARE v_total INT;
  DECLARE v_counter INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE csr CURSOR FOR  

select max(n.note)

from Coefficient coef join Matiere m on (m.code=coef.code_matiere) join Classe c on (c.code_serie=coef.code_serie) join EleveInscrit ei on (ei.code_classe=c.code) join Eleve e on (ei.code_eleve=e.code)  left join Notes n on (n.code_eleveinscrit=ei.code and n.code_coefficient=coef.code  and (n.code_sequence = numseq))   where c.code=classe  and ei.cycle_vie='ACTIF'   and m.code=cours;



DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 SET v_total = 0;
  OPEN csr;
  read_loop: LOOP
    FETCH csr INTO v_counter;

    IF done THEN
      LEAVE read_loop;
    END IF;
  
    SET v_total = v_total + v_counter;
  END LOOP;
  CLOSE csr;

  RETURN v_total;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `maxnotematiere1`
-- ----------------------------
DROP FUNCTION IF EXISTS `maxnotematiere1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `maxnotematiere1`(cours int(11),classe int(11),numtri int(3)) RETURNS double
    READS SQL DATA
BEGIN
DECLARE v_total INT;
  DECLARE v_counter INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE csr CURSOR FOR  

select max(notefinal) from (
select e.matricule,m.libelle as discipline,coef.valeur as coef,n1.note as note1,n2.note as note2,@notefinal:=(ifnull(n1.note,0)+ifnull(n2.note,0))/2 as notefinal
from Coefficient coef join Matiere m on (m.code=coef.code_matiere) join Classe c on (c.code_serie=coef.code_serie) join EleveInscrit ei on (ei.code_classe=c.code) join Eleve e on (ei.code_eleve=e.code)  left join Notes n1 on (n1.code_eleveinscrit=ei.code and n1.code_coefficient=coef.code  and n1.code_sequence=(numtri*2)-1)  left join Notes n2 on (n2.code_eleveinscrit=ei.code and n2.code_coefficient=coef.code  and n2.code_sequence=numtri*2) 
where c.code = classe  and ei.cycle_vie='ACTIF'  and m.code= cours )
as result;



DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 SET v_total = 0;
  OPEN csr;
  read_loop: LOOP
    FETCH csr INTO v_counter;

    IF done THEN
      LEAVE read_loop;
    END IF;
  
    SET v_total = v_total + v_counter;
  END LOOP;
  CLOSE csr;

  RETURN v_total;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `minnotematiere`
-- ----------------------------
DROP FUNCTION IF EXISTS `minnotematiere`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `minnotematiere`(cours int(11),classe int(11),numseq int(3)) RETURNS double
    READS SQL DATA
BEGIN
DECLARE v_total INT;
  DECLARE v_counter INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE csr CURSOR FOR  

select min(n.note)
from Coefficient coef join Matiere m on (m.code=coef.code_matiere) join Classe c on (c.code_serie=coef.code_serie) join EleveInscrit ei on (ei.code_classe=c.code) join Eleve e on (ei.code_eleve=e.code)  left join Notes n on (n.code_eleveinscrit=ei.code and n.code_coefficient=coef.code  and (n.code_sequence = numseq))   where c.code= classe  and ei.cycle_vie='ACTIF'   and m.code = cours;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 SET v_total = 0;
  OPEN csr;
  read_loop: LOOP
    FETCH csr INTO v_counter;

    IF done THEN
      LEAVE read_loop;
    END IF;
  
    SET v_total = v_total + v_counter;
  END LOOP;
  CLOSE csr;

  RETURN v_total;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `minnotematiere1`
-- ----------------------------
DROP FUNCTION IF EXISTS `minnotematiere1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `minnotematiere1`(cours int(11),classe int(11),numtri int(3)) RETURNS double
    READS SQL DATA
BEGIN
DECLARE v_total INT;
  DECLARE v_counter INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE csr CURSOR FOR  

select min(notefinal) from (
select e.matricule,m.libelle as discipline,coef.valeur as coef,n1.note as note1,n2.note as note2,@notefinal:=(ifnull(n1.note,0)+ifnull(n2.note,0))/2 as notefinal
from Coefficient coef join Matiere m on (m.code=coef.code_matiere) join Classe c on (c.code_serie=coef.code_serie) join EleveInscrit ei on (ei.code_classe=c.code) join Eleve e on (ei.code_eleve=e.code)  left join Notes n1 on (n1.code_eleveinscrit=ei.code and n1.code_coefficient=coef.code  and n1.code_sequence=(numtri*2)-1)  left join Notes n2 on (n2.code_eleveinscrit=ei.code and n2.code_coefficient=coef.code  and n2.code_sequence=numtri*2) 
where c.code = classe  and ei.cycle_vie='ACTIF'  and m.code= cours )
as result;



DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 SET v_total = 0;
  OPEN csr;
  read_loop: LOOP
    FETCH csr INTO v_counter;

    IF done THEN
      LEAVE read_loop;
    END IF;
  
    SET v_total = v_total + v_counter;
  END LOOP;
  CLOSE csr;

  RETURN v_total;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `rangmatiere`
-- ----------------------------
DROP FUNCTION IF EXISTS `rangmatiere`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `rangmatiere`(cours int(11),codeeleve int(11),numseq int(3),classe int(11)) RETURNS int(11)
    READS SQL DATA
BEGIN
  DECLARE v_total INT;
  DECLARE v_counter INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE csr CURSOR FOR 



select rang from (
 select result.*,@row_number:=@row_number+1 AS rang from  (
select e.code,m.libelle,n.note
from Coefficient coef join Matiere m on (m.code=coef.code_matiere) join Classe c on (c.code_serie=coef.code_serie) join EleveInscrit ei on (ei.code_classe=c.code) join Eleve e on (ei.code_eleve=e.code)  left join Notes n on (n.code_eleveinscrit=ei.code and n.code_coefficient=coef.code  and (n.code_sequence = numseq))  
 where c.code= classe  and ei.cycle_vie='ACTIF'   and m.code= cours  order by note  desc
) as result,(SELECT @row_number:=0) AS t ) as result1  where code=codeeleve;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 SET v_total = 0;
  OPEN csr;
  read_loop: LOOP
    FETCH csr INTO v_counter;

    IF done THEN
      LEAVE read_loop;
    END IF;
  
    SET v_total = v_total + v_counter;
  END LOOP;
  CLOSE csr;

  RETURN v_total;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `rangmatiere1`
-- ----------------------------
DROP FUNCTION IF EXISTS `rangmatiere1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `rangmatiere1`(cours int(11),codeeleve int(11),numtri int(3),classe int(11)) RETURNS int(11)
    READS SQL DATA
BEGIN
  DECLARE v_total INT;
  DECLARE v_counter INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE csr CURSOR FOR 

select rang from (
 select result.*,@row_number:=@row_number+1 AS rang from  (
select e.code,m.libelle as discipline,coef.valeur as coef,n1.note as note1,n2.note as note2,@notefinal:=(ifnull(n1.note,0)+ifnull(n2.note,0))/2 as notefinal
from Coefficient coef join Matiere m on (m.code=coef.code_matiere) join Classe c on (c.code_serie=coef.code_serie) join EleveInscrit ei on (ei.code_classe=c.code) join Eleve e on (ei.code_eleve=e.code)  left join Notes n1 on (n1.code_eleveinscrit=ei.code and n1.code_coefficient=coef.code  and n1.code_sequence=(numtri*2)-1)  left join Notes n2 on (n2.code_eleveinscrit=ei.code and n2.code_coefficient=coef.code  and n2.code_sequence=numtri*2) 
where c.code= classe  and ei.cycle_vie='ACTIF'  and m.code= cours  order by notefinal desc
) as result,(SELECT @row_number:=0) AS t ) as result1  where code=codeeleve;




DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 SET v_total = 0;
  OPEN csr;
  read_loop: LOOP
    FETCH csr INTO v_counter;

    IF done THEN
      LEAVE read_loop;
    END IF;
  
    SET v_total = v_total + v_counter;
  END LOOP;
  CLOSE csr;

  RETURN v_total;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `trimestre`
-- ----------------------------
DROP FUNCTION IF EXISTS `trimestre`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `trimestre`(numseq int(3)) RETURNS int(11)
    DETERMINISTIC
return 
  case
 when  (numseq=1 or numseq=2)   then 1
 when  (numseq=3 or numseq=4)   then 2
  when  (numseq=5 or numseq=6)   then 3
when numseq is null then 0
  else 0

END
;;
DELIMITER ;
