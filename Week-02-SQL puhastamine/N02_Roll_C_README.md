# Grupp 5: Product Analytics
# Nädal 2: SQL Puhastamine

## Projekti eesmärk
UrbanStyle.ltd on kasvanud kiiresti – 150% kasv viimase kahe aasta jooksul. Ettevõtte andmebaas sisaldab müügi-, kliendi-, toote- ja kauplusteandmeid, aga keegi pole neid süstemaatiliselt uurinud. Toomas vajab abi, et moodustada tervikpilt kogu andmestikust.

IT-direktor Toomas Kask:
> "Ma ei usalda neid andmeid. Kas keegi saab mulle öelda, mis tabelites üldse on? Mitu rida? Mis veerud? Mis on puudu? Ma tahan IGA tabeli kohta eraldi raportit -- enne kui me midagi muud teeme, peame teadma, millised andmed meil on ja mis seisus need on."

Töö eesmärk on kontrollida ja puhastada `products` tabeli andmed, eemaldada vigased kirjed ning anda IT-direktorile täpne ülevaade tooteandmebaasi tegelikust seisust.

## Kasutatud tööriistad ja meetodid
- **Andmebaas / Keel:** PostgreSQL (Supabase), SQL (`products_test` testtabel, duplikaatide eemaldamine, NULL-väärtuste kontroll)
- **Tööriistad:** VS Code / SQLTools, GitHub

## Kontrollitud probleemid
Duplikaatide ja puuduvate väärtuste otsimine ning andmete loogilisuse ja järjepidevuse kontroll `products` tabelis.

## Tulemused arvudes
- 12 korduvat tootenime veerust `product_name`, millest 11 on identsed kirjed ja ühel erines ökosertifikaadi väärtus (`FALSE` vs `NULL`).
- Veerus `eco_certified` on 17 `NULL` ökosertifikaati ning veel üks `NULL` väärtusega kanne langeb kokku duplikaatse nimega.
- Toodete koguarv korrigeeriti pärast duplikaatide eemaldamist 350-lt 338 unikaalse tooteni. Ülejäänud andmed on loogilised ja järjekindlad.

## Peamine leid või risk
12 duplikaati võivad moonutada tulemusi, tekitada valearvestusi tooteühikute analüüsil ja vähendada aruandluse usaldusväärsust.

## Soovitus Toomasele
Eemaldada duplikaatsed nimekirjed, arvestades `eco_certified` väärtusi (jätta alles täielikum kirje), ning võimalusel täiendada puuduvad ökosertifikaatide data.
```
