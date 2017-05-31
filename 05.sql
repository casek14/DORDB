/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.0 		*/
/*  Created On : 31-kv�-2017 17:21:04 				*/
/*  DBMS       : Oracle 						*/
/* ---------------------------------------------------- */

/* Drop Triggers, Sequences for Autonumber Columns */

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE TRIGGER_NAME = 'TRG_ADRESA_ADRESA_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_ADRESA_ADRESA_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_NAME = 'SEQ_ADRESA_ADRESA_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_ADRESA_ADRESA_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE TRIGGER_NAME = 'TRG_DOKTOR_DOKTOR_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_DOKTOR_DOKTOR_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_NAME = 'SEQ_DOKTOR_DOKTOR_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_DOKTOR_DOKTOR_ID'; 
END IF; 
END; 
/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE TRIGGER_NAME = 'TRG_KARTA_PACIENTA_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_KARTA_PACIENTA_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_NAME = 'SEQ_KARTA_PACIENTA_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_KARTA_PACIENTA_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE TRIGGER_NAME = 'TRG_PACIENT_PACIENT_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_PACIENT_PACIENT_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_NAME = 'SEQ_PACIENT_PACIENT_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_PACIENT_PACIENT_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE TRIGGER_NAME = 'TRG_SPECIAL_SPECIALIZACE_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_SPECIAL_SPECIALIZACE_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_NAME = 'SEQ_SPECIAL_SPECIALIZACE_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_SPECIAL_SPECIALIZACE_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_TRIGGERS 
  WHERE TRIGGER_NAME = 'TRG_VYSETRENI_VYSETRENI_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_VYSETRENI_VYSETRENI_ID'; 
END IF; 
END; 

/

DECLARE 
  C NUMBER; 
BEGIN 
SELECT COUNT(*) INTO C 
FROM ALL_SEQUENCES 
  WHERE SEQUENCE_NAME = 'SEQ_VYSETRENI_VYSETRENI_ID'; 
  IF (C > 0) THEN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_VYSETRENI_VYSETRENI_ID'; 
END IF; 
END; 

/

/* Drop Tables */

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Adresa CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Doktor CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Karta_Pacienta CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Pacient CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Specializace CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Vysetreni CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

/* Create Tables */

CREATE TABLE  Adresa
(
	ADRESA_ID NUMBER(8) NOT NULL,
	ULICE VARCHAR2(50) NULL,
	PSC NUMBER(5) NOT NULL,
	CP NUMBER(7) NULL,
	MESTO VARCHAR2(50) NOT NULL
)
;

CREATE TABLE  Doktor
(
	DOKTOR_ID NUMBER(8) NOT NULL,
	JMENO VARCHAR2(50) NOT NULL,
	PRIJMENI VARCHAR2(50) NOT NULL,
	PLAT NUMBER(9,2) NOT NULL,
	SPECIALIZACE_ID NUMBER(8) NOT NULL,
	ADRESA_ID NUMBER(8) NOT NULL
)
;

CREATE TABLE  Karta_Pacienta
(
	KARTA_PACIENTA_ID NUMBER(8) NOT NULL,
	PACIENT_ID NUMBER(8) NOT NULL
)
;

CREATE TABLE  Pacient
(
	PACIENT_ID NUMBER(8) NOT NULL,
	JMENO VARCHAR2(50) NOT NULL,
	PRIJMENI VARCHAR2(50) NOT NULL,
	DATUM_NAROZENI DATE NOT NULL,
	VAHA NUMBER(3) NULL,
	VYSKA NUMBER(3) NULL,
	ADRESA_ID NUMBER(8) NOT NULL
)
;

CREATE TABLE  Specializace
(
	SPECIALIZACE_ID NUMBER(8) NOT NULL,
	NAZEV VARCHAR2(50) NOT NULL
)
;

CREATE TABLE  Vysetreni
(
	VYSETRENI_ID NUMBER(8) NOT NULL,
	NAZEV VARCHAR2(50) NOT NULL,
	POPIS VARCHAR2(500) NULL,
	DATUM DATE NOT NULL,
	DOKTOR_ID NUMBER(8) NOT NULL,
	KARTA_PACIENTA_ID NUMBER(8) NOT NULL
)
;

/* Create Comments, Sequences and Triggers for Autonumber Columns */

-- nutne pro triggery, jinak hazou chybu
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';

CREATE SEQUENCE SEQ_ADRESA_ADRESA_ID 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_ADRESA_ADRESA_ID 
	BEFORE INSERT 
	ON Adresa 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_ADRESA_ADRESA_ID.NEXTVAL 
		INTO :NEW.ADRESA_ID 
		FROM DUAL; 
	END;

/


CREATE SEQUENCE SEQ_DOKTOR_DOKTOR_ID 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_DOKTOR_DOKTOR_ID 
	BEFORE INSERT 
	ON Doktor 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_DOKTOR_DOKTOR_ID.NEXTVAL 
		INTO :NEW.DOKTOR_ID 
		FROM DUAL; 
	END;

/


CREATE SEQUENCE SEQ_KARTA_PACIENTA_ID 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_KARTA_PACIENTA_ID 
	BEFORE INSERT 
	ON Karta_Pacienta 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_KARTA_PACIENTA_ID.NEXTVAL 
		INTO :NEW.KARTA_PACIENTA_ID 
		FROM DUAL; 
	END;

/


CREATE SEQUENCE SEQ_PACIENT_PACIENT_ID 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_PACIENT_PACIENT_ID 
	BEFORE INSERT 
	ON Pacient 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_PACIENT_PACIENT_ID.NEXTVAL 
		INTO :NEW.PACIENT_ID 
		FROM DUAL; 
	END;

/


CREATE SEQUENCE SEQ_SPECIAL_SPECIALIZACE_ID 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_SPECIAL_SPECIALIZACE_ID 
	BEFORE INSERT 
	ON Specializace 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_SPECIAL_SPECIALIZACE_ID.NEXTVAL 
		INTO :NEW.SPECIALIZACE_ID 
		FROM DUAL; 
	END;

/


CREATE SEQUENCE SEQ_VYSETRENI_VYSETRENI_ID 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_VYSETRENI_VYSETRENI_ID 
	BEFORE INSERT 
	ON Vysetreni 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_VYSETRENI_VYSETRENI_ID.NEXTVAL 
		INTO :NEW.VYSETRENI_ID 
		FROM DUAL; 
	END;

/


/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  Adresa 
 ADD CONSTRAINT PK_ADRESA
	PRIMARY KEY (ADRESA_ID) 
 USING INDEX
;

ALTER TABLE  Doktor 
 ADD CONSTRAINT PK_DOKTOR
	PRIMARY KEY (DOKTOR_ID) 
 USING INDEX
;

CREATE INDEX IXFK_DOKTOR_ADRESA   
 ON  Doktor (ADRESA_ID) 
;

CREATE INDEX IXFK_DOKTOR_SPECIALIZACE   
 ON  Doktor (SPECIALIZACE_ID) 
;

ALTER TABLE  Karta_Pacienta 
 ADD CONSTRAINT PK_KARTA_PACIENTA
	PRIMARY KEY (KARTA_PACIENTA_ID) 
 USING INDEX
;

CREATE INDEX IXFK_KARTA_PACIENTA_PACIENT   
 ON  Karta_Pacienta (PACIENT_ID) 
;

ALTER TABLE  Pacient 
 ADD CONSTRAINT PK_PACIENT
	PRIMARY KEY (PACIENT_ID) 
 USING INDEX
;

CREATE INDEX IXFK_PACIENT_ADRESA   
 ON  Pacient (ADRESA_ID) 
;

ALTER TABLE  Specializace 
 ADD CONSTRAINT PK_SPECIALIZACE
	PRIMARY KEY (SPECIALIZACE_ID) 
 USING INDEX
;

ALTER TABLE  Vysetreni 
 ADD CONSTRAINT PK_VYSETRENI
	PRIMARY KEY (VYSETRENI_ID) 
 USING INDEX
;

CREATE INDEX IXFK_VYSETRENI_DOKTOR   
 ON  Vysetreni (DOKTOR_ID) 
;

CREATE INDEX IXFK_VYSETRENI_KARTA_PACIENTA   
 ON  Vysetreni (KARTA_PACIENTA_ID) 
;

/* Create Foreign Key Constraints */

ALTER TABLE  Doktor 
 ADD CONSTRAINT FK_DOKTOR_ADRESA
	FOREIGN KEY (ADRESA_ID) REFERENCES  Adresa (ADRESA_ID)
;

ALTER TABLE  Doktor 
 ADD CONSTRAINT FK_DOKTOR_SPECIALIZACE
	FOREIGN KEY (SPECIALIZACE_ID) REFERENCES  Specializace (SPECIALIZACE_ID)
;

ALTER TABLE  Karta_Pacienta 
 ADD CONSTRAINT FK_KARTA_PACIENTA_PACIENT
	FOREIGN KEY (PACIENT_ID) REFERENCES  Pacient (PACIENT_ID)
;

ALTER TABLE  Pacient 
 ADD CONSTRAINT FK_PACIENT_ADRESA
	FOREIGN KEY (ADRESA_ID) REFERENCES  Adresa (ADRESA_ID)
;

ALTER TABLE  Vysetreni 
 ADD CONSTRAINT FK_VYSETRENI_DOKTOR
	FOREIGN KEY (DOKTOR_ID) REFERENCES  Doktor (DOKTOR_ID)
;

ALTER TABLE  Vysetreni 
 ADD CONSTRAINT FK_VYSETRENI_KARTA_PACIENTA
	FOREIGN KEY (KARTA_PACIENTA_ID) REFERENCES  Karta_Pacienta (KARTA_PACIENTA_ID)
;
