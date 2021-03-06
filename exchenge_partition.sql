DROP TABLE opldok_tmp PURGE;

create table opldok_tmp
   tablespace BRSBIGD
   storage (initial 900m
   next 50m
   maxextents unlimited)
parallel (degree 4)
unrecoverable
as
select  * from bars.opldok partition (OPLDOK_Y2015_Q4);

 ALTER TABLE BARS.OPLDOK TRUNCATE PARTITION OPLDOK_Y2015_Q4;
 
 
 -- truncate table OPLDOK_TMP
  
 /* 
 -- SET TIMING ON;
ALTER TABLE BARS.OPLDOK   
  EXCHANGE PARTITION OPLDOK_Y2014_Q2
  WITH TABLE KF300465.OPLDOK_TMP
  WITHOUT VALIDATION
  UPDATE GLOBAL INDEXES;
  
  */
  
--SET TIMING ON;
ALTER TABLE KF300465.OPLDOK   
  EXCHANGE PARTITION OPLDOK_Y2015_Q4
  WITH TABLE KF300465.OPLDOK_TMP
  WITHOUT VALIDATION
  UPDATE GLOBAL INDEXES;
  
  
  --select  * from opldok partition (OPLDOK_Y2015_Q2) WHERE ROWNUM<3
