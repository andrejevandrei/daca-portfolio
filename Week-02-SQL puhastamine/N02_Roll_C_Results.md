# Results

## Test tabeli loomine
Test tabel aitab kontrollida kas muudatused aitavad jõuda sihini ilma et riskida peaandmebaasi rikkumist

*Kontrollimiseks võrdleme ridade arvu, et vältida lisaduplikaatide tekkimist*
| Originaal | Test |
| :-------: | :--: |
| 362       | 362  |



**Kontrollitud probleemid**: Duplikaatide ja puuduvate väärtuste otsimine ning andmete loogilisuse ja järjepidevuse kontroll.

**Tulemused arvudes**: 12 korduvat tootenime veerust product_name, millest 11 on identsed kirjed ja ühel erines ökosertifikaadi väärtus (FALSE vs NULL). Veerus eco_certified on 17 NULL ökosertifikaati ning veel üks NULL väärtusega kanne langeb kokku duplikaatse nimega. Ülejäänu on loogiline ja järjekindel.

**Peamine leid või risk**: 12 duplikaati võivad moonutada tulemusi ja vähendada nende usaldusväärsust.

**Soovitus Toomasele**: Eemaldada duplikaatseid nimesid võttes arvesse eco_certified väärtusi; võimalusel täiendada puuduvaid öko sertifikaatide andmeid.
