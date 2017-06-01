SPOOL 09_output.txt

--Tabulka Doktor:
--Plat doktora mus� b�t nejm�n� 25 000 K�, proto�e minim�ln� plat doktora nesm� b�t podle z�kona men�� ne� 25 000 K�.
INSERT INTO Doktor (jmeno,prijmeni,plat,specializace_id,adresa_id) VALUES ('Leon','Vojt�ch',12500,1,234);
--Tabulka Adresa:
--PSC mus� b�t dlouh� pr�v� 5 m�st bez mezery.
INSERT INTO Adresa (ulice,psc,cp,mesto) VALUES ('U �koly',1234,55,'Hradec');

--Tabulka Pacient:
--Datum narozen� mus� b�t v�t�� ne� 1.1.1900. (Nep�edpokl�d�me star�� osobu 118 let). Z�rove� mus� b�t men�� ne� aktu�ln� datum.
INSERT INTO Pacient (jmeno,prijmeni,datum_narozeni,vaha,vyska,adresa_id) VALUES ('Leon','Vojt�ch','06/01/1492',85,183,234);
INSERT INTO Pacient (jmeno,prijmeni,datum_narozeni,vaha,vyska,adresa_id) VALUES ('Leon','Vojt�ch','06/01/2492',85,183,234);

--V�ha a V��ka musej� b�t v�t�� ne� 0.
INSERT INTO Pacient (jmeno,prijmeni,datum_narozeni,vaha,vyska,adresa_id) VALUES ('Leon','Vojt�ch','06/01/1994',-25,183,234);
INSERT INTO Pacient (jmeno,prijmeni,datum_narozeni,vaha,vyska,adresa_id) VALUES ('Leon','Vojt�ch','06/01/1994',85,-44,234);

--Tabulka Vysetreni:
--Datum mus� b�t men�� ne� aktu�ln� datum.
INSERT INTO Vysetreni (nazev,popis,datum,doktor_id,pacient_id) VALUES ('Vysetreni','N�kaza nehroz�.','11/12/2875',318,140);
--------------------------------------------------------------------------
/*P�i p�id�n� vy�et�en� pacienta s n�zvem preventivn� prohl�dka bude zkontrolov�no
zda ji� nem�l v dan�m kalend��n�m roce n�jakou preventivn� prohl�dku. Jestli�e ji� 
preventivn� prohl�dku m�l, bude mu p�id�n� takov� prohl�dky zam�tnuto.*/
INSERT INTO Vysetreni (nazev,popis,datum,doktor_id,pacient_id) VALUES ('Preventivni prohlidka','Zcela zdr�v.','03/05/2017',318,66);

SPOOL OFF;