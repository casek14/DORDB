/* Bod 8 - dotazy*/

/* select 1*/
select avg(d.salary) , s.nazev from Doktori d
join Specializace s 
on d.specializace_id = s.specializace_id
group by d.specializace_id;

/* select 2 */
select p.jmeno , p.prijmeni , p.datum_narozeni, v.nazev, v.popis, v.datum
from Pacienti p join Karta_Pacienta k 
on p.pacienti_id = k.pacienti_id
join vysetreni v 
on (select vysetreni_id from k where pacienti_id = k.pacienti_id)
= v.vysetreni_id;
where to_char(v.datum, 'YYYY')=to_char(sysdate, 'YYYY');