| Kus | Mida lugesid | Oodatud | Minu tulemus | Mida ütleb Toomasele |
| :------: | :-: | :-: | :-: | :-: |
| U0 samm 4 | ridu tabelis sales | 15234 | 15234 (sales) | Kannete arv kokku (koos duplikaatidega) |
| U0 samm 7 | kliente, tooteid | 3150, 362 | 3150, 362 (customers, products) | Klientide ja toodete arv |
| U1 samm 2 | ridu, arveid, koopiaid | 15234, 10118, 5116 | 15234, 10118, 5116 (sales) | Unikaalsete klientide arvu ja tuletatud duplikaatide arvu |
| U1 samm 6 | koopiaid ROW\_NUMBER-iga | 5116 | 5116 (sales) | Klientide duplikaatide arvu kinnitus |
| U2 samm 1 | kliente, e-post puudub | 3150, 380 | 3150, 380 (customers) | Klientide arv, kes ei saa turundusmaterjale, uudiseid või muud laialisaatmist – paranduskoht müügilähenemises |
| U2 samm 6 | külalisridu (customer\_id on tühi) | 1487 | 1487 (sales) | Tehingute arv ilma klienti tuvastamata – muuta müügilähenemist ja pakkuda rohkem kliendikaarte, et koguda rohkem andmeid klientide kohta |
| U3 samm 3 | linnu pärast ühtlustamist | 12 | 12 (customers) | 42 valet varianti (7/9 ehk ca 78%) – linna lahter vajab täpsustamist või valikloendit, et andmed oleksid ühtsed |
| U3 samm 8 | vigaseid kuupäevi | 50 | 50 (sales) | Kontrollida, kas tegemist on reaalsete tehingutega, mis jõudsid andmebaasi, või vigaste ridadega. |
