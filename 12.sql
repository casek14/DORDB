-- Do tabulky specializace se doplní prùmìrný plat dané specializace, který se aktualizuje pøi každé zmìnì platu doktora.

ALTER TABLE specializace ADD (prumerny_plat NUMBER);


CREATE OR REPLACE PROCEDURE prcd_specializace_prum_plat
IS
BEGIN  
  FOR doktori IN (SELECT d.specializace_id AS specializace_id, AVG(d.plat) AS prum_plat FROM doktor d GROUP BY d.specializace_id) LOOP
    UPDATE specializace s SET s.prumerny_plat = round(doktori.prum_plat,2) WHERE s.specializace_id = doktori.specializace_id;
  END LOOP; 
END;
/

CREATE OR REPLACE TRIGGER trg_specializace_prum_plat
AFTER INSERT OR DELETE OR UPDATE
ON doktor
BEGIN
  prcd_specializace_prum_plat;
END;
/

-- vypocitaji se prumerne platy, 1. doktor je Chirurg (je videt zmena oproti vypisu (08_output.txt, hned prvni vystup)
UPDATE doktor SET plat = 300000 WHERE doktor_id = 1;