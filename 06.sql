--Triviální integritní omezení, vynucení NOT NULL omezení pøímo v generaci tabulek

--Tabulka Doktor:
--Plat doktora musí být nejménì 25 000 Kè, protože minimální plat doktora nesmí být podle zákona menší než 25 000 Kè.
ALTER TABLE Doktor ADD CONSTRAINT chck_salary CHECK (plat > 25000);

--Tabulka Adresa:
--PSC musí být dlouhé právì 5 míst bez mezery.
ALTER TABLE Adresa ADD CONSTRAINT chck_psc CHECK ((length(psc) = 5 and regexp_like (psc,'^[0-9]*$')));
ALTER TABLE Adresa ADD CONSTRAINT chck_cp CHECK (cp > 0);

--Tabulka Pacient:
--Váha a Výška musejí být vìtší než 0.
ALTER TABLE Pacient ADD CONSTRAINT chck_vaha CHECK (vaha > 0);
ALTER TABLE Pacient ADD CONSTRAINT chck_vyska CHECK (vyska > 0);

--B) Netriviální integritní omezení
--Pøi pøidání vyšetøení pacienta s názvem preventivní prohlídka bude zkontrolováno
--zda již nemìl v daném kalendáøním roce nìjakou preventivní prohlídku. Jestliže již 
--preventivní prohlídku mìl, bude mu pøidání takové prohlídky zamítnuto.
CREATE OR REPLACE PROCEDURE prcd_pridani_vysetreni (novy_nazev VYSETRENI.NAZEV%TYPE, id_karta_pacienta KARTA_PACIENTA.KARTA_PACIENTA_ID%TYPE)
IS
pocet number;
BEGIN
  IF novy_nazev = 'preventivni prohlidka' THEN
    select count(*) into pocet from vysetreni v join karta_pacienta k on v.KARTA_PACIENTA_ID = k.KARTA_PACIENTA_ID
    where k.KARTA_PACIENTA_ID = id_karta_pacienta and v.NAZEV = novy_nazev
    and extract(year from datum) = extract(year from sysdate);
  
    IF (pocet > 0) THEN
    RAISE_APPLICATION_ERROR(-20000,'PACIENT JIZ MEL TENTO ROK PREVENTIVNI PROHLIDKU!');
    END IF;
  END IF;
END;
/


CREATE OR REPLACE TRIGGER trg_pridani_pacienta
BEFORE INSERT OR UPDATE ON VYSETRENI FOR EACH ROW
BEGIN 
  prcd_pridani_vysetreni(:NEW.nazev, :NEW.KARTA_PACIENTA_ID); 
END;





/
--Datum narození musí být menší než aktuální datum a vetsi nez 1900
CREATE OR REPLACE TRIGGER trg_datum_pacienti
BEFORE INSERT OR UPDATE ON PACIENT FOR EACH ROW
DECLARE ERROR EXCEPTION;
BEGIN 
IF INSERTING THEN
IF :new.datum_narozeni >= sysdate OR :new.datum_narozeni < '01-01-1900'
THEN RAISE ERROR;
END IF;
END IF; 
EXCEPTION 
WHEN ERROR THEN RAISE_APPLICATION_ERROR(-20000,'SPATNE ZADANE DATUM. DATUM MUSI BYT MEZI 01-01-1900 A DNESNIM DATEM!');
END;

/

--Datum vysetreni musí být menší než aktuální datum 
CREATE OR REPLACE TRIGGER trg_datum_vysetreni
BEFORE INSERT OR UPGRADE ON VYSETRENI FOR EACH ROW
DECLARE ERROR EXCEPTION;
BEGIN 
IF INSERTING THEN
IF :new.datum >= sysdate
THEN RAISE ERROR;
END IF;
END IF; 
EXCEPTION 
WHEN ERROR THEN RAISE_APPLICATION_ERROR(-20000,'SPATNE ZADANE DATUM. DATUM MUSI BYT MENSI NEZ DNESNI DATUM!');
END;


