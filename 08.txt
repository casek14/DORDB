SET AUTOTRACE ON;
SPOOL 08_output.txt

-- 1. Vypsat prùmìrný plat doktorù podle specifikace
--A)
select s.NAZEV, round(avg(d.plat),2) as "PRUMERNY_PLAT" from doktor d
join specializace s 
on d.specializace_id = s.specializace_id
group by cube(s.NAZEV)
order by s.NAZEV;
--B)
select (select s.NAZEV from specializace s where d.specializace_id = s.specializace_id) as "NAZEV", 
round(avg(d.plat),2) as "PRUMERNY_PLAT" from doktor d
group by d.specializace_id
union 
select null, round(avg(d.plat),2)
from doktor d
order by NAZEV;


--2. Výpis všech vyšetøení daného pacienta s podrobnými informacemi
select p.jmeno , p.prijmeni , p.datum_narozeni, v.nazev, v.popis, d.prijmeni as "VYSETRIL",  v.datum as "DATUM_VYSETRENI"
from pacient p join vysetreni v 
on p.pacient_id = v.pacient_id
join DOKTOR d 
on d.DOKTOR_ID = v.DOKTOR_ID
where p.pacient_id = 723
order by v.datum desc;

--3. Vypsat doktory s danou specializací v dané mìstì
select d.jmeno, d.prijmeni, s.nazev as "SPECIALIZACE", a.mesto from doktor d join specializace s
on s.SPECIALIZACE_ID = d.SPECIALIZACE_ID
join adresa a
on a.ADRESA_ID = d.ADRESA_ID
where a.MESTO = 'Port Harcourt' and s.nazev = 'Fyzioterapie'
order by d.prijmeni;

--4. Výpis poètu urèitého typu vyšetøení pacientù v produktivním vìku (18-65 let)
--A)
select count(*) as "POCET_VYSETRENI", v.NAZEV from vysetreni v 
join pacient p on p.PACIENT_ID = v.PACIENT_ID
where  (sysdate - p.DATUM_NAROZENI > 18*365.25) and
(sysdate -  p.DATUM_NAROZENI < 65*365.25) and 
v.NAZEV = 'Akutni bolest'
group by v.NAZEV;

--B)
select count(*) as "POCET_VYSETRENI", v.NAZEV from vysetreni v 
join pacient p on p.PACIENT_ID = v.PACIENT_ID
where p.DATUM_NAROZENI between sysdate - 65*365.25 and sysdate - 18*365.25
and v.NAZEV = 'Akutni bolest'
group by v.NAZEV;

--5. Výpis doktorù s danou specializací a poètem rùzných akcí daného doktora za pøedchozích 5 let
select d.JMENO, d.PRIJMENI, count(v.vysetreni_id) as "POCET_VYSETRENI", s.NAZEV 
from doktor d join specializace s on s.SPECIALIZACE_ID = d.SPECIALIZACE_ID
join vysetreni v on v.DOKTOR_ID = d.DOKTOR_ID
where (sysdate - v.DATUM < 5*365.25) and s.NAZEV = 'Plasticka chirurgie'
group by d.PRIJMENI, d.JMENO, s.NAZEV
order by d.PRIJMENI, d.JMENO;

--6. Výpis souètu rùzných akcí provedených doktory se stejnými specializacemi za pøedchozích 5 let 
--A)
select s.NAZEV, count(v.vysetreni_id) as "POCET_VYSETRENI" 
from vysetreni v 
join doktor d on d.DOKTOR_ID = v.DOKTOR_ID 
join specializace s on s.SPECIALIZACE_ID = d.SPECIALIZACE_ID
where (sysdate - v.DATUM < 5*365.25)
group by cube(s.NAZEV)
order by s.NAZEV;

--B)
select s.NAZEV, count(v.vysetreni_id) as "POCET_VYSETRENI" 
from vysetreni v 
join doktor d on d.DOKTOR_ID = v.DOKTOR_ID 
join specializace s on s.SPECIALIZACE_ID = d.SPECIALIZACE_ID
where (sysdate - v.DATUM < 5*365.25)
group by s.NAZEV
union
select null, count(v.vysetreni_id) from vysetreni v 
where (sysdate - v.DATUM < 5*365.25);

SPOOL OFF;
SET AUTOTRACE OFF;












































