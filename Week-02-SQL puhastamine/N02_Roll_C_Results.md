# Results

## Test tabeli loomine
Test tabel aitab kontrollida kas muudatused aitavad jõuda sihini ilma et riskida peaandmebaasi rikkumist.

*Kontrollimiseks võrdleme ridade arvu, et vältida lisaduplikaatide tekkimist*.
| Originaal | Test |
| :-------: | :--: |
| 362       | 362  |

## Duplikaatide analüüs
*Tabelis leidub üks veerg duplikaatidega - 12 tootenimi veerust* `product_name`.
| Ridu | ID  | Unikaalsed ID | ID duplikaadid | Tooted | Unikaalsed tooted | Nimi duplikaadid |
| :--: | :-: | :-----------: | :------------: | :----: | :---------------: | :--------------: |
| 362  | 362 | 362           | 0              | 362    | 350               | 12               |

*Leiame toodete nimed ja duplikaatide arv*.
| Toode                             | Duplikaate |
| :-------------------------------: | :--------: |
| Moodne keraamiline sall           | 2          |
| Luksuslik teksane polo särk       | 2          |
| Stiilne puust müts                | 2          |
| Moodne villane nahk sandaalid     | 2          |
| Luksuslik keraamiline elastne vöö | 2          |
| Minimalistlik kashmiir bleiser    | 2          |
| Klassikaline kashmiir pusa        | 2          |
| Stiilne orgaaniline pidžaama      | 2          |
| Praktiline trikoo sukkpüksid      | 2          |
| Kerge siidine nahkkindad          | 2          |
| Elegantne keraamiline rahakott    | 2          |
| Vintage nahkne tossud             | 2          |

*Vaatame need read detailsemalt - näeme, et on 11 identset kannete paari ja ühel erineb ökosertifikaadi väärtus* (`FALSE` vs `NULL`).
| product_id | product_name                      | category    | subcategory | supplier               | cost_price | retail_price | eco_certified | created_at |
| :--------: | :-------------------------------: | :---------: | :---------: | :--------------------: | :--------: | :----------: | :-----------: | :--------: |
| 1356       | Elegantne keraamiline rahakott    | Accessories | kotid       | Haapsalu Villased OÜ   | 94.85      | 155.84       | true          | 2022-12-07 |
| 1047       | Elegantne keraamiline rahakott    | Accessories | kotid       | Haapsalu Villased OÜ   | 94.85      | 155.84       | true          | 2022-12-07 |
| 1355       | Kerge siidine nahkkindad          | Accessories | kindad      | Soome Tehdas OY        | 138.06     | 219.83       | false         | 2021-09-20 |
| 1291       | Kerge siidine nahkkindad          | Accessories | kindad      | Soome Tehdas OY        | 138.06     | 219.83       | false         | 2021-09-20 |
| 1345       | Klassikaline kashmiir pusa        | Womenswear  | pusad       | Balti Mood OÜ          | 160.82     | 225.81       | false         | 2022-06-03 |
| 1361       | Klassikaline kashmiir pusa        | Womenswear  | pusad       | Balti Mood OÜ          | 160.82     | 225.81       | false         | 2022-06-03 |
| 1358       | Luksuslik keraamiline elastne vöö | Accessories | vööd        | Pärnu Kudumid OÜ       | 99.50      | 149.55       | false         | 2022-07-17 |
| 1062       | Luksuslik keraamiline elastne vöö | Accessories | vööd        | Pärnu Kudumid OÜ       | 99.50      | 149.55       | false         | 2022-07-17 |
| 1042       | Luksuslik teksane polo särk       | Menswear    | särgid      | Haapsalu Villased OÜ   | 223.47     | 347.84       | false         | 2020-04-01 |
| 1362       | Luksuslik teksane polo särk       | Menswear    | särgid      | Haapsalu Villased OÜ   | 223.47     | 347.84       | false         | 2020-04-01 |
| 1212       | Minimalistlik kashmiir bleiser    | Womenswear  | jakid       | Tallinna Rõivatehas OÜ | 276.20     | 185.46       | false         | 2021-10-28 |
| 1353       | Minimalistlik kashmiir bleiser    | Womenswear  | jakid       | Tallinna Rõivatehas OÜ | 276.20     | 185.46       | false         | 2021-10-28 |
| 1359       | Moodne keraamiline sall           | Accessories | sallid      | Saare Käsitöö OÜ       | 91.71      | 147.16       | false         | 2024-07-09 |
| 1201       | Moodne keraamiline sall           | Accessories | sallid      | Saare Käsitöö OÜ       | 91.71      | 147.16       | false         | 2024-07-09 |
| 1352       | Moodne villane nahk sandaalid     | Footwear    | sandaalid   | Haapsalu Villased OÜ   | 226.48     | 368.67       | true          | 2024-05-10 |
| 1160       | Moodne villane nahk sandaalid     | Footwear    | sandaalid   | Haapsalu Villased OÜ   | 226.48     | 368.67       | true          | 2024-05-10 |
| 1159       | Praktiline trikoo sukkpüksid      | Kidswear    | trikotaaž   | Leedu Linane UAB       | 16.53      | 24.54        | false         | 2021-03-17 |
| 1354       | Praktiline trikoo sukkpüksid      | Kidswear    | trikotaaž   | Leedu Linane UAB       | 16.53      | 24.54        | false         | 2021-03-17 |
| 1326       | Stiilne orgaaniline pidžaama      | Kidswear    | komplektid  | Eesti Nahk AS          | 71.74      | 106.82       | true          | 2022-09-05 |
| 1360       | Stiilne orgaaniline pidžaama      | Kidswear    | komplektid  | Eesti Nahk AS          | 71.74      | 106.82       | true          | 2022-09-05 |
| 1236       | Stiilne puust müts                | Accessories | mütsid      | Balti Mood OÜ          | 127.65     | 205.89       | false         | 2021-02-21 |
| 1357       | Stiilne puust müts                | Accessories | mütsid      | Balti Mood OÜ          | 127.65     | 205.89       | false         | 2021-02-21 |
| 1351       | Vintage nahkne tossud             | Footwear    | tossud      | Riia Stils SIA         | 305.72     | 179.95       | false         | 2020-07-28 |
| 1261       | Vintage nahkne tossud             | Footwear    | tossud      | Riia Stils SIA         | 305.72     | 179.95       | null          | 2020-07-28 |


## `NULL` väärtuste analüüs

*Leiame mitu `NULL` või puuduvat andmet on tabelis - on 18 rida öko sertifikaadita reast* `eco_certified`. *Eelmise päringu raames avastati, et üks nendest on duplikaat reast*.
| Nimeta | Kategooriata | Alamkategooriata | Tarnijata | Omahinnata | Müügihinnata | ECO sertifikaadita | Loomise kuupäevata |
| :----: | :----------: | :--------------: | :-------: | :--------: | :----------: | :----------------: | :----------------: |
| 0      | 0            | 0                | 0         | 0          | 0            | 18                 | 0                  |

## Andmete loogilisus

Otsitakse ebaloogilisi väärtusi või erandeid. Tulemuseks on 10 toodet kahjumiga, mis vajab ärilist tähelepanu. Ülejäänud andmed on järjekindlad ja loogilised.

*Leiame ebaloogilisi väärtusi - 10 toodet kahjumiga*.
| Negatiivne omahind | Negatiivne müügihind | Liiga kõrge omahind | Liiga kõrge müügihind | Kahjumiga tooted | Müügihind vähemalt 2x omahind | Omahind vähemalt 2x müügihind |
| :----------------: | :------------------: | :-----------------: | :-------------------: | :--------------: | :---------------------------: | :---------------------------: |
| 0                  | 0                    | 0                   | 0                     | 10               | 0                             | 0                             |

*Vaatame kategooriate veerust* `category` *ja alamkategooriate veerust* `subcategory` *omavahelist sobivust - paarid on loogilised*.
| Kategooria  | Alamkategooriad                                  |
| :---------: | :----------------------------------------------: |
| Accessories | ehted, kindad, kotid, mütsid, sallid, vööd       |
| Footwear    | botased, kingad, kontsad, sandaalid, tossud      |
| Kidswear    | jakid, kleidid, komplektid, püksid, trikotaaž    |
| Menswear    | jakid, kampsunid, püksid, särgid, ülikonnad      |
| Womenswear  | jakid, kleidid, pluusid, püksid, pusad, seelikud |

*Eraldi vaatame alamkategooriaid, mis kohtuvad mitmes kategoorias. Neid on kolm ja need tootetüübid võivad eksisteerida mitmes kategoorias*.
| Alamkategooria | Mitmes kategoorias | Mis kategooriates              |
| :------------: | :----------------: | :----------------------------: |
| jakid          | 3                  | Kidswear, Menswear, Womenswear |
| püksid         | 3                  | Kidswear, Menswear, Womenswear |
| kleidid        | 2                  | Kidswear, Womenswear           |

*Kannete vahemik on kooskõlas teiste tabelitega.*
| Vanim toode | Uusim toode |
| :---------: | :---------: |
| 15.01.2020  | 16.12.2024  |

## Andmete järjekindlus

Siin analüüsitakse kas andmed on konsistentsed. Tulemuseks on konsistentsuse kinnitus.

*Andmed on võrdväärsed kategooriate lõikes, puudub domineeriv kategooria*. 
| Kategooria  | Kogus |
| :---------: | :---: |
| Accessories | 67    |
| Footwear    | 73    |
| Kidswear    | 70    |
| Menswear    | 82    |
| Womenswear  | 70    |
| KOKKU       | 362   |

*Analüüs näitas, et originaalse ja normaliseeritud nimede arvud võrduvad ehk puuduvad vigased nimid. Analüüsiti* `product_name`, `category`, `subcategory` *ja* `supplier` *veerud*.
| Originaalne nimi | Normaliseeritud nimi | Originaalne kategooria | Normaliseeritud kategooria | Originaalne alamkategooria | Normaliseeritud alamkategooria | Originaalne tarnija | Normaliseeritud tarnija |
| :--------------: | :------------------: | :--------------------: | :------------------------: | :------------------------: | :----------------------------: | :-----------------: | :---------------------: |
| 350              | 350                  | 5                      | 5                          | 22                         | 22                             | 15                  | 15                      |

## Kokkuvõte
**Kontrollitud probleemid**: Duplikaatide ja puuduvate väärtuste otsimine ning andmete loogilisuse ja järjepidevuse kontroll.

**Tulemused arvudes**: 12 korduvat tootenime veerust product_name, millest 11 on identsed kirjed ja ühel erines ökosertifikaadi väärtus (`FALSE` vs `NULL`). Veerus `eco_certified` on 17 `NULL` ökosertifikaati ning veel üks `NULL` väärtusega kanne langeb kokku duplikaatse nimega. Ülejäänu on loogiline ja järjekindel.

**Peamine leid või risk**: 12 duplikaati võivad moonutada tulemusi ja vähendada nende usaldusväärsust.

**Soovitus Toomasele**: Eemaldada duplikaatseid nimesid võttes arvesse `eco_certified` väärtusi; võimalusel täiendada puuduvaid öko sertifikaatide andmeid.
