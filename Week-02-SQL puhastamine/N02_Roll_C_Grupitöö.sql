--N02 Grupitöö Roll C
--"Leidsin just 5 116 duplikaatrida! Kui palju neid igas domeenis on?
--Eilses mentorsessioonis ma näitasin teile, kuidas DELETE ja UPDATE töötavad — ja miks need on OHTLIKUD. Nüüd on teie kord.
--Meie andmebaasis on KOLM kriitilist domeeni, mida tuleb puhastada: müügiandmed, kliendiandmed ja tooteandmed. Iga domeen vajab oma puhastamisplaani.
--Reegel: TEST KOOPIA KÕIGEPEALT. Siis puhasta. Siis kontrolli. Siis dokumenteeri.
--Juhatuse koosolek on 2 nädala pärast — Kristi tahab puhtaid numbreid. Ärge laske mind alt!"

--Leia duplikaadid, NULL väärtused ja ebajärjekindlused products tabelis. Loo test koopia ja dokumenteeri probleemid.

--Samm 1  Teeme test tabelit products_test
  --kustutab tabelit kui tabel eksisteerib
    drop
      table if exists products_test                         
    ;
  --loob koopiat tervest tabelist select * from customers
    create
      table products_test as select * from products         
    ;
  --kontroll - 362 rida
    select
      (select count (*) from products) as "Originaal",
      (select count (*) from products_test) as "Test"
    ;
  --tabeli struktuur
    select * from products_test limit 1
    
--Samm 2  Leiame duplikaadid
  --Tabelistruktuurist on loogilised variandid - product_id ja product_name. Arvutame, tulemus - product_name on 12 duplikaadiga 
    select
      count (*) as "Ridu",
      count (product_id)  as "ID",
      count (distinct product_id) as "Unikaalsed ID",
      count (product_id) - count (distinct product_id) as "ID duplikaadid",
      count (product_name)  as "Tooted",
      count (distinct product_name) as "Unikaalsed tooted",
      count (product_name) - count (distinct product_name) as "Nimi duplikaadid"
      from products_test
    ;

  --Teeme tabelit duplikaatidega - 12
    select product_name as "Toode",
      count (*) as "Duplikaate"
      from products_test
      group by product_name
      having count (*) > 1
      order by "Duplikaate" desc
    ;

  --Filtreerime duplikaate
    select
      * from products_test
      where product_name in (
        select product_name
        from products_test
        group by product_name
        having count (*) >1
        )
      order by product_name
    ;

--Samm 3  Andmete puudumine
  --Leiame puuduvaid väärtusi - ainult ECO sert 18 tk
    select
      count (*) filter (where product_name is null or trim(product_name) = '') as "Nimeta",
      count (*) filter (where category is null or trim(category) = '' ) as "Kategooriata",
      count (*) filter (where subcategory is null or trim(subcategory) = '' ) as "Alamkategooriata",
      count (*) filter (where supplier is null or trim(supplier) = '') as "Tarnijata",
      count (*) filter (where cost_price is null or cost_price <= 0) as "Omahinnata",
      count (*) filter (where retail_price is null or retail_price <= 0) as "Müügihinnata",
      count (*) filter (where eco_certified is null) as "ECO sertifikaadita",
      count (*) filter (where created_at is null) as "Loomise kuupäevata"
      from products_test
    ;

--Samm 4  Andmete loogilisus
  --Leiame ebaloogilisi väärtusi - 10 toodet kahjumiga
    select
      count (*) filter (where cost_price <=0) as "Negatiivne omahind",
      count (*) filter (where cost_price <=0) as "Negatiivne müügihind",
      count (*) filter (where cost_price >=1000) as "Liiga kõrge omahind",
      count (*) filter (where retail_price >=1000) as "Liiga kõrge müügihind",
      count (*) filter (where cost_price > retail_price) as "Kahjumiga tooted",
      count (*) filter (where cost_price > retail_price * 2 ) as "Müügihind vähemalt 2x omahind",
      count (*) filter (where retail_price > cost_price * 2) as "Omahind vähemalt 2x müügihind"
      from products_test
    ;

  -- Vaatame täpsemalt kahjumiga tooted - 2 on duplikaadid
    select * from products_test
      where cost_price > retail_price
      order by product_name, product_id asc

  --Filtreerime kahjumlikud tooted
    select
      *
      from products_test
      where cost_price > retail_price
    ;

  --Vaatame kategooria ja alamkategooriate paarid - loogiline
    --Käsitsi kategooria järgi
    select distinct
      category,
      subcategory
      from products_test
      order by category, subcategory
    ;

    --Andmereana kategooria järgi
    select
      category as "Kategooria",
      string_agg(distinct subcategory, ', ' order by subcategory) as "Alamkategooriad"
      from products_test
      where subcategory is not null
      group by category
      order by category
    ;

    --Alamkategooria järgi
    select
      subcategory as "Alamkategooria",
      string_agg(distinct category, ', ') as "Mis kategooriates"
      from products_test
      group by subcategory
      order by subcategory asc
    ;

  --Vaatame ainult alamkategooriaid, mis on mitmes kategoorias - 3
    select
      subcategory as "Alamkategooria",
      count(distinct category) as "Mitmes kategoorias",
      string_agg(distinct category, ', ') as "Mis kategooriates"
      from products_test
      group by subcategory
      having count (distinct category) > 1
      order by count(distinct category) desc, subcategory asc
    ;

    --Kontrollime kuupäevi - loogiline
  
    select
      to_char (min (created_at), 'dd.mm.yyyy') as "Vanim toode",     -- 15.01.2020
      to_char (max (created_at), 'dd.mm.yyyy') as "Uusim toode"      -- 16.12.2024
      from products_test
    ;

--Samm 5  Andmete järjekindlus
  --Analüüsime kategooriate lõikes
    select
      category as "Kategooria", count (*) as "Kogus"
      from products_test
      group by category
      order by category
    ;

  --Analüüsime kategooriate lõikes KOKKU reaga
    select
      coalesce(category, 'KOKKU') as "Kategooria",
      count (*) as "Kogus"
      from products_test
      group by rollup(category)
      order by
        grouping(category),
        category
    ;

   --Analüüsime alamkategooriate lõikes KOKKU reaga
    select
      coalesce(subcategory, 'KOKKU') as "Alamkategooria",
      count (*) as "Kogus"
      from products_test
      group by rollup(subcategory)
      order by
        grouping(subcategory),
        subcategory
    ;

  --Analüüsime kategooriate ja alamkategooriate lõikes KOKKU reaga
    select
      coalesce(category, 'KOKKU') as "Kategooria",
      coalesce(subcategory, 'KOKKU') as "Alamkategooria",
      count (*) as "Kogus"
      from products_test
      group by
        rollup(category, subcategory)
      order by
        grouping(category),
        category,
        grouping(subcategory),
        subcategory
    ;

  --Analüüsime kirjevariante
    select
     count (distinct product_name) as "Originaalne nimi",
     count (distinct translate(lower(trim(product_name)), 'õüöä', 'ouoa')) as "Normaliseeritud nimi",
     count (distinct category) as "Originaalne kategooria",
     count (distinct translate(lower(trim(category)), 'õüöä', 'ouoa')) as "Normaliseeritud kategooria",
     count (distinct subcategory) as "Originaalne alamkategooria",
     count (distinct translate(lower(trim(subcategory)), 'õüöä', 'ouoa')) as "Normaliseeritud alamkategooria",
     count (distinct supplier) as "Originaalne tarnija",
     count (distinct translate(lower(trim(supplier)), 'õüöä', 'ouoa')) as "Normaliseeritud tarnija"
     from products_test
    ;

--Samm 6
  --Tabeli täitmine

--Samm 7  Andmete ühtlustamine ja kategooriate ümbernimetamine
  --Ühtlustame kategooria nimesid tabeli uuendades
    update                                            --asendab andmeid tabelis
      products_test
      set category = initcap(trim(category))          --kustutab tühikuid ja teeb esimest tähte suureks (NB! PostgreSQL ei käsitle alamkriipsu tühikuna ka)
      where category != initcap(trim(category))      --asendab ainult read, kus on vaja ehk mis ei võrdu soovitud tulemusega - ajasääst
    ;  

  --Kontroll - õnnestub
    select
      category as "Kategooria", count (*) as "Kogus"
      from products_test
      group by category
      order by category
    ;

  --Nimetame ümber kategooriaid Case When abil
    update
      products_test
      set category = case
        when lower(trim(category)) in ('meeste_riided') then 'Menswear'
        when lower(trim(category)) in ('naiste_riided') then 'Womenswear'
        when lower(trim(category)) in ('laste_riided') then 'Kidswear'
        when lower(trim(category)) in ('jalanõusid') then 'Footwear'
        when lower(trim(category)) in ('aksessuaarid') then 'Accessories'
        else initcap(trim(category))
    end;

  --Kontroll - õnnestub
    select
      category as "Kategooria", count (*) as "Kogus"
      from products_test
      group by category
      order by category
    ;

