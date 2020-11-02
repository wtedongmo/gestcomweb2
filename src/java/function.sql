--
-- Dumping routines for database 'test'
--
/*!50003 DROP FUNCTION IF EXISTS `appreceate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
drop FUNCTION if EXISTS appreceate;
CREATE     FUNCTION `appreceate`(note double) RETURNS varchar(20) CHARSET latin1
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `looptest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
drop FUNCTION if EXISTS looptest;
CREATE     FUNCTION `looptest`(nompersonne varchar(100)) RETURNS int(11)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `maxnotematiere` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
drop FUNCTION if EXISTS maxnotematiere;
CREATE     FUNCTION `maxnotematiere`(cours int(11),classe int(11),numseq int(3)) RETURNS double
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `maxnotematiere1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
drop FUNCTION if EXISTS maxnotematiere1;
CREATE     FUNCTION `maxnotematiere1`(cours int(11),classe int(11),numtri int(3)) RETURNS double
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `minnotematiere` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
drop FUNCTION if EXISTS minnotematiere;
CREATE     FUNCTION `minnotematiere`(cours int(11),classe int(11),numseq int(3)) RETURNS double
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `minnotematiere1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
drop FUNCTION if EXISTS minnotematiere1;
CREATE     FUNCTION `minnotematiere1`(cours int(11),classe int(11),numtri int(3)) RETURNS double
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `rangmatiere` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
drop FUNCTION if EXISTS rangmatiere;
CREATE     FUNCTION `rangmatiere`(cours int(11),codeeleve int(11),numseq int(3),classe int(11)) RETURNS int(11)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `rangmatiere1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
drop FUNCTION if EXISTS rangmatiere1;
CREATE     FUNCTION `rangmatiere1`(cours int(11),codeeleve int(11),numtri int(3),classe int(11)) RETURNS int(11)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `trimestre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
drop FUNCTION if EXISTS trimestre;
CREATE     FUNCTION `trimestre`(numseq int(3)) RETURNS int(11)
    DETERMINISTIC
return 
  case
 when  (numseq=1 or numseq=2)   then 1
 when  (numseq=3 or numseq=4)   then 2
  when  (numseq=5 or numseq=6)   then 3
when numseq is null then 0
  else 0

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-05 17:40:13

