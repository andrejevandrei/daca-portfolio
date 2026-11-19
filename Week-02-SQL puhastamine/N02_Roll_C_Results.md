# Results

## Test tabeli loomine
Test tabel aitab kontrollida kas muudatused aitavad jõuda sihini ilma et riskida peaandmebaasi rikkumist

*Kontrollimiseks võrdleme ridade arvu, et vältida lisaduplikaatide tekkimist*
| Originaal | Test |
| :-------: | :--: |
| 362       | 362  |

## Duplikaatide analüüs
*Tabelis leidub üks veerg duplikaatidega - 12 tootenimi veerust* `product_name`
| Ridu | ID  | Unikaalsed ID | ID duplikaadid | Tooted | Unikaalsed tooted | Nimi duplikaadid |
| :--: | :-: | :-----------: | :------------: | :----: | :---------------: | :--------------: |
| 362  | 362 | 362           | 0              | 362    | 350               | 12               |

*Leiame toodete nimed ja duplikaatide arv*
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

**Kontrollitud probleemid**: Duplikaatide ja puuduvate väärtuste otsimine ning andmete loogilisuse ja järjepidevuse kontroll.

**Tulemused arvudes**: 12 korduvat tootenime veerust product_name, millest 11 on identsed kirjed ja ühel erines ökosertifikaadi väärtus (`FALSE` vs `NULL`). Veerus eco_certified on 17 `NULL` ökosertifikaati ning veel üks `NULL` väärtusega kanne langeb kokku duplikaatse nimega. Ülejäänu on loogiline ja järjekindel.

**Peamine leid või risk**: 12 duplikaati võivad moonutada tulemusi ja vähendada nende usaldusväärsust.

**Soovitus Toomasele**: Eemaldada duplikaatseid nimesid võttes arvesse `eco_certified` väärtusi; võimalusel täiendada puuduvaid öko sertifikaatide andmeid.
