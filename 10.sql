/* Bussines logika*/

/* Pridani doktora */ 


CREATE OR REPLACE PACKAGE doktor_api AS
PROCEDURE vytvor_adresu (ulice in VARCHAR,psc in NUMBER, cp in NUMBER, mesto in VARCHAR);
PROCEDURE vytvor_doktora (jmeno in VARCHAR, prijmeni in VARCHAR, plat in NUMBER, specializace in NUMBER);
END doktor_api;
/
CREATE OR REPLACE PACKAGE BODY doktor_api AS
PROCEDURE vytvor_adresu (ulice in VARCHAR,psc in NUMBER, cp in NUMBER, mesto in VARCHAR) AS
BEGIN 
INSERT INTO adresa (ulice,psc,cp,mesto) values(ulice, psc, cp, mesto);
END vytvor_adresu;

PROCEDURE vytvor_doktora (jmeno in VARCHAR, prijmeni in VARCHAR, plat in NUMBER) AS
BEGIN
INSERT INTO doktor (jmeno, prijmeni, plat,specializace_id, adresa_id) values (jmeno,prijmeni, plat, specializace,SEQ_ADRESA_ADRESA_ID.CURRVAL);
END vytvor_doktora;
END doktor_api



/* pridani pacienta */
CREATE OR REPLACE PACKAGE pacient_api AS
PROCEDURE vytvor_adresu (ulice in VARCHAR,psc in NUMBER, cp in NUMBER, mesto in VARCHAR);
PROCEDURE vytvor_pacienta (jmeno in VARCHAR,prijmeni in VARCHAR, datum_narozeni in DATE, vaha in NUMBER, vyska in NUMBER,
adresa_id in NUMBER);
END pacient_api;
/
CREATE OR REPLACE PACKAGE BODY pacient_api AS
PROCEDURE vytvor_adresu (ulice in VARCHAR,psc in NUMBER, cp in NUMBER, mesto in VARCHAR) AS
BEGIN 
INSERT INTO adresa (ulice,psc,cp,mesto) values(ulice, psc, cp, mesto);
END vytvor_adresu;
PROCEDURE vytvor_pacienta (jmeno in VARCHAR, prijmeni in VARCHAR, datum_narozeni in DATE, vaha in NUMBER, vyska in NUMBER) AS
BEGIN
INSERT INTO pacient (jmeno, prijmeni, datum_narozeni, vaha, vyska, adresa_id) values (jmeno,prijmeni, datum_narozeni,vaha,vyska,SEQ_PACIENT_PACIENT_ID.CURRVAL);
END vytvor_pacienta;
END pacient_api;


/* pridani vysetreni */

CREATE OR REPLACE PACKAGE vysetreni_api AS
PROCEDURE vytvor_vysetreni (nazev in VARCHAR, popis in VARCHAR, datum in DATE, doktor_id in NUMBER, pacient_id in NUMBER);
END vysetreni_api;
CREATE OR REPLACE PACKAGE BODY vysetreni_api AS
PROCEDURE vytvor_vysetreni (nazev in VARCHAR, popis in VARCHAR, datum in DATE, doktor_id in NUMBER, pacient_id in NUMBER) AS
BEGIN
INSERT INTO vysetreni (nazev, popis, datum, doktor_id, pacient_id) values (nazev, popis, datum, doktor_id, pacient_id);
END vytvor_vysetreni;
END vysetreni_api;




