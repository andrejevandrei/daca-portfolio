# Grupp 5: Product Analytics
# Nädal 2: SQL Puhastamine

## Projekti eesmärk
IT-direktor Toomas Kask leidis müügitabelist (tabel `sales`) kokku 5 116 duplikaatrida. Kahe nädala pärast toimuva juhatuse koosoleku tõttu vajab tegevjuht Kristi Tamm täpseid ja puhtaid numbreid igast tabelist. Selle projekti eesmärk on analüüsida ja puhastada toodete tabelit (tabel `products`)

## Kasutatud tööriistad ja meetodid
- **Andmebaas / Keel:** PostgreSQL (Supabase)
- **Tööriistad:** GitHub

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

##  Projekti struktuur ja käivitamine
- `N02_Roll_B_Grupitöö.sql` – SQL päringud andmete analüüsiks
- `N01_Roll_B_Results.md` – Päringu tulemuste väljavõte
- `N01_Roll_B_Grupitöö.sql` – SQL päringud andmete analüüsiks
- `N01_Roll_B_Results.md` – Päringu tulemuste väljavõte

##  AI kasutamise reflektsioon
Kasutasin AI-d (ChatGPT) concat ja round funktsioonide õppimiseks, et anda korrektset ülevadet linnade kohta

