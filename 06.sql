--Triviální integritní omezení, vynucení NOT NULL omezení pøímo v generaci tabulek

--Tabulka Doktori
--Plat doktora musí být nejménì 25 000 Kè, protože minimální plat doktora nesmí být podle zákona menší než 25 000 Kè.
ALTER TABLE Doktori ADD CONSTRAINT chck_salary CHECK (plat > 25000);

--Tabulka Adresa:
--PSC musí být dlouhé právì 5 míst bez mezery.
ALTER TABLE Adresa ADD CONSTRAINT chck_psc CHECK ((length(psc) = 5 and regexp_like (psc,'^[0-9]*$'))) ;
ALTER TABLE Adresa ADD CONSTRAINT chck_cp CHECK (cp > 0) ;

--Tabulka Pacient:
--Váha a Výška musejí být vìtší než 0.
ALTER TABLE Pacienti ADD CONSTRAINT chck_vaha CHECK (vaha > 0);
ALTER TABLE Pacienti ADD CONSTRAINT chck_vyska CHECK (vyska > 0);




--B) Netriviální integritní omezení
--Pøi pøidání vyšetøení pacienta s názvem preventivní prohlídka bude zkontrolováno
--zda již nemìl v daném kalendáøním roce nìjakou preventivní prohlídku. Jestliže již 
--preventivní prohlídku mìl, bude mu pøidání takové prohlídky zamítnuto.
CREATE OR REPLACE PROCEDURE prcd_pridani_vysetreni (novy_nazev VYSETRENI.NAZEV%TYPE, id_pacienta PACIENTI.PACIENTI_ID%TYPE)
IS
BEGIN

select count(*) from vysetreni 

END;
/


CREATE OR REPLACE TRIGGER trg_pridani
BEFORE INSERT ON VYSETRENI FOR EACH ROW
DECLARE ERROR EXCEPTION;
BEGIN 
IF INSERTING THEN
IF :new.nazev == 'preventivni_prohlidka'
THEN SELECT nazev FROM VYSETRENI JOIN WHERE 
 RAISE ERROR;
END IF;
END IF; 
EXCEPTION 
WHEN ERROR THEN RAISE_APPLICATION_ERROR(-20000,'SPATNE ZADANE DATUM. DATUM MUSI BYT MEZI 01-01-1900 A DNESNIM DATEM');
END;






--Datum narození musí být menší než aktuální datum a vetsi nez 1900
CREATE OR REPLACE TRIGGER trg_datum_pacienti
BEFORE INSERT ON PACIENTI FOR EACH ROW
DECLARE ERROR EXCEPTION;
BEGIN 
IF INSERTING THEN
IF :new.datum_narozeni >= sysdate OR :new.datum_narozeni < '01-01-1900'
THEN RAISE ERROR;
END IF;
END IF; 
EXCEPTION 
WHEN ERROR THEN RAISE_APPLICATION_ERROR(-20000,'SPATNE ZADANE DATUM. DATUM MUSI BYT MEZI 01-01-1900 A DNESNIM DATEM');
END;



--Datum vysetreni musí být menší než aktuální datum 
CREATE OR REPLACE TRIGGER trg_datum_vysetreni
BEFORE INSERT ON VYSETRENI FOR EACH ROW
DECLARE ERROR EXCEPTION;
BEGIN 
IF INSERTING THEN
IF :new.datum >= sysdate
THEN RAISE ERROR;
END IF;
END IF; 
EXCEPTION 
WHEN ERROR THEN RAISE_APPLICATION_ERROR(-20000,'SPATNE ZADANE DATUM. DATUM MUSI BYT MENSI NEZ DNESNI DATUM');
END;


