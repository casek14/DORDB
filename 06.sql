--Trivi�ln� integritn� omezen�, vynucen� NOT NULL omezen� p��mo v generaci tabulek

--Tabulka Doktor:
--Plat doktora mus� b�t nejm�n� 25 000 K�, proto�e minim�ln� plat doktora nesm� b�t podle z�kona men�� ne� 25 000 K�.
ALTER TABLE Doktor ADD CONSTRAINT chck_salary CHECK (plat > 25000);

--Tabulka Adresa:
--PSC mus� b�t dlouh� pr�v� 5 m�st bez mezery.
ALTER TABLE Adresa ADD CONSTRAINT chck_psc CHECK ((length(psc) = 5 and regexp_like (psc,'^[0-9]*$')));
ALTER TABLE Adresa ADD CONSTRAINT chck_cp CHECK (cp > 0);

--Tabulka Pacient:
--V�ha a V��ka musej� b�t v�t�� ne� 0.
ALTER TABLE Pacient ADD CONSTRAINT chck_vaha CHECK (vaha > 0);
ALTER TABLE Pacient ADD CONSTRAINT chck_vyska CHECK (vyska > 0);

--B) Netrivi�ln� integritn� omezen�
--P�i p�id�n� vy�et�en� pacienta s n�zvem preventivn� prohl�dka bude zkontrolov�no
--zda ji� nem�l v dan�m kalend��n�m roce n�jakou preventivn� prohl�dku. Jestli�e ji� 
--preventivn� prohl�dku m�l, bude mu p�id�n� takov� prohl�dky zam�tnuto.
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
--Datum narozen� mus� b�t men�� ne� aktu�ln� datum a vetsi nez 1900
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

--Datum vysetreni mus� b�t men�� ne� aktu�ln� datum 
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


