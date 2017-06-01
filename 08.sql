/*
5. V�pis doktor� s danou specializac� a po�tem operac� dan�ho doktora za p�edchoz�ch 5 let
6. V�pis sou�tu operac� proveden�ch doktory se stejn�mi specializacemi za p�edchoz�ch 5 let 
 */  
-- 1. Vypsat pr�m�rn� plat doktor� podle specifikace
select round(avg(d.plat),2), s.NAZEV from doktor d
join specializace s 
on d.specializace_id = s.specializace_id
group by d.specializace_id, s.NAZEV;

--2. V�pis v�ech vy�et�en� dan�ho pacienta s podrobn�mi informacemi
select p.jmeno , p.prijmeni , p.datum_narozeni, v.nazev, v.popis, d.prijmeni as "VYSETRIL",  v.datum as "DATUM_VYSETRENI"
from pacient p join vysetreni v 
on p.pacient_id = v.pacient_id
join DOKTOR d 
on d.DOKTOR_ID = v.DOKTOR_ID
where p.pacient_id = 723;

--3. Vypsat doktory s danou specializac� v dan� m�st�
select d.jmeno, d.prijmeni, s.nazev as "SPECIALIZACE", a.mesto from doktor d join specializace s
on s.SPECIALIZACE_ID = d.SPECIALIZACE_ID
join adresa a
on a.ADRESA_ID = d.ADRESA_ID
where a.MESTO = 'Port Harcourt' and s.nazev = 'Fyzioterapie';

--4. V�pis po�tu ur�it�ho typu vy�et�en� pacient� v produktivn�m v�ku (18-65 let)
select count(*), v.NAZEV from vysetreni v join pacient p on p.PACIENT_ID = v.PACIENT_ID
where  (sysdate - p.DATUM_NAROZENI > 18*365.25) and
(sysdate -  p.DATUM_NAROZENI < 65*365.25) 
group by v.NAZEV;



















































