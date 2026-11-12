--Tabeli koostamine
CREATE TABLE team_members (                                   --Tabeli koostamine nimega team_members
     id           SERIAL PRIMARY KEY,                         --id - number, Primary key - seos teise tabeliga
     name         TEXT NOT NULL,                              --name - tekst
     role_week1   TEXT NOT NULL,                              --esimese nädala roll - tekst
     os           TEXT NOT NULL,                              --operatsiooni süsteem
     joined_date  DATE DEFAULT CURRENT_DATE                   --liitumise kuupäev - DEFAULT CURRENT DATE annab tänase kuupäeva kui pole märgitud teisiti
   );
--Tabeli täiendamine
INSERT INTO team_members (name, role_week1, os)               --andmete lisamine, sulgudes veergude nimed
   VALUES                                                     --tabeli sisu, järjestus vastavalt veergude nimedele
     ('Aleksander Erik Ild', 'A', 'Mac'),
     ('Andrei Andrejev', 'B', 'Win'),
     ('Kärt Kunnus', 'C', 'Mac'),
     ('Rena Selliov', 'D', 'Win');
--Tabeli näitamine
select
name as "Nimi", role_week1 as "Nädal 1 roll", os as "Operatsioonisüsteem"
from team_members
