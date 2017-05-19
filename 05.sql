/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.0 		*/
/*  Created On : 19-5-2017 12:22:45 				*/
/*  DBMS       : Oracle 						*/
/* ---------------------------------------------------- */

/* Drop Triggers, Sequences for Autonumber Columns */

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE OWNER = '' 
  AND TRIGGER_NAME = 'TRG_Adresa_ADRESA_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER "TRG_Adresa_ADRESA_ID"'; 
END IF; 
END; 

;

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_OWNER = '' 
  AND SEQUENCE_NAME = 'SEQ_Adresa_ADRESA_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE "SEQ_Adresa_ADRESA_ID"'; 
END IF; 
END; 

;

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE OWNER = '' 
  AND TRIGGER_NAME = 'TRG_Doktori_DOKTORI_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER "TRG_Doktori_DOKTORI_ID"'; 
END IF; 
END; 

;

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_OWNER = '' 
  AND SEQUENCE_NAME = 'SEQ_Doktori_DOKTORI_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE "SEQ_Doktori_DOKTORI_ID"'; 
END IF; 
END; 

;

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE OWNER = '' 
  AND TRIGGER_NAME = 'TRG_Pacienti_PACIENTI_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER "TRG_Pacienti_PACIENTI_ID"'; 
END IF; 
END; 

;

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_OWNER = '' 
  AND SEQUENCE_NAME = 'SEQ_Pacienti_PACIENTI_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE "SEQ_Pacienti_PACIENTI_ID"'; 
END IF; 
END; 

;

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE OWNER = '' 
  AND TRIGGER_NAME = 'TRG_Specializace_SPECIALIZACE_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER "TRG_Specializace_SPECIALIZACE_ID"'; 
END IF; 
END; 

;

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_OWNER = '' 
  AND SEQUENCE_NAME = 'SEQ_Specializace_SPECIALIZACE_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE "SEQ_Specializace_SPECIALIZACE_ID"'; 
END IF; 
END; 

;

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE OWNER = '' 
  AND TRIGGER_NAME = 'TRG_Vysetreni_VYSETRENI_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER "TRG_Vysetreni_VYSETRENI_ID"'; 
END IF; 
END; 

;

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_OWNER = '' 
  AND SEQUENCE_NAME = 'SEQ_Vysetreni_VYSETRENI_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE "SEQ_Vysetreni_VYSETRENI_ID"'; 
END IF; 
END; 

;

/* Drop Tables */

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "Adresa" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "Doktori" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "Karta_Pacienta" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "Pacienti" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "Specializace" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "Vysetreni" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

/* Create Tables */

CREATE TABLE  "Adresa"
(
	"ADRESA_ID" NUMBER(8) NOT NULL,
	"ULICE" VARCHAR2(50) NULL,
	"PSC" VARCHAR2(50) NOT NULL,
	"CP" VARCHAR2(50) NULL,
	"MESTO" VARCHAR2(50) NOT NULL
)
;

CREATE TABLE  "Doktori"
(
	"DOKTORI_ID" NUMBER(8) NOT NULL,
	"JMENO" VARCHAR2(50) NOT NULL,
	"PRIJMENI" VARCHAR2(50) NOT NULL,
	"PLAT" NUMBER(9,2) NOT NULL,
	"SPECIALIZACE_ID" NUMBER(8) NOT NULL,
	"ADRESA_ID" NUMBER(8) NOT NULL
)
;

CREATE TABLE  "Karta_Pacienta"
(
	"KARTA_PACIENTA_ID" VARCHAR2(50) NOT NULL,
	"VYSETRENI_ID" NUMBER(8) NULL,
	"PACIENTI_ID" NUMBER(8) NOT NULL
)
;

CREATE TABLE  "Pacienti"
(
	"PACIENTI_ID" NUMBER(8) NOT NULL,
	"JMENO" VARCHAR2(50) NOT NULL,
	"PRIJMENI" VARCHAR2(50) NOT NULL,
	"DATUM_NAROZENI" DATE NOT NULL,
	"VAHA" NUMBER(3) NULL,
	"VYSKA" NUMBER(3) NULL,
	"ADRESA_ID" NUMBER(8) NOT NULL
)
;

CREATE TABLE  "Specializace"
(
	"SPECIALIZACE_ID" NUMBER(8) NOT NULL,
	"NAZEV" VARCHAR2(50) NOT NULL
)
;

CREATE TABLE  "Vysetreni"
(
	"VYSETRENI_ID" NUMBER(8) NOT NULL,
	"NAZEV" VARCHAR2(50) NOT NULL,
	"POPIS" VARCHAR2(500) NULL,
	"DATUM" DATE NOT NULL,
	"DOKTORI_ID" NUMBER(8) NOT NULL
)
;

/* Create Comments, Sequences and Triggers for Autonumber Columns */

CREATE SEQUENCE "SEQ_Adresa_ADRESA_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER "TRG_Adresa_ADRESA_ID" 
	BEFORE INSERT 
	ON "Adresa" 
	FOR EACH ROW 
	BEGIN 
		SELECT "SEQ_Adresa_ADRESA_ID".NEXTVAL 
		INTO :NEW."ADRESA_ID" 
		FROM DUAL; 
	END;
;
/


CREATE SEQUENCE "SEQ_Doktori_DOKTORI_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER "TRG_Doktori_DOKTORI_ID" 
	BEFORE INSERT 
	ON "Doktori" 
	FOR EACH ROW 
	BEGIN 
		SELECT "SEQ_Doktori_DOKTORI_ID".NEXTVAL 
		INTO :NEW."DOKTORI_ID" 
		FROM DUAL; 
	END;
;
/


CREATE SEQUENCE "SEQ_Pacienti_PACIENTI_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER "TRG_Pacienti_PACIENTI_ID" 
	BEFORE INSERT 
	ON "Pacienti" 
	FOR EACH ROW 
	BEGIN 
		SELECT "SEQ_Pacienti_PACIENTI_ID".NEXTVAL 
		INTO :NEW."PACIENTI_ID" 
		FROM DUAL; 
	END;
;
/


CREATE SEQUENCE "SEQ_Specializace_SPECIALIZACE_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER "TRG_Specializace_SPECIALIZACE_ID" 
	BEFORE INSERT 
	ON "Specializace" 
	FOR EACH ROW 
	BEGIN 
		SELECT "SEQ_Specializace_SPECIALIZACE_ID".NEXTVAL 
		INTO :NEW."SPECIALIZACE_ID" 
		FROM DUAL; 
	END;
;
/


CREATE SEQUENCE "SEQ_Vysetreni_VYSETRENI_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER "TRG_Vysetreni_VYSETRENI_ID" 
	BEFORE INSERT 
	ON "Vysetreni" 
	FOR EACH ROW 
	BEGIN 
		SELECT "SEQ_Vysetreni_VYSETRENI_ID".NEXTVAL 
		INTO :NEW."VYSETRENI_ID" 
		FROM DUAL; 
	END;
;
/


/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "Adresa" 
 ADD CONSTRAINT "PK_Adresa"
	PRIMARY KEY ("ADRESA_ID") 
 USING INDEX
;

ALTER TABLE  "Doktori" 
 ADD CONSTRAINT "PK_Doktori"
	PRIMARY KEY ("DOKTORI_ID") 
 USING INDEX
;

CREATE INDEX "IXFK_Doktori_Adresa"   
 ON  "Doktori" ("ADRESA_ID") 
;

CREATE INDEX "IXFK_Doktori_Specializace"   
 ON  "Doktori" ("SPECIALIZACE_ID") 
;

ALTER TABLE  "Karta_Pacienta" 
 ADD CONSTRAINT "PK_Karta_Pacien_01"
	PRIMARY KEY ("KARTA_PACIENTA_ID") 
 USING INDEX
;

CREATE INDEX "IXFK_Karta_Pacienta_Pacienti"   
 ON  "Karta_Pacienta" ("PACIENTI_ID") 
;

CREATE INDEX "IXFK_Karta_Pacienta_Vysetreni"   
 ON  "Karta_Pacienta" ("VYSETRENI_ID") 
;

ALTER TABLE  "Pacienti" 
 ADD CONSTRAINT "PK_Pacienti"
	PRIMARY KEY ("PACIENTI_ID") 
 USING INDEX
;

CREATE INDEX "IXFK_Pacienti_Adresa"   
 ON  "Pacienti" ("ADRESA_ID") 
;

ALTER TABLE  "Specializace" 
 ADD CONSTRAINT "PK_Specializace"
	PRIMARY KEY ("SPECIALIZACE_ID") 
 USING INDEX
;

ALTER TABLE  "Vysetreni" 
 ADD CONSTRAINT "PK_Vysetreni"
	PRIMARY KEY ("VYSETRENI_ID") 
 USING INDEX
;

CREATE INDEX "IXFK_Vysetreni_Doktori"   
 ON  "Vysetreni" ("DOKTORI_ID") 
;

/* Create Foreign Key Constraints */

ALTER TABLE  "Doktori" 
 ADD CONSTRAINT "FK_Doktori_Adresa"
	FOREIGN KEY ("ADRESA_ID") REFERENCES  "Adresa" ("ADRESA_ID")
;

ALTER TABLE  "Doktori" 
 ADD CONSTRAINT "FK_Doktori_Specializace"
	FOREIGN KEY ("SPECIALIZACE_ID") REFERENCES  "Specializace" ("SPECIALIZACE_ID")
;

ALTER TABLE  "Karta_Pacienta" 
 ADD CONSTRAINT "FK_Karta_Pacienta_Pacienti"
	FOREIGN KEY ("PACIENTI_ID") REFERENCES  "Pacienti" ("PACIENTI_ID")
;

ALTER TABLE  "Karta_Pacienta" 
 ADD CONSTRAINT "FK_Karta_Pacienta_Vysetreni"
	FOREIGN KEY ("VYSETRENI_ID") REFERENCES  "Vysetreni" ("VYSETRENI_ID")
;

ALTER TABLE  "Pacienti" 
 ADD CONSTRAINT "FK_Pacienti_Adresa"
	FOREIGN KEY ("ADRESA_ID") REFERENCES  "Adresa" ("ADRESA_ID")
;

ALTER TABLE  "Vysetreni" 
 ADD CONSTRAINT "FK_Vysetreni_Doktori"
	FOREIGN KEY ("DOKTORI_ID") REFERENCES  "Doktori" ("DOKTORI_ID")
;
