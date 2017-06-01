/* Vytvoreni uzivatelsky definovanych typu */

CREATE OR REPLACE TYPE t_adresa AS OBJECT (
adresa_id NUMBER(38),
ulice VARCHAR(50),
psc NUMBER(5),
cp NUMBER(7),
mesto VARCHAR(50)
);
/

CREATE OR REPLACE TYPE t_specializace AS OBJECT (
specializace_id NUMBER(38),
nazev VARCHAR(50)
);
/

CREATE OR REPLACE TYPE t_doktor AS OBJECT (
doktor_id NUMBER(38),
jmeno VARCHAR(50),
prijmeni VARCHAR(50),
plat NUMBER(38),
adresa_ref REF t_adresa,
specializace_ref REF t_specializace
);
/

CREATE OR REPLACE TYPE t_pacient AS OBJECT (
pacient_id NUMBER(38),
jmeno VARCHAR(50),
prijmeni VARCHAR(50),
datum_narozeni DATE,
vaha NUMBER(3),
vyska NUMBER(3),
adresa_ref REF t_adresa
);
/

CREATE or REPLACE TYPE t_vysetreni as OBJECT (
vysetreni_id NUMBER(38),
nazev VARCHAR(50),
popis VARCHAR(500),
datum DATE,
doktor_ref REF t_doktor,
pacient_ref REF t_pacient
);
/

/* vytvoreni tabulek*/
CREATE TABLE OBJ_Adresa of t_adresa;
CREATE TABLE OBJ_Specializace if t_specializace;
CREATE TABLE OBJ_Doktor of t_doktor;
CREATE TABLE OBJ_Pacient of t_pacient;
CREATE TABLE OBJ_Vysetreni of t_vysetreni;



/* Naplneni daty */
INSERT INTO OBJ_Adresa SELECT * FROM adresa;

INSERT INTO OBJ_Specializace SELECT * FROM specializace;

INSERT INTO OBJ_Doktor SELECT d.doktor_id,d.doktor_id,d.jmeno,d.prijmeni,d.plat, 
(SELECT REF (o) FROM OBJ_Adresa o WHERE o.adresa_id = d.adresa_id) ,
(SELECT REF (s) FROM OBJ_Specializace s WHERE s.specializace_id = d.specializace_id)
FROM Doktor d ;


INSERT INTO OBJ_Pacient SELECT p.pacient_id,p.jmeno,p.prijmeni,p.datum_narozeni,p.vaha,p.vyska,
(SELECT REF (o) FROM OBJ_Adresa o WHERE o.adresa_id = p.adresa_id)
FROM Pacient p;

INSERT INTO OBJ_Vysetreni SELECT v.vysetreni_id,v.nazev,v.popis,v.datum,
(SELECT REF (d) FROM OBJ_Doktor d WHERE d.adresa_id = v.adresa_id) ,
(SELECT REF (p) FROM OBJ_Pacient p WHERE p.adresa_id = d.adresa_id) ,
FROM Vysetreni;

