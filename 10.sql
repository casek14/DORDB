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
INSERT INTO adresa values(ulice, psc, cp, mesto);
END vytvor_adresu;

PROCEDURE vytvor_doktora (jmeno in VARCHAR, prijmeni in VARCHAR, plat in NUMBER, specializace in NUMBER) AS
BEGIN
INSERT INTO doktor values (jmeno,prijmeni, plat, specializace,SEQ_ADRESA_ADRESA_ID.CURRVAL);
END vytvor_doktora;
END doktor_api
