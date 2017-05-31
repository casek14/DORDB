/*
4. Výpis prùmìrného poètu urèitého typu vyšetøení pacientù v produktivním vìku (18-65 let)
5. Výpis doktorù s danou specializací a poètem operací daného doktora za pøedchozích 5 let
6. Výpis souètu operací provedených doktory se stejnými specializacemi za pøedchozích 5 let 
 */  
-- 1. Vypsat prùmìrný plat doktorù podle specifikace
select round(avg(d.plat),2), s.NAZEV from doktor d
join specializace s 
on d.specializace_id = s.specializace_id
group by d.specializace_id, s.NAZEV;

--2. Výpis všech vyšetøení daného pacienta s podrobnými informacemi
select p.jmeno , p.prijmeni , p.datum_narozeni, v.nazev, v.popis, d.prijmeni as "VYSETRIL",  v.datum as "DATUM_VYSETRENI"
from pacient p join vysetreni v 
on p.pacient_id = v.pacient_id
join DOKTOR d 
on d.DOKTOR_ID = v.DOKTOR_ID
where p.pacient_id = 723;

--3. Vypsat doktory s danou specializací v dané mìstì
select d.jmeno, d.prijmeni, s.nazev as "SPECIALIZACE", a.mesto from doktor d join specializace s
on s.SPECIALIZACE_ID = d.SPECIALIZACE_ID
join adresa a
on a.ADRESA_ID = d.ADRESA_ID
where a.MESTO = 'Port Harcourt' and s.nazev = 'Fyzioterapie';







