-- DROP TABLE OPER_300465_Y2016_Q2 PURGE;
-- truncate table OPER_300465_Y2016_Q2
-- truncate table OPER
-- ALTER TABLE BARS.oper TRUNCATE PARTITION OPER_Y2016_Q2;
-- select  * from opldok partition (OPLDOK_Y2016_Q2) WHERE ROWNUM<3

------------------
--*************************************************
--check virtual column, to doasen't exist. If  exist recreate table CTAS with compress
select col#, name
from sys.col$
where obj# in
(select object_id from dba_objects where owner= user and object_name = 'ARC_RRP')
order by col#;
--*************************************
ALTER TABLE ARC_RRP SET UNUSED COLUMN SYS_NC00049$;
ALTER TABLE ARC_RRP DROP UNUSED COLUMNS;
------------------
--ORA-14136: ALTER TABLE EXCHANGE restricted by fine-grained security
grant exempt access policy to BARS;

--after exchange need revoke, bekause this role egnor all policy 
revoke  exempt access policy from bars
---------------------
--ORA-14278: column type or size mismatch in EXCHANGE SUBPARTITION
--ORA-14279: index mismatch for tables in ALTER TABLE EXCHANGE SUBPARTITION

ALTER TABLE "OPER_300465_Y2015_Q1" ADD CONSTRAINT "PK_OPER_300465_Y2015_Q1" PRIMARY KEY ("REF")
USING INDEX (CREATE INDEX "PK_OPER_300465_Y2015_Q1" ON OPER_300465_Y2015_Q1("REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2015_Q1" ADD CONSTRAINT "UK_OPER_300465_Y2015_Q1" UNIQUE ("KF", "REF")
USING INDEX (CREATE UNIQUE INDEX "BARS"."UK_OPER_300465_Y2015_Q1" ON "BARS"."OPER_300465_Y2015_Q1" ("KF", "REF") TABLESPACE "BRSOPERI" NOLOGGING) DISABLE;

ALTER TABLE "OPER_300465_Y2015_Q2" ADD CONSTRAINT "PK_OPER_300465_Y2015_Q2" PRIMARY KEY ("REF")
USING INDEX (CREATE INDEX "PK_OPER_300465_Y2015_Q2" ON OPER_300465_Y2015_Q2("REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2015_Q2" ADD CONSTRAINT "UK_OPER_300465_Y2015_Q2" UNIQUE ("KF", "REF")
USING INDEX (CREATE UNIQUE INDEX "BARS"."UK_OPER_300465_Y2015_Q2" ON "BARS"."OPER_300465_Y2015_Q2" ("KF", "REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2015_Q3" ADD CONSTRAINT "PK_OPER_300465_Y2015_Q3" PRIMARY KEY ("REF")
USING INDEX (CREATE INDEX "PK_OPER_300465_Y2015_Q3" ON OPER_300465_Y2015_Q3("REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2015_Q3" ADD CONSTRAINT "UK_OPER_300465_Y2015_Q3" UNIQUE ("KF", "REF")
USING INDEX (CREATE UNIQUE INDEX "BARS"."UK_OPER_300465_Y2015_Q3" ON "BARS"."OPER_300465_Y2015_Q3" ("KF", "REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2015_Q4" ADD CONSTRAINT "PK_OPER_300465_Y2015_Q4" PRIMARY KEY ("REF")
USING INDEX (CREATE INDEX "PK_OPER_300465_Y2015_Q4" ON OPER_300465_Y2015_Q4("REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2015_Q4" ADD CONSTRAINT "UK_OPER_300465_Y2015_Q4" UNIQUE ("KF", "REF")
USING INDEX (CREATE UNIQUE INDEX "BARS"."UK_OPER_300465_Y2015_Q4" ON "BARS"."OPER_300465_Y2015_Q4" ("KF", "REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2016_Q1" ADD CONSTRAINT "PK_OPER_300465_Y2016_Q1" PRIMARY KEY ("REF")
USING INDEX (CREATE INDEX "PK_OPER_300465_Y2016_Q1" ON OPER_300465_Y2016_Q1("REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2016_Q1" ADD CONSTRAINT "UK_OPER_300465_Y2016_Q1" UNIQUE ("KF", "REF")
USING INDEX (CREATE UNIQUE INDEX "BARS"."UK_OPER_300465_Y2016_Q1" ON "BARS"."OPER_300465_Y2016_Q1" ("KF", "REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2016_Q2" ADD CONSTRAINT "PK_OPER_300465_Y2016_Q2" PRIMARY KEY ("REF")
USING INDEX (CREATE INDEX "PK_OPER_300465_Y2016_Q2" ON OPER_300465_Y2016_Q2("REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

ALTER TABLE "OPER_300465_Y2016_Q2" ADD CONSTRAINT "UK_OPER_300465_Y2016_Q2" UNIQUE ("KF", "REF")
USING INDEX (CREATE UNIQUE INDEX "BARS"."UK_OPER_300465_Y2016_Q2" ON "BARS"."OPER_300465_Y2016_Q2" ("KF", "REF") TABLESPACE "BRSOPERI" NOLOGGING) ENABLE;

---------------------



---------------------
--begin bpa.alter_policy_info( 'OPER_300465_Y2016_Q2', 'WHOLE' , null, null, null, null ); end;
--begin bpa.alter_policy_info( 'OPER_300465_Y2016_Q2', 'FILIAL', null, null, null, null ); end;

--create table BARS.OPER_300465_Y2016_Q2
---------------------
ALTER TABLE OPER
EXCHANGE SUBPARTITION OPER_Y2016_Q2_300465_SP
WITH TABLE OPER_300465_Y2016_Q2
--INCLUDING INDEXES
WITHOUT VALIDATION
--UPDATE GLOBAL INDEXES
;
---------------------
ALTER INDEX I_OPER_PDAT MODIFY PARTITION OPER_Y2015_Q1_300465_SP UNUSABLE;

ALTER TABLE OPER_300465_Y2015_Q2 ENABLE ROW MOVEMENT;

select ui.status, ui.* from user_indexes ui where ui.table_name = 'OPER'; 

ALTER INDEX PK_OPER REBUILD;
ALTER INDEX UK_OPER REBUILD;
ALTER INDEX IDX_OPER_REFL REBUILD;
ALTER INDEX I_OPER_PDAT REBUILD;
ALTER INDEX XIE_VDAT_OPER REBUILD;

ALTER INDEX PK_OPER REBUILD; -- COMPUTE STATISTICS; 
ALTER INDEX UK_OPER REBUILD; --COMPUTE STATISTICS; 

ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2015_Q1_300465_SP
REBUILD UNUSABLE LOCAL INDEXES;


ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2015_Q1_300465_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2015_Q2_300465_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2015_Q3_300465_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2015_Q4_300465_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2016_Q1_300465_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2016_Q2_300465_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2016_Q3_300465_SP REBUILD UNUSABLE LOCAL INDEXES;


ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2015_Q1_324805_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2015_Q2_324805_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2015_Q3_324805_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2015_Q4_324805_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2016_Q1_324805_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2016_Q1_324805_SP REBUILD UNUSABLE LOCAL INDEXES;
ALTER TABLE OPER MODIFY SUBPARTITION OPER_Y2016_Q1_324805_SP REBUILD UNUSABLE LOCAL INDEXES;

ALTER INDEX XIE_VDAT_OPER REBUILD PARTITION SYS_

ALTER INDEX I_OWLOCPAYMATCH_RRN REBUILD SUBPARTITION P_REVFLAG0_SP_STATE0;

