--U0  samm 4  ridu tabelis sales                15234
  select
    count (*) as "Müügid" from sales
  ;

--U0  samm 7  kliente, tooteid                  3150, 362	
  select
    (select count (*) from customers) as "Kliente",
    (select count (*) from products) as "Tooteid"
  ;

--U1  samm 2  ridu, arveid, koopiaid            15234, 10118, 5116	
  select
      count(*) as "Ridu kokku",
      count(distinct invoice_id) as "Unikaalseid arveid",
      count(invoice_id) - count(distinct invoice_id) as "Duplikaate"
    from sales
  ;

--U1  samm 4  mis arved kopeerivad (loetelu vähemalt viie koopiaga)
  select
    invoice_id,
    count (*) as "Koopiate arv"
    from sales
    group by invoice_id
    having count (*) >=5
    order by "Koopiate arv" desc
    limit 1000
  ;

  --U1  samm 5  näitame koopiatega listi, määrame originaali ja koopiat
  select
      invoice_id, id, customer_id, total_price,
      row_number () over (
        partition by invoice_id 
        order by id)
      as rn
    from sales
    where invoice_id in (
      select invoice_id from sales group by invoice_id having count (*) > 1)
    order by invoice_id, rn
    limit 20
  ;

--U1  samm 6  koopiaid ROW_NUMBER-iga           5116
  --with-ita
  select
      count (*) as "Duplikaadid"
    from (
      select row_number () over(
        partition by invoice_id
        order by id)
      as rn
    from sales)
    where rn >1
  ;

  --with-iga
  with nummerdatud as (
      select row_number () over(
       partition by invoice_id
       order by id)
    as rn
      from sales)
    select count (*) as "Duplikaadid"
    from nummerdatud
    where rn >1
  ;

--U2  samm 1  kliente, e-post puudub            3150, 380	
  select
     count(*) as "Kliendid kokku",                     -- kliente kokku
     count(*) - count(email) as "Kliendid e-mailita",  -- email puudub
     count(*) - count(phone) as "Kliendid telefonita"  -- telefon puudub
    from customers
  ;

--U2  samm 3  15 klienti emailita sorteeritud id järgi
  select customer_id, first_name, email, city
    from customers
    where email is null
    order by customer_id
    limit 15
  ;

--U2  samm 5  coaslesce asendab NULL väärtusi päringu tulemuses (antud juhul sõnaga puudub), mitte tabelis
  select customer_id, first_name, coalesce(email, 'puudub') as email, city
    from customers
    where email is null
    order by customer_id
    limit 15
  ;

--U2  samm 6  külalisridu (customer_id on tühi) 1487	
  select
    count(*) as "Külalisridu" from sales where customer_id is null
  ;

--U3  samm 1  vaatame lindade kirjutamisvariante
  select city as "Originaal", length(city) as "Pikkus", count (*) as "Kliente"
    from customers
    group by city
    order by lower(trim(city)), "Pikkus"
  ;

--U3  samm 2  vaatame Tallinna
  select city as "Originaal", length(city) as "Pikkus", count (*) as "Kliente"
    from customers
    where lower(trim(city)) = 'tallinn'
    group by city
    order by lower(trim(city)), "Pikkus"
  ;

--U3  samm 3  näitame linnu pärast ühtlustamist         12
  select
    count (distinct lower(trim(city))) as "Linnu" from customers 
  ;

  select initcap(trim(city)) as "Linn",
    count (*) as "Kliente",
    count(distinct city) as "Kirjaviise"
    from customers
    group by "Linn"
    order by "Kliente" desc
  ;
--U3  samm 5  vormindame kuupäeva, lisame kvartali
  select
    invoice_id as "Arve",
    sale_date as "Tehingu kuupäev",
    to_char(sale_date, 'dd.mm.yyyy') as "Eesti kuupäev",
    to_char(sale_date, '"Q"q yyyy') as "Kvartal"
    from sales
    order by sale_date desc nulls last
    limit 10
  ;

--U3  samm 6 vormindame suvalise kuupäeva
  select
    to_date('25/01/2023', 'DD/MM/YYYY') as "Kuupäev"
  ;

  select
    to_char (to_date('25/01/2023', 'DD/MM/YYYY'), 'dd.mm.yyyy') as "Kuupäev"
  ;

--U3  samm 7 samm 6 cigane kuju
  select cast ('pole number' as numeric)

--U3  samm 8  vigaseid kuupäevi                 50
  select
      count (*) as "Vigaseid kuupäevi"
    from sales
    where sale_date >'2025-02-28'
  ;
