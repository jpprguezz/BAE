-- Proporciona una consulta que muestre solo los clientes de Brazil.
select * from customer where country = 'Brazil';
/**
┌────────────┬───────────┬───────────┬──────────────────────────────────────────────────┬─────────────────────────────────┬─────────────────────┬───────┬─────────┬────────────┬────────────────────┬────────────────────┬───────────────────────────────┬──────────────┐
│ CustomerId │ FirstName │ LastName  │                     Company                      │             Address             │        City         │ State │ Country │ PostalCode │       Phone        │        Fax         │             Email             │ SupportRepId │
├────────────┼───────────┼───────────┼──────────────────────────────────────────────────┼─────────────────────────────────┼─────────────────────┼───────┼─────────┼────────────┼────────────────────┼────────────────────┼───────────────────────────────┼──────────────┤
│ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
└────────────┴───────────┴───────────┴──────────────────────────────────────────────────┴─────────────────────────────────┴─────────────────────┴───────┴─────────┴────────────┴────────────────────┴────────────────────┴───────────────────────────────┴──────────────┘
**/
-- Proporciona una consulta que muestre las facturas de clientes que son de Brazil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.
select c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry from customers as c inner join invoices as i on c.CustomerId=i.CustomerId where c.Country = 'Brazil';
/**
┌───────────┬───────────┬───────────┬─────────────────────┬────────────────┐
│ FirstName │ LastName  │ InvoiceId │     InvoiceDate     │ BillingCountry │
├───────────┼───────────┼───────────┼─────────────────────┼────────────────┤
│ Luís      │ Gonçalves │ 98        │ 2010-03-11 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 121       │ 2010-06-13 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 143       │ 2010-09-15 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 195       │ 2011-05-06 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 316       │ 2012-10-27 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 327       │ 2012-12-07 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 382       │ 2013-08-07 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 25        │ 2009-04-09 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 154       │ 2010-11-14 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 177       │ 2011-02-16 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 199       │ 2011-05-21 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 251       │ 2012-01-09 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 372       │ 2013-07-02 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 383       │ 2013-08-12 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 57        │ 2009-09-06 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 68        │ 2009-10-17 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 123       │ 2010-06-17 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 252       │ 2012-01-22 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 275       │ 2012-04-25 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 297       │ 2012-07-28 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 349       │ 2013-03-18 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 34        │ 2009-05-23 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 155       │ 2010-11-14 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 166       │ 2010-12-25 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 221       │ 2011-08-25 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 350       │ 2013-03-31 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 373       │ 2013-07-03 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 395       │ 2013-10-05 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 35        │ 2009-06-05 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 58        │ 2009-09-07 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 80        │ 2009-12-10 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 132       │ 2010-07-31 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 253       │ 2012-01-22 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 264       │ 2012-03-03 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 319       │ 2012-11-01 00:00:00 │ Brazil         │
└───────────┴───────────┴───────────┴─────────────────────┴────────────────┘
**/
-- Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.
select * from employees where title = 'Sales Support Agent';
/**
┌────────────┬──────────┬───────────┬─────────────────────┬───────────┬─────────────────────┬─────────────────────┬──────────────────┬─────────┬───────┬─────────┬────────────┬───────────────────┬───────────────────┬──────────────────────────┐
│ EmployeeId │ LastName │ FirstName │        Title        │ ReportsTo │      BirthDate      │      HireDate       │     Address      │  City   │ State │ Country │ PostalCode │       Phone       │        Fax        │          Email           │
├────────────┼──────────┼───────────┼─────────────────────┼───────────┼─────────────────────┼─────────────────────┼──────────────────┼─────────┼───────┼─────────┼────────────┼───────────────────┼───────────────────┼──────────────────────────┤
│ 3          │ Peacock  │ Jane      │ Sales Support Agent │ 2         │ 1973-08-29 00:00:00 │ 2002-04-01 00:00:00 │ 1111 6 Ave SW    │ Calgary │ AB    │ Canada  │ T2P 5M5    │ +1 (403) 262-3443 │ +1 (403) 262-6712 │ jane@chinookcorp.com     │
│ 4          │ Park     │ Margaret  │ Sales Support Agent │ 2         │ 1947-09-19 00:00:00 │ 2003-05-03 00:00:00 │ 683 10 Street SW │ Calgary │ AB    │ Canada  │ T2P 5G3    │ +1 (403) 263-4423 │ +1 (403) 263-4289 │ margaret@chinookcorp.com │
│ 5          │ Johnson  │ Steve     │ Sales Support Agent │ 2         │ 1965-03-03 00:00:00 │ 2003-10-17 00:00:00 │ 7727B 41 Ave     │ Calgary │ AB    │ Canada  │ T3B 1Y7    │ 1 (780) 836-9987  │ 1 (780) 836-9543  │ steve@chinookcorp.com    │
└────────────┴──────────┴───────────┴─────────────────────┴───────────┴─────────────────────┴─────────────────────┴──────────────────┴─────────┴───────┴─────────┴────────────┴───────────────────┴───────────────────┴──────────────────────────┘
**/
-- Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.
select BillingCountry from invoices;
/**
┌────────────────┐
│ BillingCountry │
├────────────────┤
│ Germany        │
│ Norway         │
│ Belgium        │
│ Canada         │
│ USA            │
│ Germany        │
│ Germany        │
│ France         │
│ France         │
│ Ireland        │
│ United Kingdom │
│ Germany        │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ France         │
│ United Kingdom │
│ Australia      │
│ Chile          │
│ India          │
│ Norway         │
│ Brazil         │
│ USA            │
│ Canada         │
│ Portugal       │
│ Germany        │
│ Germany        │
│ France         │
│ Netherlands    │
│ Chile          │
│ Brazil         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ Germany        │
│ Spain          │
│ Sweden         │
│ United Kingdom │
│ Australia      │
│ India          │
│ Czech Republic │
│ Canada         │
│ Canada         │
│ Canada         │
│ Canada         │
│ Portugal       │
│ Germany        │
│ Finland        │
│ United Kingdom │
│ Belgium        │
│ Denmark        │
│ Brazil         │
│ Brazil         │
│ USA            │
│ USA            │
│ Canada         │
│ Ireland        │
│ Italy          │
│ Poland         │
│ Sweden         │
│ Australia      │
│ Germany        │
│ Brazil         │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Portugal       │
│ France         │
│ Poland         │
│ Norway         │
│ Czech Republic │
│ Austria        │
│ Denmark        │
│ Brazil         │
│ USA            │
│ USA            │
│ France         │
│ France         │
│ Hungary        │
│ Italy          │
│ Sweden         │
│ Chile          │
│ Austria        │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Germany        │
│ Hungary        │
│ India          │
│ Brazil         │
│ Canada         │
│ Czech Republic │
│ Denmark        │
│ Canada         │
│ USA            │
│ Germany        │
│ France         │
│ France         │
│ France         │
│ Italy          │
│ United Kingdom │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ France         │
│ Australia      │
│ Argentina      │
│ India          │
│ Brazil         │
│ Czech Republic │
│ Brazil         │
│ USA            │
│ Portugal       │
│ Portugal       │
│ Germany        │
│ France         │
│ France         │
│ Poland         │
│ India          │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Germany        │
│ Sweden         │
│ United Kingdom │
│ United Kingdom │
│ Argentina      │
│ Brazil         │
│ Austria        │
│ USA            │
│ Canada         │
│ Canada         │
│ Canada         │
│ Portugal       │
│ France         │
│ Hungary        │
│ United Kingdom │
│ Denmark        │
│ Brazil         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ Canada         │
│ Italy          │
│ Netherlands    │
│ Spain          │
│ United Kingdom │
│ Argentina      │
│ Canada         │
│ Brazil         │
│ USA            │
│ USA            │
│ Canada         │
│ Canada         │
│ Portugal       │
│ France         │
│ Spain          │
│ Czech Republic │
│ Czech Republic │
│ Belgium        │
│ Brazil         │
│ Canada         │
│ USA            │
│ Canada         │
│ France         │
│ Finland        │
│ Ireland        │
│ Netherlands    │
│ United Kingdom │
│ India          │
│ Belgium        │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Germany        │
│ Ireland        │
│ Brazil         │
│ Germany        │
│ Norway         │
│ Czech Republic │
│ Brazil         │
│ USA            │
│ USA            │
│ France         │
│ France         │
│ France         │
│ Finland        │
│ Netherlands    │
│ United Kingdom │
│ Norway         │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ France         │
│ Argentina      │
│ Chile          │
│ India          │
│ Germany        │
│ Czech Republic │
│ Brazil         │
│ USA            │
│ Portugal       │
│ Germany        │
│ Germany        │
│ France         │
│ Finland        │
│ Spain          │
│ India          │
│ Canada         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Germany        │
│ United Kingdom │
│ United Kingdom │
│ Australia      │
│ Chile          │
│ Germany        │
│ Belgium        │
│ USA            │
│ Canada         │
│ Canada         │
│ Portugal       │
│ Germany        │
│ France         │
│ Ireland        │
│ Australia      │
│ Brazil         │
│ Brazil         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ Portugal       │
│ Netherlands    │
│ Poland         │
│ Sweden         │
│ United Kingdom │
│ Chile          │
│ Norway         │
│ Brazil         │
│ USA            │
│ USA            │
│ Canada         │
│ Canada         │
│ Germany        │
│ France         │
│ Sweden         │
│ Czech Republic │
│ Austria        │
│ Denmark        │
│ Brazil         │
│ Canada         │
│ USA            │
│ Canada         │
│ Finland        │
│ Hungary        │
│ Italy          │
│ Poland         │
│ United Kingdom │
│ India          │
│ Denmark        │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Germany        │
│ Italy          │
│ Germany        │
│ Canada         │
│ Czech Republic │
│ Austria        │
│ Brazil         │
│ USA            │
│ USA            │
│ France         │
│ France         │
│ France         │
│ Hungary        │
│ Poland         │
│ Australia      │
│ Czech Republic │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Portugal       │
│ France         │
│ Chile          │
│ India          │
│ Brazil         │
│ Canada         │
│ Austria        │
│ Brazil         │
│ USA            │
│ Germany        │
│ Germany        │
│ France         │
│ France         │
│ Hungary        │
│ Sweden         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ France         │
│ United Kingdom │
│ United Kingdom │
│ Argentina      │
│ India          │
│ Canada         │
│ Denmark        │
│ USA            │
│ Canada         │
│ Canada         │
│ Portugal       │
│ Germany        │
│ France         │
│ Italy          │
│ Argentina      │
│ Brazil         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ Portugal       │
│ Poland         │
│ Spain          │
│ United Kingdom │
│ United Kingdom │
│ India          │
│ Czech Republic │
│ Canada         │
│ USA            │
│ Canada         │
│ Canada         │
│ Canada         │
│ Germany        │
│ France         │
│ United Kingdom │
│ Austria        │
│ Belgium        │
│ Brazil         │
│ Brazil         │
│ USA            │
│ USA            │
│ Canada         │
│ Hungary        │
│ Ireland        │
│ Netherlands    │
│ Spain          │
│ United Kingdom │
│ Brazil         │
│ Brazil         │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Canada         │
│ France         │
│ Netherlands    │
│ Canada         │
│ Norway         │
│ Czech Republic │
│ Belgium        │
│ Brazil         │
│ USA            │
│ USA            │
│ France         │
│ France         │
│ Finland        │
│ Ireland        │
│ Spain          │
│ Argentina      │
│ Czech Republic │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Portugal       │
│ Finland        │
│ India          │
└────────────────┘
**/
-- Proporciona una consulta que muestre las facturas de clientes que son de Brazil.
select i.* from invoices as i inner join customers as c on i.CustomerId=c.CustomerId where c.Country = 'Brazil';
/**
┌───────────┬────────────┬─────────────────────┬─────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │         BillingAddress          │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │
├───────────┼────────────┼─────────────────────┼─────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┤
│ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │
│ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │
│ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │
│ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │
│ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │
│ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │
│ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │
│ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │
│ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │
│ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │
│ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │
│ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │
│ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │
│ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │
│ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │
│ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │
│ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │
│ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │
│ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │
│ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │
│ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │
│ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │
│ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │
│ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │
│ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │
│ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │
│ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │
└───────────┴────────────┴─────────────────────┴─────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┘
**/
-- Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.
select e.FirstName, e.LastName, i.* from invoices as i, employees as e, customers as c where c.CustomerId=i.CustomerId and e.title = 'Sales Support Agent'and e.EmployeeId=c.SupportRepId;
/**
┌───────────┬──────────┬───────────┬────────────┬─────────────────────┬──────────────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┐
│ FirstName │ LastName │ InvoiceId │ CustomerId │     InvoiceDate     │              BillingAddress              │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │
├───────────┼──────────┼───────────┼────────────┼─────────────────────┼──────────────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┤
│ Jane      │ Peacock  │ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │
│ Jane      │ Peacock  │ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │
│ Jane      │ Peacock  │ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │
│ Jane      │ Peacock  │ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │
│ Jane      │ Peacock  │ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │
│ Jane      │ Peacock  │ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │
│ Jane      │ Peacock  │ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170          │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │
│ Jane      │ Peacock  │ 99        │ 3          │ 2010-03-11 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 3.98  │
│ Jane      │ Peacock  │ 110       │ 3          │ 2010-04-21 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 13.86 │
│ Jane      │ Peacock  │ 165       │ 3          │ 2010-12-20 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 8.91  │
│ Jane      │ Peacock  │ 294       │ 3          │ 2012-07-26 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 1.98  │
│ Jane      │ Peacock  │ 317       │ 3          │ 2012-10-28 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 3.96  │
│ Jane      │ Peacock  │ 339       │ 3          │ 2013-01-30 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 5.94  │
│ Jane      │ Peacock  │ 391       │ 3          │ 2013-09-20 00:00:00 │ 1498 rue Bélanger                        │ Montréal            │ QC           │ Canada         │ H2G 1A7           │ 0.99  │
│ Jane      │ Peacock  │ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │
│ Jane      │ Peacock  │ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ Jane      │ Peacock  │ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │
│ Jane      │ Peacock  │ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │
│ Jane      │ Peacock  │ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ Jane      │ Peacock  │ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │
│ Jane      │ Peacock  │ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                         │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │
│ Jane      │ Peacock  │ 36        │ 15         │ 2009-06-05 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 1.98  │
│ Jane      │ Peacock  │ 47        │ 15         │ 2009-07-16 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 13.86 │
│ Jane      │ Peacock  │ 102       │ 15         │ 2010-03-16 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 9.91  │
│ Jane      │ Peacock  │ 231       │ 15         │ 2011-10-21 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 1.98  │
│ Jane      │ Peacock  │ 254       │ 15         │ 2012-01-23 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 3.96  │
│ Jane      │ Peacock  │ 276       │ 15         │ 2012-04-26 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 5.94  │
│ Jane      │ Peacock  │ 328       │ 15         │ 2012-12-15 00:00:00 │ 700 W Pender Street                      │ Vancouver           │ BC           │ Canada         │ V6C 1G8           │ 0.99  │
│ Jane      │ Peacock  │ 112       │ 18         │ 2010-05-12 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 1.98  │
│ Jane      │ Peacock  │ 135       │ 18         │ 2010-08-14 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 3.96  │
│ Jane      │ Peacock  │ 157       │ 18         │ 2010-11-16 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 5.94  │
│ Jane      │ Peacock  │ 209       │ 18         │ 2011-07-07 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 0.99  │
│ Jane      │ Peacock  │ 330       │ 18         │ 2012-12-28 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 1.98  │
│ Jane      │ Peacock  │ 341       │ 18         │ 2013-02-07 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 13.86 │
│ Jane      │ Peacock  │ 396       │ 18         │ 2013-10-08 00:00:00 │ 627 Broadway                             │ New York            │ NY           │ USA            │ 10012-2612        │ 8.91  │
│ Jane      │ Peacock  │ 15        │ 19         │ 2009-03-04 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 1.98  │
│ Jane      │ Peacock  │ 26        │ 19         │ 2009-04-14 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 13.86 │
│ Jane      │ Peacock  │ 81        │ 19         │ 2009-12-13 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 8.91  │
│ Jane      │ Peacock  │ 210       │ 19         │ 2011-07-20 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 1.98  │
│ Jane      │ Peacock  │ 233       │ 19         │ 2011-10-22 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 3.96  │
│ Jane      │ Peacock  │ 255       │ 19         │ 2012-01-24 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 5.94  │
│ Jane      │ Peacock  │ 307       │ 19         │ 2012-09-13 00:00:00 │ 1 Infinite Loop                          │ Cupertino           │ CA           │ USA            │ 95014             │ 1.99  │
│ Jane      │ Peacock  │ 92        │ 24         │ 2010-02-08 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 1.98  │
│ Jane      │ Peacock  │ 103       │ 24         │ 2010-03-21 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 15.86 │
│ Jane      │ Peacock  │ 158       │ 24         │ 2010-11-19 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 8.91  │
│ Jane      │ Peacock  │ 287       │ 24         │ 2012-06-25 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 1.98  │
│ Jane      │ Peacock  │ 310       │ 24         │ 2012-09-27 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 7.96  │
│ Jane      │ Peacock  │ 332       │ 24         │ 2012-12-30 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 5.94  │
│ Jane      │ Peacock  │ 384       │ 24         │ 2013-08-20 00:00:00 │ 162 E Superior Street                    │ Chicago             │ IL           │ USA            │ 60611             │ 0.99  │
│ Jane      │ Peacock  │ 48        │ 29         │ 2009-07-24 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 0.99  │
│ Jane      │ Peacock  │ 169       │ 29         │ 2011-01-15 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 1.98  │
│ Jane      │ Peacock  │ 180       │ 29         │ 2011-02-25 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 13.86 │
│ Jane      │ Peacock  │ 235       │ 29         │ 2011-10-26 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 8.91  │
│ Jane      │ Peacock  │ 364       │ 29         │ 2013-06-01 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 1.98  │
│ Jane      │ Peacock  │ 387       │ 29         │ 2013-09-03 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 3.96  │
│ Jane      │ Peacock  │ 409       │ 29         │ 2013-12-06 00:00:00 │ 796 Dundas Street West                   │ Toronto             │ ON           │ Canada         │ M6J 1V1           │ 5.94  │
│ Jane      │ Peacock  │ 49        │ 30         │ 2009-08-06 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 1.98  │
│ Jane      │ Peacock  │ 72        │ 30         │ 2009-11-08 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 3.96  │
│ Jane      │ Peacock  │ 94        │ 30         │ 2010-02-10 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 5.94  │
│ Jane      │ Peacock  │ 146       │ 30         │ 2010-10-01 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 0.99  │
│ Jane      │ Peacock  │ 267       │ 30         │ 2012-03-24 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 1.98  │
│ Jane      │ Peacock  │ 278       │ 30         │ 2012-05-04 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 13.86 │
│ Jane      │ Peacock  │ 333       │ 30         │ 2013-01-02 00:00:00 │ 230 Elgin Street                         │ Ottawa              │ ON           │ Canada         │ K2P 1L7           │ 8.91  │
│ Jane      │ Peacock  │ 27        │ 33         │ 2009-04-22 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 0.99  │
│ Jane      │ Peacock  │ 148       │ 33         │ 2010-10-14 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 1.98  │
│ Jane      │ Peacock  │ 159       │ 33         │ 2010-11-24 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 13.86 │
│ Jane      │ Peacock  │ 214       │ 33         │ 2011-07-25 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 8.91  │
│ Jane      │ Peacock  │ 343       │ 33         │ 2013-02-28 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 1.98  │
│ Jane      │ Peacock  │ 366       │ 33         │ 2013-06-02 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 3.96  │
│ Jane      │ Peacock  │ 388       │ 33         │ 2013-09-04 00:00:00 │ 5112 48 Street                           │ Yellowknife         │ NT           │ Canada         │ X1A 1N6           │ 5.94  │
│ Jane      │ Peacock  │ 6         │ 37         │ 2009-01-19 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 0.99  │
│ Jane      │ Peacock  │ 127       │ 37         │ 2010-07-13 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 1.98  │
│ Jane      │ Peacock  │ 138       │ 37         │ 2010-08-23 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 13.86 │
│ Jane      │ Peacock  │ 193       │ 37         │ 2011-04-23 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 14.91 │
│ Jane      │ Peacock  │ 322       │ 37         │ 2012-11-27 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 1.98  │
│ Jane      │ Peacock  │ 345       │ 37         │ 2013-03-01 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 3.96  │
│ Jane      │ Peacock  │ 367       │ 37         │ 2013-06-03 00:00:00 │ Berger Straße 10                         │ Frankfurt           │              │ Germany        │ 60316             │ 5.94  │
│ Jane      │ Peacock  │ 7         │ 38         │ 2009-02-01 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 1.98  │
│ Jane      │ Peacock  │ 30        │ 38         │ 2009-05-06 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 3.96  │
│ Jane      │ Peacock  │ 52        │ 38         │ 2009-08-08 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 5.94  │
│ Jane      │ Peacock  │ 104       │ 38         │ 2010-03-29 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 0.99  │
│ Jane      │ Peacock  │ 225       │ 38         │ 2011-09-20 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 1.98  │
│ Jane      │ Peacock  │ 236       │ 38         │ 2011-10-31 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 13.86 │
│ Jane      │ Peacock  │ 291       │ 38         │ 2012-06-30 00:00:00 │ Barbarossastraße 19                      │ Berlin              │              │ Germany        │ 10779             │ 8.91  │
│ Jane      │ Peacock  │ 9         │ 42         │ 2009-02-02 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 3.96  │
│ Jane      │ Peacock  │ 31        │ 42         │ 2009-05-07 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 5.94  │
│ Jane      │ Peacock  │ 83        │ 42         │ 2009-12-26 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 0.99  │
│ Jane      │ Peacock  │ 204       │ 42         │ 2011-06-19 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 3.98  │
│ Jane      │ Peacock  │ 215       │ 42         │ 2011-07-30 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 13.86 │
│ Jane      │ Peacock  │ 270       │ 42         │ 2012-03-29 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 8.91  │
│ Jane      │ Peacock  │ 399       │ 42         │ 2013-11-03 00:00:00 │ 9, Place Louis Barthou                   │ Bordeaux            │              │ France         │ 33000             │ 1.98  │
│ Jane      │ Peacock  │ 84        │ 43         │ 2010-01-08 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 1.98  │
│ Jane      │ Peacock  │ 107       │ 43         │ 2010-04-12 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 3.96  │
│ Jane      │ Peacock  │ 129       │ 43         │ 2010-07-15 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 5.94  │
│ Jane      │ Peacock  │ 181       │ 43         │ 2011-03-05 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 0.99  │
│ Jane      │ Peacock  │ 302       │ 43         │ 2012-08-26 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 1.98  │
│ Jane      │ Peacock  │ 313       │ 43         │ 2012-10-06 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 16.86 │
│ Jane      │ Peacock  │ 368       │ 43         │ 2013-06-06 00:00:00 │ 68, Rue Jouvence                         │ Dijon               │              │ France         │ 21000             │ 8.91  │
│ Jane      │ Peacock  │ 53        │ 44         │ 2009-08-11 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 8.91  │
│ Jane      │ Peacock  │ 182       │ 44         │ 2011-03-18 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 1.98  │
│ Jane      │ Peacock  │ 205       │ 44         │ 2011-06-20 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 7.96  │
│ Jane      │ Peacock  │ 227       │ 44         │ 2011-09-22 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 5.94  │
│ Jane      │ Peacock  │ 279       │ 44         │ 2012-05-12 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 0.99  │
│ Jane      │ Peacock  │ 400       │ 44         │ 2013-11-03 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 1.98  │
│ Jane      │ Peacock  │ 411       │ 44         │ 2013-12-14 00:00:00 │ Porthaninkatu 9                          │ Helsinki            │              │ Finland        │ 00530             │ 13.86 │
│ Jane      │ Peacock  │ 85        │ 45         │ 2010-01-08 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 1.98  │
│ Jane      │ Peacock  │ 96        │ 45         │ 2010-02-18 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 21.86 │
│ Jane      │ Peacock  │ 151       │ 45         │ 2010-10-19 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 8.91  │
│ Jane      │ Peacock  │ 280       │ 45         │ 2012-05-25 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 1.98  │
│ Jane      │ Peacock  │ 303       │ 45         │ 2012-08-27 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 3.96  │
│ Jane      │ Peacock  │ 325       │ 45         │ 2012-11-29 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 5.94  │
│ Jane      │ Peacock  │ 377       │ 45         │ 2013-07-20 00:00:00 │ Erzsébet krt. 58.                        │ Budapest            │              │ Hungary        │ H-1073            │ 0.99  │
│ Jane      │ Peacock  │ 10        │ 46         │ 2009-02-03 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 5.94  │
│ Jane      │ Peacock  │ 62        │ 46         │ 2009-09-24 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 0.99  │
│ Jane      │ Peacock  │ 183       │ 46         │ 2011-03-18 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 1.98  │
│ Jane      │ Peacock  │ 194       │ 46         │ 2011-04-28 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 21.86 │
│ Jane      │ Peacock  │ 249       │ 46         │ 2011-12-27 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 8.91  │
│ Jane      │ Peacock  │ 378       │ 46         │ 2013-08-02 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 1.98  │
│ Jane      │ Peacock  │ 401       │ 46         │ 2013-11-04 00:00:00 │ 3 Chatham Street                         │ Dublin              │ Dublin       │ Ireland        │                   │ 3.96  │
│ Jane      │ Peacock  │ 11        │ 52         │ 2009-02-06 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 8.91  │
│ Jane      │ Peacock  │ 140       │ 52         │ 2010-09-13 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 1.98  │
│ Jane      │ Peacock  │ 163       │ 52         │ 2010-12-16 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 3.96  │
│ Jane      │ Peacock  │ 185       │ 52         │ 2011-03-20 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 5.94  │
│ Jane      │ Peacock  │ 237       │ 52         │ 2011-11-08 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 0.99  │
│ Jane      │ Peacock  │ 358       │ 52         │ 2013-05-01 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 1.98  │
│ Jane      │ Peacock  │ 369       │ 52         │ 2013-06-11 00:00:00 │ 202 Hoxton Street                        │ London              │              │ United Kingdom │ N1 5LH            │ 13.86 │
│ Jane      │ Peacock  │ 43        │ 53         │ 2009-07-06 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 1.98  │
│ Jane      │ Peacock  │ 54        │ 53         │ 2009-08-16 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 13.86 │
│ Jane      │ Peacock  │ 109       │ 53         │ 2010-04-16 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 8.91  │
│ Jane      │ Peacock  │ 238       │ 53         │ 2011-11-21 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 1.98  │
│ Jane      │ Peacock  │ 261       │ 53         │ 2012-02-23 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 3.96  │
│ Jane      │ Peacock  │ 283       │ 53         │ 2012-05-27 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 5.94  │
│ Jane      │ Peacock  │ 335       │ 53         │ 2013-01-15 00:00:00 │ 113 Lupus St                             │ London              │              │ United Kingdom │ SW1V 3EN          │ 0.99  │
│ Jane      │ Peacock  │ 120       │ 58         │ 2010-06-12 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 1.98  │
│ Jane      │ Peacock  │ 131       │ 58         │ 2010-07-23 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 13.86 │
│ Jane      │ Peacock  │ 186       │ 58         │ 2011-03-23 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 8.91  │
│ Jane      │ Peacock  │ 315       │ 58         │ 2012-10-27 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 1.98  │
│ Jane      │ Peacock  │ 338       │ 58         │ 2013-01-29 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 3.96  │
│ Jane      │ Peacock  │ 360       │ 58         │ 2013-05-03 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 5.94  │
│ Jane      │ Peacock  │ 412       │ 58         │ 2013-12-22 00:00:00 │ 12,Community Centre                      │ Delhi               │              │ India          │ 110017            │ 1.99  │
│ Jane      │ Peacock  │ 23        │ 59         │ 2009-04-05 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 3.96  │
│ Jane      │ Peacock  │ 45        │ 59         │ 2009-07-08 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 5.94  │
│ Jane      │ Peacock  │ 97        │ 59         │ 2010-02-26 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 1.99  │
│ Jane      │ Peacock  │ 218       │ 59         │ 2011-08-20 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 1.98  │
│ Jane      │ Peacock  │ 229       │ 59         │ 2011-09-30 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 13.86 │
│ Jane      │ Peacock  │ 284       │ 59         │ 2012-05-30 00:00:00 │ 3,Raj Bhavan Road                        │ Bangalore           │              │ India          │ 560001            │ 8.91  │
│ Margaret  │ Park     │ 2         │ 4          │ 2009-01-02 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 3.96  │
│ Margaret  │ Park     │ 24        │ 4          │ 2009-04-06 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 5.94  │
│ Margaret  │ Park     │ 76        │ 4          │ 2009-11-25 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 0.99  │
│ Margaret  │ Park     │ 197       │ 4          │ 2011-05-19 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 1.98  │
│ Margaret  │ Park     │ 208       │ 4          │ 2011-06-29 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 15.86 │
│ Margaret  │ Park     │ 263       │ 4          │ 2012-02-27 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 8.91  │
│ Margaret  │ Park     │ 392       │ 4          │ 2013-10-03 00:00:00 │ Ullevålsveien 14                         │ Oslo                │              │ Norway         │ 0171              │ 1.98  │
│ Margaret  │ Park     │ 77        │ 5          │ 2009-12-08 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 1.98  │
│ Margaret  │ Park     │ 100       │ 5          │ 2010-03-12 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 3.96  │
│ Margaret  │ Park     │ 122       │ 5          │ 2010-06-14 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 5.94  │
│ Margaret  │ Park     │ 174       │ 5          │ 2011-02-02 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 0.99  │
│ Margaret  │ Park     │ 295       │ 5          │ 2012-07-26 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 1.98  │
│ Margaret  │ Park     │ 306       │ 5          │ 2012-09-05 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 16.86 │
│ Margaret  │ Park     │ 361       │ 5          │ 2013-05-06 00:00:00 │ Klanova 9/506                            │ Prague              │              │ Czech Republic │ 14700             │ 8.91  │
│ Margaret  │ Park     │ 3         │ 8          │ 2009-01-03 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 5.94  │
│ Margaret  │ Park     │ 55        │ 8          │ 2009-08-24 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 0.99  │
│ Margaret  │ Park     │ 176       │ 8          │ 2011-02-15 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 1.98  │
│ Margaret  │ Park     │ 187       │ 8          │ 2011-03-28 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 13.86 │
│ Margaret  │ Park     │ 242       │ 8          │ 2011-11-26 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 8.91  │
│ Margaret  │ Park     │ 371       │ 8          │ 2013-07-02 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 1.98  │
│ Margaret  │ Park     │ 394       │ 8          │ 2013-10-04 00:00:00 │ Grétrystraat 63                          │ Brussels            │              │ Belgium        │ 1000              │ 3.96  │
│ Margaret  │ Park     │ 56        │ 9          │ 2009-09-06 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 1.98  │
│ Margaret  │ Park     │ 79        │ 9          │ 2009-12-09 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 3.96  │
│ Margaret  │ Park     │ 101       │ 9          │ 2010-03-13 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 5.94  │
│ Margaret  │ Park     │ 153       │ 9          │ 2010-11-01 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 0.99  │
│ Margaret  │ Park     │ 274       │ 9          │ 2012-04-24 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 1.98  │
│ Margaret  │ Park     │ 285       │ 9          │ 2012-06-04 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 13.86 │
│ Margaret  │ Park     │ 340       │ 9          │ 2013-02-02 00:00:00 │ Sønder Boulevard 51                      │ Copenhagen          │              │ Denmark        │ 1720              │ 8.91  │
│ Margaret  │ Park     │ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │
│ Margaret  │ Park     │ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ Margaret  │ Park     │ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │
│ Margaret  │ Park     │ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │
│ Margaret  │ Park     │ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │
│ Margaret  │ Park     │ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ Margaret  │ Park     │ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155                │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │
│ Margaret  │ Park     │ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ Margaret  │ Park     │ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │
│ Margaret  │ Park     │ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │
│ Margaret  │ Park     │ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │
│ Margaret  │ Park     │ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ Margaret  │ Park     │ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │
│ Margaret  │ Park     │ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                             │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │
│ Margaret  │ Park     │ 13        │ 16         │ 2009-02-19 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 0.99  │
│ Margaret  │ Park     │ 134       │ 16         │ 2010-08-13 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 1.98  │
│ Margaret  │ Park     │ 145       │ 16         │ 2010-09-23 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 13.86 │
│ Margaret  │ Park     │ 200       │ 16         │ 2011-05-24 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 8.91  │
│ Margaret  │ Park     │ 329       │ 16         │ 2012-12-28 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 1.98  │
│ Margaret  │ Park     │ 352       │ 16         │ 2013-04-01 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 3.96  │
│ Margaret  │ Park     │ 374       │ 16         │ 2013-07-04 00:00:00 │ 1600 Amphitheatre Parkway                │ Mountain View       │ CA           │ USA            │ 94043-1351        │ 5.94  │
│ Margaret  │ Park     │ 113       │ 20         │ 2010-05-12 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 1.98  │
│ Margaret  │ Park     │ 124       │ 20         │ 2010-06-22 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 13.86 │
│ Margaret  │ Park     │ 179       │ 20         │ 2011-02-20 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 8.91  │
│ Margaret  │ Park     │ 308       │ 20         │ 2012-09-26 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 3.98  │
│ Margaret  │ Park     │ 331       │ 20         │ 2012-12-29 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 3.96  │
│ Margaret  │ Park     │ 353       │ 20         │ 2013-04-02 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 5.94  │
│ Margaret  │ Park     │ 405       │ 20         │ 2013-11-21 00:00:00 │ 541 Del Medio Avenue                     │ Mountain View       │ CA           │ USA            │ 94040-111         │ 0.99  │
│ Margaret  │ Park     │ 91        │ 22         │ 2010-02-08 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 1.98  │
│ Margaret  │ Park     │ 114       │ 22         │ 2010-05-13 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 3.96  │
│ Margaret  │ Park     │ 136       │ 22         │ 2010-08-15 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 5.94  │
│ Margaret  │ Park     │ 188       │ 22         │ 2011-04-05 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 0.99  │
│ Margaret  │ Park     │ 309       │ 22         │ 2012-09-26 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 3.98  │
│ Margaret  │ Park     │ 320       │ 22         │ 2012-11-06 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 13.86 │
│ Margaret  │ Park     │ 375       │ 22         │ 2013-07-07 00:00:00 │ 120 S Orange Ave                         │ Orlando             │ FL           │ USA            │ 32801             │ 8.91  │
│ Margaret  │ Park     │ 5         │ 23         │ 2009-01-11 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 13.86 │
│ Margaret  │ Park     │ 60        │ 23         │ 2009-09-11 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 8.91  │
│ Margaret  │ Park     │ 189       │ 23         │ 2011-04-18 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 1.98  │
│ Margaret  │ Park     │ 212       │ 23         │ 2011-07-21 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 3.96  │
│ Margaret  │ Park     │ 234       │ 23         │ 2011-10-23 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 5.94  │
│ Margaret  │ Park     │ 286       │ 23         │ 2012-06-12 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 0.99  │
│ Margaret  │ Park     │ 407       │ 23         │ 2013-12-04 00:00:00 │ 69 Salem Street                          │ Boston              │ MA           │ USA            │ 2113              │ 1.98  │
│ Margaret  │ Park     │ 70        │ 26         │ 2009-11-07 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 1.98  │
│ Margaret  │ Park     │ 93        │ 26         │ 2010-02-09 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 3.96  │
│ Margaret  │ Park     │ 115       │ 26         │ 2010-05-14 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 5.94  │
│ Margaret  │ Park     │ 167       │ 26         │ 2011-01-02 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 0.99  │
│ Margaret  │ Park     │ 288       │ 26         │ 2012-06-25 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 1.98  │
│ Margaret  │ Park     │ 299       │ 26         │ 2012-08-05 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 23.86 │
│ Margaret  │ Park     │ 354       │ 26         │ 2013-04-05 00:00:00 │ 2211 W Berry Street                      │ Fort Worth          │ TX           │ USA            │ 76110             │ 8.91  │
│ Margaret  │ Park     │ 39        │ 27         │ 2009-06-10 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 8.91  │
│ Margaret  │ Park     │ 168       │ 27         │ 2011-01-15 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 1.98  │
│ Margaret  │ Park     │ 191       │ 27         │ 2011-04-19 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 3.96  │
│ Margaret  │ Park     │ 213       │ 27         │ 2011-07-22 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 5.94  │
│ Margaret  │ Park     │ 265       │ 27         │ 2012-03-11 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 0.99  │
│ Margaret  │ Park     │ 386       │ 27         │ 2013-09-02 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 1.98  │
│ Margaret  │ Park     │ 397       │ 27         │ 2013-10-13 00:00:00 │ 1033 N Park Ave                          │ Tucson              │ AZ           │ USA            │ 85719             │ 13.86 │
│ Margaret  │ Park     │ 50        │ 32         │ 2009-08-06 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 1.98  │
│ Margaret  │ Park     │ 61        │ 32         │ 2009-09-16 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 13.86 │
│ Margaret  │ Park     │ 116       │ 32         │ 2010-05-17 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 8.91  │
│ Margaret  │ Park     │ 245       │ 32         │ 2011-12-22 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 1.98  │
│ Margaret  │ Park     │ 268       │ 32         │ 2012-03-25 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 3.96  │
│ Margaret  │ Park     │ 290       │ 32         │ 2012-06-27 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 5.94  │
│ Margaret  │ Park     │ 342       │ 32         │ 2013-02-15 00:00:00 │ 696 Osborne Street                       │ Winnipeg            │ MB           │ Canada         │ R3L 2B9           │ 0.99  │
│ Margaret  │ Park     │ 28        │ 34         │ 2009-05-05 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 1.98  │
│ Margaret  │ Park     │ 51        │ 34         │ 2009-08-07 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 3.96  │
│ Margaret  │ Park     │ 73        │ 34         │ 2009-11-09 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 5.94  │
│ Margaret  │ Park     │ 125       │ 34         │ 2010-06-30 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 0.99  │
│ Margaret  │ Park     │ 246       │ 34         │ 2011-12-22 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 1.98  │
│ Margaret  │ Park     │ 257       │ 34         │ 2012-02-01 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 13.86 │
│ Margaret  │ Park     │ 312       │ 34         │ 2012-10-01 00:00:00 │ Rua da Assunção 53                       │ Lisbon              │              │ Portugal       │                   │ 10.91 │
│ Margaret  │ Park     │ 126       │ 35         │ 2010-07-13 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 1.98  │
│ Margaret  │ Park     │ 149       │ 35         │ 2010-10-15 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 3.96  │
│ Margaret  │ Park     │ 171       │ 35         │ 2011-01-17 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 5.94  │
│ Margaret  │ Park     │ 223       │ 35         │ 2011-09-07 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 0.99  │
│ Margaret  │ Park     │ 344       │ 35         │ 2013-02-28 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 1.98  │
│ Margaret  │ Park     │ 355       │ 35         │ 2013-04-10 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 13.86 │
│ Margaret  │ Park     │ 410       │ 35         │ 2013-12-09 00:00:00 │ Rua dos Campeões Europeus de Viena, 4350 │ Porto               │              │ Portugal       │                   │ 8.91  │
│ Margaret  │ Park     │ 105       │ 39         │ 2010-04-11 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 1.98  │
│ Margaret  │ Park     │ 128       │ 39         │ 2010-07-14 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 3.96  │
│ Margaret  │ Park     │ 150       │ 39         │ 2010-10-16 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 5.94  │
│ Margaret  │ Park     │ 202       │ 39         │ 2011-06-06 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 1.99  │
│ Margaret  │ Park     │ 323       │ 39         │ 2012-11-27 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 1.98  │
│ Margaret  │ Park     │ 334       │ 39         │ 2013-01-07 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 13.86 │
│ Margaret  │ Park     │ 389       │ 39         │ 2013-09-07 00:00:00 │ 4, Rue Milton                            │ Paris               │              │ France         │ 75009             │ 8.91  │
│ Margaret  │ Park     │ 8         │ 40         │ 2009-02-01 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 1.98  │
│ Margaret  │ Park     │ 19        │ 40         │ 2009-03-14 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 13.86 │
│ Margaret  │ Park     │ 74        │ 40         │ 2009-11-12 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 8.91  │
│ Margaret  │ Park     │ 203       │ 40         │ 2011-06-19 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 2.98  │
│ Margaret  │ Park     │ 226       │ 40         │ 2011-09-21 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 3.96  │
│ Margaret  │ Park     │ 248       │ 40         │ 2011-12-24 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 5.94  │
│ Margaret  │ Park     │ 300       │ 40         │ 2012-08-13 00:00:00 │ 8, Rue Hanovre                           │ Paris               │              │ France         │ 75002             │ 0.99  │
│ Margaret  │ Park     │ 64        │ 49         │ 2009-10-07 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 1.98  │
│ Margaret  │ Park     │ 75        │ 49         │ 2009-11-17 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 13.86 │
│ Margaret  │ Park     │ 130       │ 49         │ 2010-07-18 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 8.91  │
│ Margaret  │ Park     │ 259       │ 49         │ 2012-02-22 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 1.98  │
│ Margaret  │ Park     │ 282       │ 49         │ 2012-05-26 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 3.96  │
│ Margaret  │ Park     │ 304       │ 49         │ 2012-08-28 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 5.94  │
│ Margaret  │ Park     │ 356       │ 49         │ 2013-04-18 00:00:00 │ Ordynacka 10                             │ Warsaw              │              │ Poland         │ 00-358            │ 0.99  │
│ Margaret  │ Park     │ 21        │ 55         │ 2009-04-04 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 1.98  │
│ Margaret  │ Park     │ 44        │ 55         │ 2009-07-07 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 3.96  │
│ Margaret  │ Park     │ 66        │ 55         │ 2009-10-09 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 5.94  │
│ Margaret  │ Park     │ 118       │ 55         │ 2010-05-30 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 0.99  │
│ Margaret  │ Park     │ 239       │ 55         │ 2011-11-21 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 1.98  │
│ Margaret  │ Park     │ 250       │ 55         │ 2012-01-01 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 13.86 │
│ Margaret  │ Park     │ 305       │ 55         │ 2012-08-31 00:00:00 │ 421 Bourke Street                        │ Sidney              │ NSW          │ Australia      │ 2010              │ 8.91  │
│ Margaret  │ Park     │ 119       │ 56         │ 2010-06-12 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 1.98  │
│ Margaret  │ Park     │ 142       │ 56         │ 2010-09-14 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 3.96  │
│ Margaret  │ Park     │ 164       │ 56         │ 2010-12-17 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 5.94  │
│ Margaret  │ Park     │ 216       │ 56         │ 2011-08-07 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 0.99  │
│ Margaret  │ Park     │ 337       │ 56         │ 2013-01-28 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 1.98  │
│ Margaret  │ Park     │ 348       │ 56         │ 2013-03-10 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 13.86 │
│ Margaret  │ Park     │ 403       │ 56         │ 2013-11-08 00:00:00 │ 307 Macacha Güemes                       │ Buenos Aires        │              │ Argentina      │ 1106              │ 8.91  │
│ Steve     │ Johnson  │ 1         │ 2          │ 2009-01-01 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 1.98  │
│ Steve     │ Johnson  │ 12        │ 2          │ 2009-02-11 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 13.86 │
│ Steve     │ Johnson  │ 67        │ 2          │ 2009-10-12 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 8.91  │
│ Steve     │ Johnson  │ 196       │ 2          │ 2011-05-19 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 1.98  │
│ Steve     │ Johnson  │ 219       │ 2          │ 2011-08-21 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 3.96  │
│ Steve     │ Johnson  │ 241       │ 2          │ 2011-11-23 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 5.94  │
│ Steve     │ Johnson  │ 293       │ 2          │ 2012-07-13 00:00:00 │ Theodor-Heuss-Straße 34                  │ Stuttgart           │              │ Germany        │ 70174             │ 0.99  │
│ Steve     │ Johnson  │ 46        │ 6          │ 2009-07-11 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 8.91  │
│ Steve     │ Johnson  │ 175       │ 6          │ 2011-02-15 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 1.98  │
│ Steve     │ Johnson  │ 198       │ 6          │ 2011-05-20 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 3.96  │
│ Steve     │ Johnson  │ 220       │ 6          │ 2011-08-22 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 5.94  │
│ Steve     │ Johnson  │ 272       │ 6          │ 2012-04-11 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 0.99  │
│ Steve     │ Johnson  │ 393       │ 6          │ 2013-10-03 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 1.98  │
│ Steve     │ Johnson  │ 404       │ 6          │ 2013-11-13 00:00:00 │ Rilská 3174/6                            │ Prague              │              │ Czech Republic │ 14300             │ 25.86 │
│ Steve     │ Johnson  │ 78        │ 7          │ 2009-12-08 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 1.98  │
│ Steve     │ Johnson  │ 89        │ 7          │ 2010-01-18 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 18.86 │
│ Steve     │ Johnson  │ 144       │ 7          │ 2010-09-18 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 8.91  │
│ Steve     │ Johnson  │ 273       │ 7          │ 2012-04-24 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 1.98  │
│ Steve     │ Johnson  │ 296       │ 7          │ 2012-07-27 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 3.96  │
│ Steve     │ Johnson  │ 318       │ 7          │ 2012-10-29 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 5.94  │
│ Steve     │ Johnson  │ 370       │ 7          │ 2013-06-19 00:00:00 │ Rotenturmstraße 4, 1010 Innere Stadt     │ Vienne              │              │ Austria        │ 1010              │ 0.99  │
│ Steve     │ Johnson  │ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ Steve     │ Johnson  │ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │
│ Steve     │ Johnson  │ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │
│ Steve     │ Johnson  │ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ Steve     │ Johnson  │ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │
│ Steve     │ Johnson  │ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │
│ Steve     │ Johnson  │ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022                       │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │
│ Steve     │ Johnson  │ 4         │ 14         │ 2009-01-06 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 8.91  │
│ Steve     │ Johnson  │ 133       │ 14         │ 2010-08-13 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 1.98  │
│ Steve     │ Johnson  │ 156       │ 14         │ 2010-11-15 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 3.96  │
│ Steve     │ Johnson  │ 178       │ 14         │ 2011-02-17 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 5.94  │
│ Steve     │ Johnson  │ 230       │ 14         │ 2011-10-08 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 0.99  │
│ Steve     │ Johnson  │ 351       │ 14         │ 2013-03-31 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 1.98  │
│ Steve     │ Johnson  │ 362       │ 14         │ 2013-05-11 00:00:00 │ 8210 111 ST NW                           │ Edmonton            │ AB           │ Canada         │ T6G 2C7           │ 13.86 │
│ Steve     │ Johnson  │ 14        │ 17         │ 2009-03-04 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 1.98  │
│ Steve     │ Johnson  │ 37        │ 17         │ 2009-06-06 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 3.96  │
│ Steve     │ Johnson  │ 59        │ 17         │ 2009-09-08 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 5.94  │
│ Steve     │ Johnson  │ 111       │ 17         │ 2010-04-29 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 0.99  │
│ Steve     │ Johnson  │ 232       │ 17         │ 2011-10-21 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 1.98  │
│ Steve     │ Johnson  │ 243       │ 17         │ 2011-12-01 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 13.86 │
│ Steve     │ Johnson  │ 298       │ 17         │ 2012-07-31 00:00:00 │ 1 Microsoft Way                          │ Redmond             │ WA           │ USA            │ 98052-8300        │ 10.91 │
│ Steve     │ Johnson  │ 16        │ 21         │ 2009-03-05 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 3.96  │
│ Steve     │ Johnson  │ 38        │ 21         │ 2009-06-07 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 5.94  │
│ Steve     │ Johnson  │ 90        │ 21         │ 2010-01-26 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 0.99  │
│ Steve     │ Johnson  │ 211       │ 21         │ 2011-07-20 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 1.98  │
│ Steve     │ Johnson  │ 222       │ 21         │ 2011-08-30 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 13.86 │
│ Steve     │ Johnson  │ 277       │ 21         │ 2012-04-29 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 8.91  │
│ Steve     │ Johnson  │ 406       │ 21         │ 2013-12-04 00:00:00 │ 801 W 4th Street                         │ Reno                │ NV           │ USA            │ 89503             │ 1.98  │
│ Steve     │ Johnson  │ 17        │ 25         │ 2009-03-06 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 5.94  │
│ Steve     │ Johnson  │ 69        │ 25         │ 2009-10-25 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 0.99  │
│ Steve     │ Johnson  │ 190       │ 25         │ 2011-04-18 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 1.98  │
│ Steve     │ Johnson  │ 201       │ 25         │ 2011-05-29 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 18.86 │
│ Steve     │ Johnson  │ 256       │ 25         │ 2012-01-27 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 8.91  │
│ Steve     │ Johnson  │ 385       │ 25         │ 2013-09-02 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 1.98  │
│ Steve     │ Johnson  │ 408       │ 25         │ 2013-12-05 00:00:00 │ 319 N. Frances Street                    │ Madison             │ WI           │ USA            │ 53703             │ 3.96  │
│ Steve     │ Johnson  │ 71        │ 28         │ 2009-11-07 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 1.98  │
│ Steve     │ Johnson  │ 82        │ 28         │ 2009-12-18 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 13.86 │
│ Steve     │ Johnson  │ 137       │ 28         │ 2010-08-18 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 8.91  │
│ Steve     │ Johnson  │ 266       │ 28         │ 2012-03-24 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 1.98  │
│ Steve     │ Johnson  │ 289       │ 28         │ 2012-06-26 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 3.96  │
│ Steve     │ Johnson  │ 311       │ 28         │ 2012-09-28 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 11.94 │
│ Steve     │ Johnson  │ 363       │ 28         │ 2013-05-19 00:00:00 │ 302 S 700 E                              │ Salt Lake City      │ UT           │ USA            │ 84102             │ 0.99  │
│ Steve     │ Johnson  │ 18        │ 31         │ 2009-03-09 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 8.91  │
│ Steve     │ Johnson  │ 147       │ 31         │ 2010-10-14 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 1.98  │
│ Steve     │ Johnson  │ 170       │ 31         │ 2011-01-16 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 3.96  │
│ Steve     │ Johnson  │ 192       │ 31         │ 2011-04-20 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 5.94  │
│ Steve     │ Johnson  │ 244       │ 31         │ 2011-12-09 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 0.99  │
│ Steve     │ Johnson  │ 365       │ 31         │ 2013-06-01 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 1.98  │
│ Steve     │ Johnson  │ 376       │ 31         │ 2013-07-12 00:00:00 │ 194A Chain Lake Drive                    │ Halifax             │ NS           │ Canada         │ B3S 1C5           │ 13.86 │
│ Steve     │ Johnson  │ 29        │ 36         │ 2009-05-05 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 1.98  │
│ Steve     │ Johnson  │ 40        │ 36         │ 2009-06-15 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 13.86 │
│ Steve     │ Johnson  │ 95        │ 36         │ 2010-02-13 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 8.91  │
│ Steve     │ Johnson  │ 224       │ 36         │ 2011-09-20 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 1.98  │
│ Steve     │ Johnson  │ 247       │ 36         │ 2011-12-23 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 3.96  │
│ Steve     │ Johnson  │ 269       │ 36         │ 2012-03-26 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 5.94  │
│ Steve     │ Johnson  │ 321       │ 36         │ 2012-11-14 00:00:00 │ Tauentzienstraße 8                       │ Berlin              │              │ Germany        │ 10789             │ 0.99  │
│ Steve     │ Johnson  │ 106       │ 41         │ 2010-04-11 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 1.98  │
│ Steve     │ Johnson  │ 117       │ 41         │ 2010-05-22 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 13.86 │
│ Steve     │ Johnson  │ 172       │ 41         │ 2011-01-20 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 8.91  │
│ Steve     │ Johnson  │ 301       │ 41         │ 2012-08-26 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 1.98  │
│ Steve     │ Johnson  │ 324       │ 41         │ 2012-11-28 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 3.96  │
│ Steve     │ Johnson  │ 346       │ 41         │ 2013-03-02 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 5.94  │
│ Steve     │ Johnson  │ 398       │ 41         │ 2013-10-21 00:00:00 │ 11, Place Bellecour                      │ Lyon                │              │ France         │ 69002             │ 0.99  │
│ Steve     │ Johnson  │ 63        │ 47         │ 2009-10-07 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 1.98  │
│ Steve     │ Johnson  │ 86        │ 47         │ 2010-01-09 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 3.96  │
│ Steve     │ Johnson  │ 108       │ 47         │ 2010-04-13 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 5.94  │
│ Steve     │ Johnson  │ 160       │ 47         │ 2010-12-02 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 0.99  │
│ Steve     │ Johnson  │ 281       │ 47         │ 2012-05-25 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 1.98  │
│ Steve     │ Johnson  │ 292       │ 47         │ 2012-07-05 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 13.86 │
│ Steve     │ Johnson  │ 347       │ 47         │ 2013-03-05 00:00:00 │ Via Degli Scipioni, 43                   │ Rome                │ RM           │ Italy          │ 00192             │ 8.91  │
│ Steve     │ Johnson  │ 32        │ 48         │ 2009-05-10 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 8.91  │
│ Steve     │ Johnson  │ 161       │ 48         │ 2010-12-15 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 1.98  │
│ Steve     │ Johnson  │ 184       │ 48         │ 2011-03-19 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 3.96  │
│ Steve     │ Johnson  │ 206       │ 48         │ 2011-06-21 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 8.94  │
│ Steve     │ Johnson  │ 258       │ 48         │ 2012-02-09 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 0.99  │
│ Steve     │ Johnson  │ 379       │ 48         │ 2013-08-02 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 1.98  │
│ Steve     │ Johnson  │ 390       │ 48         │ 2013-09-12 00:00:00 │ Lijnbaansgracht 120bg                    │ Amsterdam           │ VV           │ Netherlands    │ 1016              │ 13.86 │
│ Steve     │ Johnson  │ 41        │ 50         │ 2009-06-23 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 0.99  │
│ Steve     │ Johnson  │ 162       │ 50         │ 2010-12-15 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 1.98  │
│ Steve     │ Johnson  │ 173       │ 50         │ 2011-01-25 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 13.86 │
│ Steve     │ Johnson  │ 228       │ 50         │ 2011-09-25 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 8.91  │
│ Steve     │ Johnson  │ 357       │ 50         │ 2013-05-01 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 1.98  │
│ Steve     │ Johnson  │ 380       │ 50         │ 2013-08-03 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 3.96  │
│ Steve     │ Johnson  │ 402       │ 50         │ 2013-11-05 00:00:00 │ C/ San Bernardo 85                       │ Madrid              │              │ Spain          │ 28015             │ 5.94  │
│ Steve     │ Johnson  │ 42        │ 51         │ 2009-07-06 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 1.98  │
│ Steve     │ Johnson  │ 65        │ 51         │ 2009-10-08 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 3.96  │
│ Steve     │ Johnson  │ 87        │ 51         │ 2010-01-10 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 6.94  │
│ Steve     │ Johnson  │ 139       │ 51         │ 2010-08-31 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 0.99  │
│ Steve     │ Johnson  │ 260       │ 51         │ 2012-02-22 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 1.98  │
│ Steve     │ Johnson  │ 271       │ 51         │ 2012-04-03 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 13.86 │
│ Steve     │ Johnson  │ 326       │ 51         │ 2012-12-02 00:00:00 │ Celsiusg. 9                              │ Stockholm           │              │ Sweden         │ 11230             │ 8.91  │
│ Steve     │ Johnson  │ 20        │ 54         │ 2009-03-22 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 0.99  │
│ Steve     │ Johnson  │ 141       │ 54         │ 2010-09-13 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 1.98  │
│ Steve     │ Johnson  │ 152       │ 54         │ 2010-10-24 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 13.86 │
│ Steve     │ Johnson  │ 207       │ 54         │ 2011-06-24 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 8.91  │
│ Steve     │ Johnson  │ 336       │ 54         │ 2013-01-28 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 1.98  │
│ Steve     │ Johnson  │ 359       │ 54         │ 2013-05-02 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 3.96  │
│ Steve     │ Johnson  │ 381       │ 54         │ 2013-08-04 00:00:00 │ 110 Raeburn Pl                           │ Edinburgh           │              │ United Kingdom │ EH4 1HH           │ 5.94  │
│ Steve     │ Johnson  │ 22        │ 57         │ 2009-04-04 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 1.98  │
│ Steve     │ Johnson  │ 33        │ 57         │ 2009-05-15 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 13.86 │
│ Steve     │ Johnson  │ 88        │ 57         │ 2010-01-13 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 17.91 │
│ Steve     │ Johnson  │ 217       │ 57         │ 2011-08-20 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 1.98  │
│ Steve     │ Johnson  │ 240       │ 57         │ 2011-11-22 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 3.96  │
│ Steve     │ Johnson  │ 262       │ 57         │ 2012-02-24 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 5.94  │
│ Steve     │ Johnson  │ 314       │ 57         │ 2012-10-14 00:00:00 │ Calle Lira, 198                          │ Santiago            │              │ Chile          │                   │ 0.99  │
└───────────┴──────────┴───────────┴────────────┴─────────────────────┴──────────────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┘
**/
-- Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.
select i.Total as TotalFactura, c.FirstName, c.LastName, e.Country from customers as c, employees as e, invoices as i where c.CustomerId=i.CustomerId and e.EmployeeId=c.SupportRepId and e.Title = 'Sales Support Agent'; -- Con Where
 select i.Total as TotalFactura, c.FirstName, c.LastName, e.Country from customers as c join invoices as i on c.CustomerId=i.CustomerId join employees as e on c.SupportRepId = e.EmployeeId where e.Title = 'Sales Support Agent'; --Con Join
/**
┌──────────────┬───────────┬──────────────┬─────────┐
│ TotalFactura │ FirstName │   LastName   │ Country │
├──────────────┼───────────┼──────────────┼─────────┤
│ 3.98         │ Luís      │ Gonçalves    │ Canada  │
│ 3.96         │ Luís      │ Gonçalves    │ Canada  │
│ 5.94         │ Luís      │ Gonçalves    │ Canada  │
│ 0.99         │ Luís      │ Gonçalves    │ Canada  │
│ 1.98         │ Luís      │ Gonçalves    │ Canada  │
│ 13.86        │ Luís      │ Gonçalves    │ Canada  │
│ 8.91         │ Luís      │ Gonçalves    │ Canada  │
│ 3.98         │ François  │ Tremblay     │ Canada  │
│ 13.86        │ François  │ Tremblay     │ Canada  │
│ 8.91         │ François  │ Tremblay     │ Canada  │
│ 1.98         │ François  │ Tremblay     │ Canada  │
│ 3.96         │ François  │ Tremblay     │ Canada  │
│ 5.94         │ François  │ Tremblay     │ Canada  │
│ 0.99         │ François  │ Tremblay     │ Canada  │
│ 0.99         │ Roberto   │ Almeida      │ Canada  │
│ 1.98         │ Roberto   │ Almeida      │ Canada  │
│ 13.86        │ Roberto   │ Almeida      │ Canada  │
│ 8.91         │ Roberto   │ Almeida      │ Canada  │
│ 1.98         │ Roberto   │ Almeida      │ Canada  │
│ 3.96         │ Roberto   │ Almeida      │ Canada  │
│ 5.94         │ Roberto   │ Almeida      │ Canada  │
│ 1.98         │ Jennifer  │ Peterson     │ Canada  │
│ 13.86        │ Jennifer  │ Peterson     │ Canada  │
│ 9.91         │ Jennifer  │ Peterson     │ Canada  │
│ 1.98         │ Jennifer  │ Peterson     │ Canada  │
│ 3.96         │ Jennifer  │ Peterson     │ Canada  │
│ 5.94         │ Jennifer  │ Peterson     │ Canada  │
│ 0.99         │ Jennifer  │ Peterson     │ Canada  │
│ 1.98         │ Michelle  │ Brooks       │ Canada  │
│ 3.96         │ Michelle  │ Brooks       │ Canada  │
│ 5.94         │ Michelle  │ Brooks       │ Canada  │
│ 0.99         │ Michelle  │ Brooks       │ Canada  │
│ 1.98         │ Michelle  │ Brooks       │ Canada  │
│ 13.86        │ Michelle  │ Brooks       │ Canada  │
│ 8.91         │ Michelle  │ Brooks       │ Canada  │
│ 1.98         │ Tim       │ Goyer        │ Canada  │
│ 13.86        │ Tim       │ Goyer        │ Canada  │
│ 8.91         │ Tim       │ Goyer        │ Canada  │
│ 1.98         │ Tim       │ Goyer        │ Canada  │
│ 3.96         │ Tim       │ Goyer        │ Canada  │
│ 5.94         │ Tim       │ Goyer        │ Canada  │
│ 1.99         │ Tim       │ Goyer        │ Canada  │
│ 1.98         │ Frank     │ Ralston      │ Canada  │
│ 15.86        │ Frank     │ Ralston      │ Canada  │
│ 8.91         │ Frank     │ Ralston      │ Canada  │
│ 1.98         │ Frank     │ Ralston      │ Canada  │
│ 7.96         │ Frank     │ Ralston      │ Canada  │
│ 5.94         │ Frank     │ Ralston      │ Canada  │
│ 0.99         │ Frank     │ Ralston      │ Canada  │
│ 0.99         │ Robert    │ Brown        │ Canada  │
│ 1.98         │ Robert    │ Brown        │ Canada  │
│ 13.86        │ Robert    │ Brown        │ Canada  │
│ 8.91         │ Robert    │ Brown        │ Canada  │
│ 1.98         │ Robert    │ Brown        │ Canada  │
│ 3.96         │ Robert    │ Brown        │ Canada  │
│ 5.94         │ Robert    │ Brown        │ Canada  │
│ 1.98         │ Edward    │ Francis      │ Canada  │
│ 3.96         │ Edward    │ Francis      │ Canada  │
│ 5.94         │ Edward    │ Francis      │ Canada  │
│ 0.99         │ Edward    │ Francis      │ Canada  │
│ 1.98         │ Edward    │ Francis      │ Canada  │
│ 13.86        │ Edward    │ Francis      │ Canada  │
│ 8.91         │ Edward    │ Francis      │ Canada  │
│ 0.99         │ Ellie     │ Sullivan     │ Canada  │
│ 1.98         │ Ellie     │ Sullivan     │ Canada  │
│ 13.86        │ Ellie     │ Sullivan     │ Canada  │
│ 8.91         │ Ellie     │ Sullivan     │ Canada  │
│ 1.98         │ Ellie     │ Sullivan     │ Canada  │
│ 3.96         │ Ellie     │ Sullivan     │ Canada  │
│ 5.94         │ Ellie     │ Sullivan     │ Canada  │
│ 0.99         │ Fynn      │ Zimmermann   │ Canada  │
│ 1.98         │ Fynn      │ Zimmermann   │ Canada  │
│ 13.86        │ Fynn      │ Zimmermann   │ Canada  │
│ 14.91        │ Fynn      │ Zimmermann   │ Canada  │
│ 1.98         │ Fynn      │ Zimmermann   │ Canada  │
│ 3.96         │ Fynn      │ Zimmermann   │ Canada  │
│ 5.94         │ Fynn      │ Zimmermann   │ Canada  │
│ 1.98         │ Niklas    │ Schröder     │ Canada  │
│ 3.96         │ Niklas    │ Schröder     │ Canada  │
│ 5.94         │ Niklas    │ Schröder     │ Canada  │
│ 0.99         │ Niklas    │ Schröder     │ Canada  │
│ 1.98         │ Niklas    │ Schröder     │ Canada  │
│ 13.86        │ Niklas    │ Schröder     │ Canada  │
│ 8.91         │ Niklas    │ Schröder     │ Canada  │
│ 3.96         │ Wyatt     │ Girard       │ Canada  │
│ 5.94         │ Wyatt     │ Girard       │ Canada  │
│ 0.99         │ Wyatt     │ Girard       │ Canada  │
│ 3.98         │ Wyatt     │ Girard       │ Canada  │
│ 13.86        │ Wyatt     │ Girard       │ Canada  │
│ 8.91         │ Wyatt     │ Girard       │ Canada  │
│ 1.98         │ Wyatt     │ Girard       │ Canada  │
│ 1.98         │ Isabelle  │ Mercier      │ Canada  │
│ 3.96         │ Isabelle  │ Mercier      │ Canada  │
│ 5.94         │ Isabelle  │ Mercier      │ Canada  │
│ 0.99         │ Isabelle  │ Mercier      │ Canada  │
│ 1.98         │ Isabelle  │ Mercier      │ Canada  │
│ 16.86        │ Isabelle  │ Mercier      │ Canada  │
│ 8.91         │ Isabelle  │ Mercier      │ Canada  │
│ 8.91         │ Terhi     │ Hämäläinen   │ Canada  │
│ 1.98         │ Terhi     │ Hämäläinen   │ Canada  │
│ 7.96         │ Terhi     │ Hämäläinen   │ Canada  │
│ 5.94         │ Terhi     │ Hämäläinen   │ Canada  │
│ 0.99         │ Terhi     │ Hämäläinen   │ Canada  │
│ 1.98         │ Terhi     │ Hämäläinen   │ Canada  │
│ 13.86        │ Terhi     │ Hämäläinen   │ Canada  │
│ 1.98         │ Ladislav  │ Kovács       │ Canada  │
│ 21.86        │ Ladislav  │ Kovács       │ Canada  │
│ 8.91         │ Ladislav  │ Kovács       │ Canada  │
│ 1.98         │ Ladislav  │ Kovács       │ Canada  │
│ 3.96         │ Ladislav  │ Kovács       │ Canada  │
│ 5.94         │ Ladislav  │ Kovács       │ Canada  │
│ 0.99         │ Ladislav  │ Kovács       │ Canada  │
│ 5.94         │ Hugh      │ O'Reilly     │ Canada  │
│ 0.99         │ Hugh      │ O'Reilly     │ Canada  │
│ 1.98         │ Hugh      │ O'Reilly     │ Canada  │
│ 21.86        │ Hugh      │ O'Reilly     │ Canada  │
│ 8.91         │ Hugh      │ O'Reilly     │ Canada  │
│ 1.98         │ Hugh      │ O'Reilly     │ Canada  │
│ 3.96         │ Hugh      │ O'Reilly     │ Canada  │
│ 8.91         │ Emma      │ Jones        │ Canada  │
│ 1.98         │ Emma      │ Jones        │ Canada  │
│ 3.96         │ Emma      │ Jones        │ Canada  │
│ 5.94         │ Emma      │ Jones        │ Canada  │
│ 0.99         │ Emma      │ Jones        │ Canada  │
│ 1.98         │ Emma      │ Jones        │ Canada  │
│ 13.86        │ Emma      │ Jones        │ Canada  │
│ 1.98         │ Phil      │ Hughes       │ Canada  │
│ 13.86        │ Phil      │ Hughes       │ Canada  │
│ 8.91         │ Phil      │ Hughes       │ Canada  │
│ 1.98         │ Phil      │ Hughes       │ Canada  │
│ 3.96         │ Phil      │ Hughes       │ Canada  │
│ 5.94         │ Phil      │ Hughes       │ Canada  │
│ 0.99         │ Phil      │ Hughes       │ Canada  │
│ 1.98         │ Manoj     │ Pareek       │ Canada  │
│ 13.86        │ Manoj     │ Pareek       │ Canada  │
│ 8.91         │ Manoj     │ Pareek       │ Canada  │
│ 1.98         │ Manoj     │ Pareek       │ Canada  │
│ 3.96         │ Manoj     │ Pareek       │ Canada  │
│ 5.94         │ Manoj     │ Pareek       │ Canada  │
│ 1.99         │ Manoj     │ Pareek       │ Canada  │
│ 3.96         │ Puja      │ Srivastava   │ Canada  │
│ 5.94         │ Puja      │ Srivastava   │ Canada  │
│ 1.99         │ Puja      │ Srivastava   │ Canada  │
│ 1.98         │ Puja      │ Srivastava   │ Canada  │
│ 13.86        │ Puja      │ Srivastava   │ Canada  │
│ 8.91         │ Puja      │ Srivastava   │ Canada  │
│ 3.96         │ Bjørn     │ Hansen       │ Canada  │
│ 5.94         │ Bjørn     │ Hansen       │ Canada  │
│ 0.99         │ Bjørn     │ Hansen       │ Canada  │
│ 1.98         │ Bjørn     │ Hansen       │ Canada  │
│ 15.86        │ Bjørn     │ Hansen       │ Canada  │
│ 8.91         │ Bjørn     │ Hansen       │ Canada  │
│ 1.98         │ Bjørn     │ Hansen       │ Canada  │
│ 1.98         │ František │ Wichterlová  │ Canada  │
│ 3.96         │ František │ Wichterlová  │ Canada  │
│ 5.94         │ František │ Wichterlová  │ Canada  │
│ 0.99         │ František │ Wichterlová  │ Canada  │
│ 1.98         │ František │ Wichterlová  │ Canada  │
│ 16.86        │ František │ Wichterlová  │ Canada  │
│ 8.91         │ František │ Wichterlová  │ Canada  │
│ 5.94         │ Daan      │ Peeters      │ Canada  │
│ 0.99         │ Daan      │ Peeters      │ Canada  │
│ 1.98         │ Daan      │ Peeters      │ Canada  │
│ 13.86        │ Daan      │ Peeters      │ Canada  │
│ 8.91         │ Daan      │ Peeters      │ Canada  │
│ 1.98         │ Daan      │ Peeters      │ Canada  │
│ 3.96         │ Daan      │ Peeters      │ Canada  │
│ 1.98         │ Kara      │ Nielsen      │ Canada  │
│ 3.96         │ Kara      │ Nielsen      │ Canada  │
│ 5.94         │ Kara      │ Nielsen      │ Canada  │
│ 0.99         │ Kara      │ Nielsen      │ Canada  │
│ 1.98         │ Kara      │ Nielsen      │ Canada  │
│ 13.86        │ Kara      │ Nielsen      │ Canada  │
│ 8.91         │ Kara      │ Nielsen      │ Canada  │
│ 8.91         │ Eduardo   │ Martins      │ Canada  │
│ 1.98         │ Eduardo   │ Martins      │ Canada  │
│ 3.96         │ Eduardo   │ Martins      │ Canada  │
│ 5.94         │ Eduardo   │ Martins      │ Canada  │
│ 0.99         │ Eduardo   │ Martins      │ Canada  │
│ 1.98         │ Eduardo   │ Martins      │ Canada  │
│ 13.86        │ Eduardo   │ Martins      │ Canada  │
│ 1.98         │ Fernanda  │ Ramos        │ Canada  │
│ 3.96         │ Fernanda  │ Ramos        │ Canada  │
│ 5.94         │ Fernanda  │ Ramos        │ Canada  │
│ 0.99         │ Fernanda  │ Ramos        │ Canada  │
│ 1.98         │ Fernanda  │ Ramos        │ Canada  │
│ 13.86        │ Fernanda  │ Ramos        │ Canada  │
│ 8.91         │ Fernanda  │ Ramos        │ Canada  │
│ 0.99         │ Frank     │ Harris       │ Canada  │
│ 1.98         │ Frank     │ Harris       │ Canada  │
│ 13.86        │ Frank     │ Harris       │ Canada  │
│ 8.91         │ Frank     │ Harris       │ Canada  │
│ 1.98         │ Frank     │ Harris       │ Canada  │
│ 3.96         │ Frank     │ Harris       │ Canada  │
│ 5.94         │ Frank     │ Harris       │ Canada  │
│ 1.98         │ Dan       │ Miller       │ Canada  │
│ 13.86        │ Dan       │ Miller       │ Canada  │
│ 8.91         │ Dan       │ Miller       │ Canada  │
│ 3.98         │ Dan       │ Miller       │ Canada  │
│ 3.96         │ Dan       │ Miller       │ Canada  │
│ 5.94         │ Dan       │ Miller       │ Canada  │
│ 0.99         │ Dan       │ Miller       │ Canada  │
│ 1.98         │ Heather   │ Leacock      │ Canada  │
│ 3.96         │ Heather   │ Leacock      │ Canada  │
│ 5.94         │ Heather   │ Leacock      │ Canada  │
│ 0.99         │ Heather   │ Leacock      │ Canada  │
│ 3.98         │ Heather   │ Leacock      │ Canada  │
│ 13.86        │ Heather   │ Leacock      │ Canada  │
│ 8.91         │ Heather   │ Leacock      │ Canada  │
│ 13.86        │ John      │ Gordon       │ Canada  │
│ 8.91         │ John      │ Gordon       │ Canada  │
│ 1.98         │ John      │ Gordon       │ Canada  │
│ 3.96         │ John      │ Gordon       │ Canada  │
│ 5.94         │ John      │ Gordon       │ Canada  │
│ 0.99         │ John      │ Gordon       │ Canada  │
│ 1.98         │ John      │ Gordon       │ Canada  │
│ 1.98         │ Richard   │ Cunningham   │ Canada  │
│ 3.96         │ Richard   │ Cunningham   │ Canada  │
│ 5.94         │ Richard   │ Cunningham   │ Canada  │
│ 0.99         │ Richard   │ Cunningham   │ Canada  │
│ 1.98         │ Richard   │ Cunningham   │ Canada  │
│ 23.86        │ Richard   │ Cunningham   │ Canada  │
│ 8.91         │ Richard   │ Cunningham   │ Canada  │
│ 8.91         │ Patrick   │ Gray         │ Canada  │
│ 1.98         │ Patrick   │ Gray         │ Canada  │
│ 3.96         │ Patrick   │ Gray         │ Canada  │
│ 5.94         │ Patrick   │ Gray         │ Canada  │
│ 0.99         │ Patrick   │ Gray         │ Canada  │
│ 1.98         │ Patrick   │ Gray         │ Canada  │
│ 13.86        │ Patrick   │ Gray         │ Canada  │
│ 1.98         │ Aaron     │ Mitchell     │ Canada  │
│ 13.86        │ Aaron     │ Mitchell     │ Canada  │
│ 8.91         │ Aaron     │ Mitchell     │ Canada  │
│ 1.98         │ Aaron     │ Mitchell     │ Canada  │
│ 3.96         │ Aaron     │ Mitchell     │ Canada  │
│ 5.94         │ Aaron     │ Mitchell     │ Canada  │
│ 0.99         │ Aaron     │ Mitchell     │ Canada  │
│ 1.98         │ João      │ Fernandes    │ Canada  │
│ 3.96         │ João      │ Fernandes    │ Canada  │
│ 5.94         │ João      │ Fernandes    │ Canada  │
│ 0.99         │ João      │ Fernandes    │ Canada  │
│ 1.98         │ João      │ Fernandes    │ Canada  │
│ 13.86        │ João      │ Fernandes    │ Canada  │
│ 10.91        │ João      │ Fernandes    │ Canada  │
│ 1.98         │ Madalena  │ Sampaio      │ Canada  │
│ 3.96         │ Madalena  │ Sampaio      │ Canada  │
│ 5.94         │ Madalena  │ Sampaio      │ Canada  │
│ 0.99         │ Madalena  │ Sampaio      │ Canada  │
│ 1.98         │ Madalena  │ Sampaio      │ Canada  │
│ 13.86        │ Madalena  │ Sampaio      │ Canada  │
│ 8.91         │ Madalena  │ Sampaio      │ Canada  │
│ 1.98         │ Camille   │ Bernard      │ Canada  │
│ 3.96         │ Camille   │ Bernard      │ Canada  │
│ 5.94         │ Camille   │ Bernard      │ Canada  │
│ 1.99         │ Camille   │ Bernard      │ Canada  │
│ 1.98         │ Camille   │ Bernard      │ Canada  │
│ 13.86        │ Camille   │ Bernard      │ Canada  │
│ 8.91         │ Camille   │ Bernard      │ Canada  │
│ 1.98         │ Dominique │ Lefebvre     │ Canada  │
│ 13.86        │ Dominique │ Lefebvre     │ Canada  │
│ 8.91         │ Dominique │ Lefebvre     │ Canada  │
│ 2.98         │ Dominique │ Lefebvre     │ Canada  │
│ 3.96         │ Dominique │ Lefebvre     │ Canada  │
│ 5.94         │ Dominique │ Lefebvre     │ Canada  │
│ 0.99         │ Dominique │ Lefebvre     │ Canada  │
│ 1.98         │ Stanisław │ Wójcik       │ Canada  │
│ 13.86        │ Stanisław │ Wójcik       │ Canada  │
│ 8.91         │ Stanisław │ Wójcik       │ Canada  │
│ 1.98         │ Stanisław │ Wójcik       │ Canada  │
│ 3.96         │ Stanisław │ Wójcik       │ Canada  │
│ 5.94         │ Stanisław │ Wójcik       │ Canada  │
│ 0.99         │ Stanisław │ Wójcik       │ Canada  │
│ 1.98         │ Mark      │ Taylor       │ Canada  │
│ 3.96         │ Mark      │ Taylor       │ Canada  │
│ 5.94         │ Mark      │ Taylor       │ Canada  │
│ 0.99         │ Mark      │ Taylor       │ Canada  │
│ 1.98         │ Mark      │ Taylor       │ Canada  │
│ 13.86        │ Mark      │ Taylor       │ Canada  │
│ 8.91         │ Mark      │ Taylor       │ Canada  │
│ 1.98         │ Diego     │ Gutiérrez    │ Canada  │
│ 3.96         │ Diego     │ Gutiérrez    │ Canada  │
│ 5.94         │ Diego     │ Gutiérrez    │ Canada  │
│ 0.99         │ Diego     │ Gutiérrez    │ Canada  │
│ 1.98         │ Diego     │ Gutiérrez    │ Canada  │
│ 13.86        │ Diego     │ Gutiérrez    │ Canada  │
│ 8.91         │ Diego     │ Gutiérrez    │ Canada  │
│ 1.98         │ Leonie    │ Köhler       │ Canada  │
│ 13.86        │ Leonie    │ Köhler       │ Canada  │
│ 8.91         │ Leonie    │ Köhler       │ Canada  │
│ 1.98         │ Leonie    │ Köhler       │ Canada  │
│ 3.96         │ Leonie    │ Köhler       │ Canada  │
│ 5.94         │ Leonie    │ Köhler       │ Canada  │
│ 0.99         │ Leonie    │ Köhler       │ Canada  │
│ 8.91         │ Helena    │ Holý         │ Canada  │
│ 1.98         │ Helena    │ Holý         │ Canada  │
│ 3.96         │ Helena    │ Holý         │ Canada  │
│ 5.94         │ Helena    │ Holý         │ Canada  │
│ 0.99         │ Helena    │ Holý         │ Canada  │
│ 1.98         │ Helena    │ Holý         │ Canada  │
│ 25.86        │ Helena    │ Holý         │ Canada  │
│ 1.98         │ Astrid    │ Gruber       │ Canada  │
│ 18.86        │ Astrid    │ Gruber       │ Canada  │
│ 8.91         │ Astrid    │ Gruber       │ Canada  │
│ 1.98         │ Astrid    │ Gruber       │ Canada  │
│ 3.96         │ Astrid    │ Gruber       │ Canada  │
│ 5.94         │ Astrid    │ Gruber       │ Canada  │
│ 0.99         │ Astrid    │ Gruber       │ Canada  │
│ 1.98         │ Alexandre │ Rocha        │ Canada  │
│ 13.86        │ Alexandre │ Rocha        │ Canada  │
│ 8.91         │ Alexandre │ Rocha        │ Canada  │
│ 1.98         │ Alexandre │ Rocha        │ Canada  │
│ 3.96         │ Alexandre │ Rocha        │ Canada  │
│ 5.94         │ Alexandre │ Rocha        │ Canada  │
│ 0.99         │ Alexandre │ Rocha        │ Canada  │
│ 8.91         │ Mark      │ Philips      │ Canada  │
│ 1.98         │ Mark      │ Philips      │ Canada  │
│ 3.96         │ Mark      │ Philips      │ Canada  │
│ 5.94         │ Mark      │ Philips      │ Canada  │
│ 0.99         │ Mark      │ Philips      │ Canada  │
│ 1.98         │ Mark      │ Philips      │ Canada  │
│ 13.86        │ Mark      │ Philips      │ Canada  │
│ 1.98         │ Jack      │ Smith        │ Canada  │
│ 3.96         │ Jack      │ Smith        │ Canada  │
│ 5.94         │ Jack      │ Smith        │ Canada  │
│ 0.99         │ Jack      │ Smith        │ Canada  │
│ 1.98         │ Jack      │ Smith        │ Canada  │
│ 13.86        │ Jack      │ Smith        │ Canada  │
│ 10.91        │ Jack      │ Smith        │ Canada  │
│ 3.96         │ Kathy     │ Chase        │ Canada  │
│ 5.94         │ Kathy     │ Chase        │ Canada  │
│ 0.99         │ Kathy     │ Chase        │ Canada  │
│ 1.98         │ Kathy     │ Chase        │ Canada  │
│ 13.86        │ Kathy     │ Chase        │ Canada  │
│ 8.91         │ Kathy     │ Chase        │ Canada  │
│ 1.98         │ Kathy     │ Chase        │ Canada  │
│ 5.94         │ Victor    │ Stevens      │ Canada  │
│ 0.99         │ Victor    │ Stevens      │ Canada  │
│ 1.98         │ Victor    │ Stevens      │ Canada  │
│ 18.86        │ Victor    │ Stevens      │ Canada  │
│ 8.91         │ Victor    │ Stevens      │ Canada  │
│ 1.98         │ Victor    │ Stevens      │ Canada  │
│ 3.96         │ Victor    │ Stevens      │ Canada  │
│ 1.98         │ Julia     │ Barnett      │ Canada  │
│ 13.86        │ Julia     │ Barnett      │ Canada  │
│ 8.91         │ Julia     │ Barnett      │ Canada  │
│ 1.98         │ Julia     │ Barnett      │ Canada  │
│ 3.96         │ Julia     │ Barnett      │ Canada  │
│ 11.94        │ Julia     │ Barnett      │ Canada  │
│ 0.99         │ Julia     │ Barnett      │ Canada  │
│ 8.91         │ Martha    │ Silk         │ Canada  │
│ 1.98         │ Martha    │ Silk         │ Canada  │
│ 3.96         │ Martha    │ Silk         │ Canada  │
│ 5.94         │ Martha    │ Silk         │ Canada  │
│ 0.99         │ Martha    │ Silk         │ Canada  │
│ 1.98         │ Martha    │ Silk         │ Canada  │
│ 13.86        │ Martha    │ Silk         │ Canada  │
│ 1.98         │ Hannah    │ Schneider    │ Canada  │
│ 13.86        │ Hannah    │ Schneider    │ Canada  │
│ 8.91         │ Hannah    │ Schneider    │ Canada  │
│ 1.98         │ Hannah    │ Schneider    │ Canada  │
│ 3.96         │ Hannah    │ Schneider    │ Canada  │
│ 5.94         │ Hannah    │ Schneider    │ Canada  │
│ 0.99         │ Hannah    │ Schneider    │ Canada  │
│ 1.98         │ Marc      │ Dubois       │ Canada  │
│ 13.86        │ Marc      │ Dubois       │ Canada  │
│ 8.91         │ Marc      │ Dubois       │ Canada  │
│ 1.98         │ Marc      │ Dubois       │ Canada  │
│ 3.96         │ Marc      │ Dubois       │ Canada  │
│ 5.94         │ Marc      │ Dubois       │ Canada  │
│ 0.99         │ Marc      │ Dubois       │ Canada  │
│ 1.98         │ Lucas     │ Mancini      │ Canada  │
│ 3.96         │ Lucas     │ Mancini      │ Canada  │
│ 5.94         │ Lucas     │ Mancini      │ Canada  │
│ 0.99         │ Lucas     │ Mancini      │ Canada  │
│ 1.98         │ Lucas     │ Mancini      │ Canada  │
│ 13.86        │ Lucas     │ Mancini      │ Canada  │
│ 8.91         │ Lucas     │ Mancini      │ Canada  │
│ 8.91         │ Johannes  │ Van der Berg │ Canada  │
│ 1.98         │ Johannes  │ Van der Berg │ Canada  │
│ 3.96         │ Johannes  │ Van der Berg │ Canada  │
│ 8.94         │ Johannes  │ Van der Berg │ Canada  │
│ 0.99         │ Johannes  │ Van der Berg │ Canada  │
│ 1.98         │ Johannes  │ Van der Berg │ Canada  │
│ 13.86        │ Johannes  │ Van der Berg │ Canada  │
│ 0.99         │ Enrique   │ Muñoz        │ Canada  │
│ 1.98         │ Enrique   │ Muñoz        │ Canada  │
│ 13.86        │ Enrique   │ Muñoz        │ Canada  │
│ 8.91         │ Enrique   │ Muñoz        │ Canada  │
│ 1.98         │ Enrique   │ Muñoz        │ Canada  │
│ 3.96         │ Enrique   │ Muñoz        │ Canada  │
│ 5.94         │ Enrique   │ Muñoz        │ Canada  │
│ 1.98         │ Joakim    │ Johansson    │ Canada  │
│ 3.96         │ Joakim    │ Johansson    │ Canada  │
│ 6.94         │ Joakim    │ Johansson    │ Canada  │
│ 0.99         │ Joakim    │ Johansson    │ Canada  │
│ 1.98         │ Joakim    │ Johansson    │ Canada  │
│ 13.86        │ Joakim    │ Johansson    │ Canada  │
│ 8.91         │ Joakim    │ Johansson    │ Canada  │
│ 0.99         │ Steve     │ Murray       │ Canada  │
│ 1.98         │ Steve     │ Murray       │ Canada  │
│ 13.86        │ Steve     │ Murray       │ Canada  │
│ 8.91         │ Steve     │ Murray       │ Canada  │
│ 1.98         │ Steve     │ Murray       │ Canada  │
│ 3.96         │ Steve     │ Murray       │ Canada  │
│ 5.94         │ Steve     │ Murray       │ Canada  │
│ 1.98         │ Luis      │ Rojas        │ Canada  │
│ 13.86        │ Luis      │ Rojas        │ Canada  │
│ 17.91        │ Luis      │ Rojas        │ Canada  │
│ 1.98         │ Luis      │ Rojas        │ Canada  │
│ 3.96         │ Luis      │ Rojas        │ Canada  │
│ 5.94         │ Luis      │ Rojas        │ Canada  │
│ 0.99         │ Luis      │ Rojas        │ Canada  │
└──────────────┴───────────┴──────────────┴─────────┘
**/
-- ¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?
/**
**/
-- Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.
select InvoiceId, count(InvoiceLineId) as Total from invoice_items where InvoiceId=37;
/**
┌───────────┬───────┐
│ InvoiceId │ Total │
├───────────┼───────┤
│ 37        │ 4     │
└───────────┴───────┘
**/
-- Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura.
select InvoiceId, count(InvoiceLineId) as Total from invoice_items group by InvoiceId;
/**
┌───────────┬───────┐
│ InvoiceId │ Total │
├───────────┼───────┤
│ 1         │ 2     │
│ 2         │ 4     │
│ 3         │ 6     │
│ 4         │ 9     │
│ 5         │ 14    │
│ 6         │ 1     │
│ 7         │ 2     │
│ 8         │ 2     │
│ 9         │ 4     │
│ 10        │ 6     │
│ 11        │ 9     │
│ 12        │ 14    │
│ 13        │ 1     │
│ 14        │ 2     │
│ 15        │ 2     │
│ 16        │ 4     │
│ 17        │ 6     │
│ 18        │ 9     │
│ 19        │ 14    │
│ 20        │ 1     │
│ 21        │ 2     │
│ 22        │ 2     │
│ 23        │ 4     │
│ 24        │ 6     │
│ 25        │ 9     │
│ 26        │ 14    │
│ 27        │ 1     │
│ 28        │ 2     │
│ 29        │ 2     │
│ 30        │ 4     │
│ 31        │ 6     │
│ 32        │ 9     │
│ 33        │ 14    │
│ 34        │ 1     │
│ 35        │ 2     │
│ 36        │ 2     │
│ 37        │ 4     │
│ 38        │ 6     │
│ 39        │ 9     │
│ 40        │ 14    │
│ 41        │ 1     │
│ 42        │ 2     │
│ 43        │ 2     │
│ 44        │ 4     │
│ 45        │ 6     │
│ 46        │ 9     │
│ 47        │ 14    │
│ 48        │ 1     │
│ 49        │ 2     │
│ 50        │ 2     │
│ 51        │ 4     │
│ 52        │ 6     │
│ 53        │ 9     │
│ 54        │ 14    │
│ 55        │ 1     │
│ 56        │ 2     │
│ 57        │ 2     │
│ 58        │ 4     │
│ 59        │ 6     │
│ 60        │ 9     │
│ 61        │ 14    │
│ 62        │ 1     │
│ 63        │ 2     │
│ 64        │ 2     │
│ 65        │ 4     │
│ 66        │ 6     │
│ 67        │ 9     │
│ 68        │ 14    │
│ 69        │ 1     │
│ 70        │ 2     │
│ 71        │ 2     │
│ 72        │ 4     │
│ 73        │ 6     │
│ 74        │ 9     │
│ 75        │ 14    │
│ 76        │ 1     │
│ 77        │ 2     │
│ 78        │ 2     │
│ 79        │ 4     │
│ 80        │ 6     │
│ 81        │ 9     │
│ 82        │ 14    │
│ 83        │ 1     │
│ 84        │ 2     │
│ 85        │ 2     │
│ 86        │ 4     │
│ 87        │ 6     │
│ 88        │ 9     │
│ 89        │ 14    │
│ 90        │ 1     │
│ 91        │ 2     │
│ 92        │ 2     │
│ 93        │ 4     │
│ 94        │ 6     │
│ 95        │ 9     │
│ 96        │ 14    │
│ 97        │ 1     │
│ 98        │ 2     │
│ 99        │ 2     │
│ 100       │ 4     │
│ 101       │ 6     │
│ 102       │ 9     │
│ 103       │ 14    │
│ 104       │ 1     │
│ 105       │ 2     │
│ 106       │ 2     │
│ 107       │ 4     │
│ 108       │ 6     │
│ 109       │ 9     │
│ 110       │ 14    │
│ 111       │ 1     │
│ 112       │ 2     │
│ 113       │ 2     │
│ 114       │ 4     │
│ 115       │ 6     │
│ 116       │ 9     │
│ 117       │ 14    │
│ 118       │ 1     │
│ 119       │ 2     │
│ 120       │ 2     │
│ 121       │ 4     │
│ 122       │ 6     │
│ 123       │ 9     │
│ 124       │ 14    │
│ 125       │ 1     │
│ 126       │ 2     │
│ 127       │ 2     │
│ 128       │ 4     │
│ 129       │ 6     │
│ 130       │ 9     │
│ 131       │ 14    │
│ 132       │ 1     │
│ 133       │ 2     │
│ 134       │ 2     │
│ 135       │ 4     │
│ 136       │ 6     │
│ 137       │ 9     │
│ 138       │ 14    │
│ 139       │ 1     │
│ 140       │ 2     │
│ 141       │ 2     │
│ 142       │ 4     │
│ 143       │ 6     │
│ 144       │ 9     │
│ 145       │ 14    │
│ 146       │ 1     │
│ 147       │ 2     │
│ 148       │ 2     │
│ 149       │ 4     │
│ 150       │ 6     │
│ 151       │ 9     │
│ 152       │ 14    │
│ 153       │ 1     │
│ 154       │ 2     │
│ 155       │ 2     │
│ 156       │ 4     │
│ 157       │ 6     │
│ 158       │ 9     │
│ 159       │ 14    │
│ 160       │ 1     │
│ 161       │ 2     │
│ 162       │ 2     │
│ 163       │ 4     │
│ 164       │ 6     │
│ 165       │ 9     │
│ 166       │ 14    │
│ 167       │ 1     │
│ 168       │ 2     │
│ 169       │ 2     │
│ 170       │ 4     │
│ 171       │ 6     │
│ 172       │ 9     │
│ 173       │ 14    │
│ 174       │ 1     │
│ 175       │ 2     │
│ 176       │ 2     │
│ 177       │ 4     │
│ 178       │ 6     │
│ 179       │ 9     │
│ 180       │ 14    │
│ 181       │ 1     │
│ 182       │ 2     │
│ 183       │ 2     │
│ 184       │ 4     │
│ 185       │ 6     │
│ 186       │ 9     │
│ 187       │ 14    │
│ 188       │ 1     │
│ 189       │ 2     │
│ 190       │ 2     │
│ 191       │ 4     │
│ 192       │ 6     │
│ 193       │ 9     │
│ 194       │ 14    │
│ 195       │ 1     │
│ 196       │ 2     │
│ 197       │ 2     │
│ 198       │ 4     │
│ 199       │ 6     │
│ 200       │ 9     │
│ 201       │ 14    │
│ 202       │ 1     │
│ 203       │ 2     │
│ 204       │ 2     │
│ 205       │ 4     │
│ 206       │ 6     │
│ 207       │ 9     │
│ 208       │ 14    │
│ 209       │ 1     │
│ 210       │ 2     │
│ 211       │ 2     │
│ 212       │ 4     │
│ 213       │ 6     │
│ 214       │ 9     │
│ 215       │ 14    │
│ 216       │ 1     │
│ 217       │ 2     │
│ 218       │ 2     │
│ 219       │ 4     │
│ 220       │ 6     │
│ 221       │ 9     │
│ 222       │ 14    │
│ 223       │ 1     │
│ 224       │ 2     │
│ 225       │ 2     │
│ 226       │ 4     │
│ 227       │ 6     │
│ 228       │ 9     │
│ 229       │ 14    │
│ 230       │ 1     │
│ 231       │ 2     │
│ 232       │ 2     │
│ 233       │ 4     │
│ 234       │ 6     │
│ 235       │ 9     │
│ 236       │ 14    │
│ 237       │ 1     │
│ 238       │ 2     │
│ 239       │ 2     │
│ 240       │ 4     │
│ 241       │ 6     │
│ 242       │ 9     │
│ 243       │ 14    │
│ 244       │ 1     │
│ 245       │ 2     │
│ 246       │ 2     │
│ 247       │ 4     │
│ 248       │ 6     │
│ 249       │ 9     │
│ 250       │ 14    │
│ 251       │ 1     │
│ 252       │ 2     │
│ 253       │ 2     │
│ 254       │ 4     │
│ 255       │ 6     │
│ 256       │ 9     │
│ 257       │ 14    │
│ 258       │ 1     │
│ 259       │ 2     │
│ 260       │ 2     │
│ 261       │ 4     │
│ 262       │ 6     │
│ 263       │ 9     │
│ 264       │ 14    │
│ 265       │ 1     │
│ 266       │ 2     │
│ 267       │ 2     │
│ 268       │ 4     │
│ 269       │ 6     │
│ 270       │ 9     │
│ 271       │ 14    │
│ 272       │ 1     │
│ 273       │ 2     │
│ 274       │ 2     │
│ 275       │ 4     │
│ 276       │ 6     │
│ 277       │ 9     │
│ 278       │ 14    │
│ 279       │ 1     │
│ 280       │ 2     │
│ 281       │ 2     │
│ 282       │ 4     │
│ 283       │ 6     │
│ 284       │ 9     │
│ 285       │ 14    │
│ 286       │ 1     │
│ 287       │ 2     │
│ 288       │ 2     │
│ 289       │ 4     │
│ 290       │ 6     │
│ 291       │ 9     │
│ 292       │ 14    │
│ 293       │ 1     │
│ 294       │ 2     │
│ 295       │ 2     │
│ 296       │ 4     │
│ 297       │ 6     │
│ 298       │ 9     │
│ 299       │ 14    │
│ 300       │ 1     │
│ 301       │ 2     │
│ 302       │ 2     │
│ 303       │ 4     │
│ 304       │ 6     │
│ 305       │ 9     │
│ 306       │ 14    │
│ 307       │ 1     │
│ 308       │ 2     │
│ 309       │ 2     │
│ 310       │ 4     │
│ 311       │ 6     │
│ 312       │ 9     │
│ 313       │ 14    │
│ 314       │ 1     │
│ 315       │ 2     │
│ 316       │ 2     │
│ 317       │ 4     │
│ 318       │ 6     │
│ 319       │ 9     │
│ 320       │ 14    │
│ 321       │ 1     │
│ 322       │ 2     │
│ 323       │ 2     │
│ 324       │ 4     │
│ 325       │ 6     │
│ 326       │ 9     │
│ 327       │ 14    │
│ 328       │ 1     │
│ 329       │ 2     │
│ 330       │ 2     │
│ 331       │ 4     │
│ 332       │ 6     │
│ 333       │ 9     │
│ 334       │ 14    │
│ 335       │ 1     │
│ 336       │ 2     │
│ 337       │ 2     │
│ 338       │ 4     │
│ 339       │ 6     │
│ 340       │ 9     │
│ 341       │ 14    │
│ 342       │ 1     │
│ 343       │ 2     │
│ 344       │ 2     │
│ 345       │ 4     │
│ 346       │ 6     │
│ 347       │ 9     │
│ 348       │ 14    │
│ 349       │ 1     │
│ 350       │ 2     │
│ 351       │ 2     │
│ 352       │ 4     │
│ 353       │ 6     │
│ 354       │ 9     │
│ 355       │ 14    │
│ 356       │ 1     │
│ 357       │ 2     │
│ 358       │ 2     │
│ 359       │ 4     │
│ 360       │ 6     │
│ 361       │ 9     │
│ 362       │ 14    │
│ 363       │ 1     │
│ 364       │ 2     │
│ 365       │ 2     │
│ 366       │ 4     │
│ 367       │ 6     │
│ 368       │ 9     │
│ 369       │ 14    │
│ 370       │ 1     │
│ 371       │ 2     │
│ 372       │ 2     │
│ 373       │ 4     │
│ 374       │ 6     │
│ 375       │ 9     │
│ 376       │ 14    │
│ 377       │ 1     │
│ 378       │ 2     │
│ 379       │ 2     │
│ 380       │ 4     │
│ 381       │ 6     │
│ 382       │ 9     │
│ 383       │ 14    │
│ 384       │ 1     │
│ 385       │ 2     │
│ 386       │ 2     │
│ 387       │ 4     │
│ 388       │ 6     │
│ 389       │ 9     │
│ 390       │ 14    │
│ 391       │ 1     │
│ 392       │ 2     │
│ 393       │ 2     │
│ 394       │ 4     │
│ 395       │ 6     │
│ 396       │ 9     │
│ 397       │ 14    │
│ 398       │ 1     │
│ 399       │ 2     │
│ 400       │ 2     │
│ 401       │ 4     │
│ 402       │ 6     │
│ 403       │ 9     │
│ 404       │ 14    │
│ 405       │ 1     │
│ 406       │ 2     │
│ 407       │ 2     │
│ 408       │ 4     │
│ 409       │ 6     │
│ 410       │ 9     │
│ 411       │ 14    │
│ 412       │ 1     │
└───────────┴───────┘
**/
-- Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.
select tr.Name, i_i.InvoiceLineId from tracks as tr, invoice_items as i_i where i_i.trackid=tr.trackid; -- con Where
select tr.Name, i_i.InvoiceLineId from tracks as tr join invoice_items as i_i on i_i.trackid=tr.trackid; -- con Join
/**
┌──────────────────────────────────────────────────────────────┬───────────────┐
│                             Name                             │ InvoiceLineId │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ For Those About To Rock (We Salute You)                      │ 579           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Balls to the Wall                                            │ 1             │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Balls to the Wall                                            │ 1154          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fast As a Shark                                              │ 1728          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Restless and Wild                                            │ 2             │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Princess of the Dawn                                         │ 580           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Put The Finger On You                                        │ 3             │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Inject The Venom                                             │ 4             │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Inject The Venom                                             │ 1155          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Snowballed                                                   │ 581           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Snowballed                                                   │ 1729          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Evil Walks                                                   │ 5             │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Breaking The Rules                                           │ 6             │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Night Of The Long Knives                                     │ 582           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Spellbound                                                   │ 1156          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Go Down                                                      │ 1730          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dog Eat Dog                                                  │ 7             │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Problem Child                                                │ 583           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Overdose                                                     │ 8             │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Overdose                                                     │ 1157          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hell Ain't A Bad Place To Be                                 │ 1731          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love In An Elevator                                          │ 9             │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rag Doll                                                     │ 584           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ What It Takes                                                │ 1158          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Janie's Got A Gun                                            │ 10            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Amazing                                                      │ 1732          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blind Man                                                    │ 585           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Deuces Are Wild                                              │ 11            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Deuces Are Wild                                              │ 1159          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Angel                                                        │ 12            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Livin' On The Edge                                           │ 586           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All I Really Want                                            │ 1160          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Oughta Know                                              │ 1733          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Right Through You                                            │ 13            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Forgiven                                                     │ 587           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Learn                                                    │ 1161          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Not The Doctor                                               │ 14            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Not The Doctor                                               │ 1734          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wake Up                                                      │ 588           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sea Of Sorrow                                                │ 1162          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bleed The Freak                                              │ 15            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Can't Remember                                             │ 589           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It Ain't Like That                                           │ 1735          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Confusion                                                    │ 16            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Know Somethin (Bout You)                                   │ 590           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Real Thing                                                   │ 1163          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Por Causa De Você                                            │ 17            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Por Causa De Você                                            │ 1736          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ligia                                                        │ 591           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Falando De Amor                                              │ 1164          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Angela                                                       │ 18            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Boto (Bôto)                                                │ 1737          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Canta, Canta Mais                                            │ 592           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Master Of Puppets                                            │ 19            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Unforgiven                                               │ 1165          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Welcome Home (Sanitarium)                                    │ 20            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Welcome Home (Sanitarium)                                    │ 1738          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cochise                                                      │ 593           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Like a Stone                                                 │ 1166          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Set It Off                                                   │ 21            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Exploder                                                     │ 1739          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hypnotize                                                    │ 594           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Last Remaining Light                                     │ 1167          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Your Time Has Come                                           │ 22            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Doesn't Remind Me                                            │ 1740          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Drown Me Slowly                                              │ 595           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Yesterday To Tomorrow                                        │ 1168          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dandelion                                                    │ 23            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Money                                                        │ 1741          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Long Tall Sally                                              │ 596           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ C'Mon Everybody                                              │ 1169          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock 'N' Roll Music                                          │ 24            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Carol                                                        │ 1742          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Good Golly Miss Molly                                        │ 597           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Spanish moss-"A sound portrait"-Spanish moss                 │ 1170          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Moon germs                                                   │ 25            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Solo-Panhandler                                              │ 1743          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Do what cha wanna                                            │ 598           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All For You                                                  │ 1171          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Super Terrorizer                                             │ 26            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bored To Tears                                               │ 1744          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A.N.D.R.O.T.A.Z.                                             │ 599           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Begining... At Last                                      │ 1172          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heart Of Gold                                                │ 27            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blood In The Wall                                            │ 1745          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Beginning...At Last                                      │ 600           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ N.I.B.                                                       │ 1173          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Evil Woman                                                   │ 28            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tomorrow's Dream                                             │ 601           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Snowblind                                                    │ 1174          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Snowblind                                                    │ 1746          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cornucopia                                                   │ 29            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cornucopia                                                   │ 1747          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Laguna Sunrise                                               │ 1748          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Under The Sun/Every Day Comes and Goes                       │ 1749          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Smoked Pork                                                  │ 602           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Body Count's In The House                                    │ 1750          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Body Count                                                   │ 1751          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Statistic                                                  │ 1175          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bowels Of The Devil                                          │ 30            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bowels Of The Devil                                          │ 1752          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ KKK Bitch                                                    │ 1753          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Voodoo                                                       │ 603           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Voodoo                                                       │ 1754          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Evil Dick                                                    │ 1755          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Body Count Anthem                                            │ 31            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ King In Crimson                                              │ 1756          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Chemical Wedding                                             │ 604           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Chemical Wedding                                             │ 1176          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Tower                                                    │ 1177          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Killing Floor                                                │ 1178          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Book Of Thel                                                 │ 1757          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gates Of Urizen                                              │ 1179          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jerusalem                                                    │ 32            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Trupets Of Jericho                                           │ 1180          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Machine Men                                                  │ 1758          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Alchemist                                                │ 1181          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Realword                                                     │ 605           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ First Time I Met The Blues                                   │ 1182          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Let Me Love You Baby                                         │ 1759          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stone Crazy                                                  │ 1183          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When My Left Eye Jumps                                       │ 33            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When My Left Eye Jumps                                       │ 1184          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Leave My Girl Alone                                          │ 1760          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ My Time After Awhile                                         │ 1185          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jorge Da Capadócia                                           │ 1761          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Prenda Minha                                                 │ 1186          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meditação                                                    │ 34            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meditação                                                    │ 606           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Terra                                                        │ 607           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eclipse Oculto                                               │ 608           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Texto "Verdade Tropical"                                     │ 1187          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bem Devagar                                                  │ 609           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bem Devagar                                                  │ 1762          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Saudosismo                                                   │ 610           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Carolina                                                     │ 1188          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sozinho                                                      │ 611           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Esse Cara                                                    │ 35            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mel                                                          │ 612           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mel                                                          │ 1763          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Linha Do Equador                                             │ 1189          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Odara                                                        │ 613           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Atrás Da Verd-E-Rosa Só Não Vai Quem Já Morreu               │ 614           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vida Boa                                                     │ 1190          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sozinho (Hitmakers Classic Mix)                              │ 1764          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sozinho (Caêdrum 'n' Bass)                                   │ 615           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vai Passar                                                   │ 1191          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba De Orly                                                │ 616           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba De Orly                                                │ 1765          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bye, Bye Brasil                                              │ 36            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Atras Da Porta                                               │ 37            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tatuagem                                                     │ 38            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Que Será (À Flor Da Terra)                                 │ 617           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Morena De Angola                                             │ 39            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Morena De Angola                                             │ 1192          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Apesar De Você                                               │ 1766          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Banda                                                      │ 40            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Minha Historia                                               │ 618           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Com Açúcar E Com Afeto                                       │ 41            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meu Caro Amigo                                               │ 42            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meu Caro Amigo                                               │ 1193          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Geni E O Zepelim                                             │ 619           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Geni E O Zepelim                                             │ 1767          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Trocando Em Miúdos                                           │ 43            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gota D'água                                                  │ 44            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Construção / Deus Lhe Pague                                  │ 620           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mateus Enter                                                 │ 1194          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Cidadão Do Mundo                                           │ 1768          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Etnia                                                        │ 45            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Passeio No Mundo Livre                                    │ 621           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba Do Lado                                                │ 46            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba Do Lado                                                │ 1195          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maracatu Atômico                                             │ 1769          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sobremesa                                                    │ 47            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Manguetown                                                   │ 622           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Satélite Na Cabeça                                        │ 1196          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sangue De Bairro                                             │ 48            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Interlude Zumbi                                              │ 1770          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Criança De Domingo                                           │ 623           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Amor De Muito                                                │ 49            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Amor De Muito                                                │ 1197          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maracatu Atômico [Trip Hop]                                  │ 50            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Banditismo Por Uma Questa                                    │ 624           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Banditismo Por Uma Questa                                    │ 1198          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rios Pontes & Overdrives                                     │ 1771          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba Makossa                                                │ 51            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Da Lama Ao Caos                                              │ 625           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maracatu De Tiro Certeiro                                    │ 1199          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lixo Do Mangue                                               │ 52            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lixo Do Mangue                                               │ 1772          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Computadores Fazem Arte                                      │ 626           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Soldado Da Paz                                               │ 1200          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Firmamento                                                   │ 53            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Extra                                                        │ 627           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Podes Crer                                                   │ 1773          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Já Foi                                                       │ 54            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Onde Você Mora?                                              │ 628           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pensamento                                                   │ 1201          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Cor Do Sol                                                 │ 55            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Cor Do Sol                                                 │ 1774          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Onde Você Mora?                                              │ 629           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Falar A Verdade                                              │ 1202          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Firmamento                                                   │ 56            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Doutor                                                       │ 1775          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Na Frente Da TV                                              │ 630           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sábado A Noite                                               │ 57            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eu Também Quero Beijar                                       │ 1203          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Linha Do Equador                                             │ 58            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Linha Do Equador                                             │ 1776          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Amor Demais                                                  │ 631           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Felicidade Urgente                                           │ 1204          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Livre Pra Viver                                              │ 59            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ TriboTchan                                                   │ 1777          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tapa Aqui, Descobre Ali                                      │ 632           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Levada do Amor (Ailoviu)                                     │ 1205          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lavadeira                                                    │ 60            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Reggae Tchan                                                 │ 1778          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ My Love                                                      │ 633           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Communication Breakdown                                      │ 1206          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dazed and Confused                                           │ 61            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Communication Breakdown(2)                                   │ 1779          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Travelling Riverside Blues                                   │ 634           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Can't Quit You Baby(2)                                     │ 1207          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Shook Me(2)                                              │ 62            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Carolina Hard-Core Ecstasy                                   │ 1780          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sam With The Showing Scalp Flat Top                          │ 635           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Advance Romance                                              │ 1208          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Man With The Woman Head                                      │ 63            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ X-9 2001                                                     │ 1781          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gavioes 2001                                                 │ 636           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Camisa Verde 2001                                            │ 1209          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Leandro De Itaquera 2001                                     │ 64            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ipiranga 2001                                                │ 1782          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Morro Da Casa Verde 2001                                     │ 637           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mas Que Nada                                                 │ 1210          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vôo Sobre o Horizonte                                        │ 65            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Água de Beber                                                │ 1783          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba da Bençaco                                             │ 638           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mistério da Raça                                             │ 1211          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All Star                                                     │ 66            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maria Fumaça                                                 │ 639           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tarde Em Itapoã                                              │ 1212          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tarde Em Itapoã                                              │ 1784          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tanto Tempo                                                  │ 67            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tanto Tempo                                                  │ 1785          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eu Vim Da Bahia - Live                                       │ 1786          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Linha Do Horizonte                                           │ 1787          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Only A Dream In Rio                                          │ 640           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Abrir A Porta                                                │ 1788          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Momentos Que Marcam                                          │ 1789          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Jantar Pra Dois                                           │ 1213          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bumbo Da Mangueira                                           │ 68            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bumbo Da Mangueira                                           │ 1790          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Santo Antonio                                                │ 1791          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Só Tinha De Ser Com Você                                     │ 641           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Só Tinha De Ser Com Você                                     │ 1792          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Turn The Page                                                │ 1793          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Die Die My Darling                                           │ 69            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Astronomy                                                    │ 1794          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whiskey In The Jar                                           │ 642           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whiskey In The Jar                                           │ 1214          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tuesday's Gone                                               │ 1215          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The More I See                                               │ 1216          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Kind Of Magic                                              │ 1795          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Under Pressure                                               │ 1217          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Radio GA GA                                                  │ 70            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Want It All                                                │ 1218          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Want To Break Free                                         │ 1796          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Innuendo                                                     │ 1219          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It's A Hard Life                                             │ 643           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Breakthru                                                    │ 1220          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Who Wants To Live Forever                                    │ 1797          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Headlong                                                     │ 1221          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I'm Going Slightly Mad                                       │ 71            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I'm Going Slightly Mad                                       │ 1222          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Invisible Man                                            │ 1798          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Show Must Go On                                          │ 1223          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Diamond                                                │ 1799          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hard Luck Woman                                              │ 1224          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sure Know Something                                          │ 72            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sure Know Something                                          │ 644           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Gun                                                     │ 645           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Deuce                                                        │ 646           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Goin' Blind                                                  │ 1225          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shock Me                                                     │ 647           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shock Me                                                     │ 1800          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ She                                                          │ 648           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Was Made For Loving You                                    │ 1226          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shout It Out Loud                                            │ 649           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ God Of Thunder                                               │ 73            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Calling Dr. Love                                             │ 650           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Calling Dr. Love                                             │ 1801          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Beth                                                         │ 1227          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Strutter                                                     │ 651           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cold Gin                                                     │ 652           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Plaster Caster                                               │ 1228          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ God Gave Rock 'n' Roll To You                                │ 1802          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ De La Luz                                                    │ 653           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Playtime                                                     │ 1229          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Surrender                                                    │ 654           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Surrender                                                    │ 1803          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Valentino's                                                  │ 74            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Believe                                                      │ 75            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ As We Sleep                                                  │ 76            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When Evening Falls                                           │ 655           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ J Squared                                                    │ 77            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ J Squared                                                    │ 1230          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Best Thing                                                   │ 1804          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maria                                                        │ 78            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Poprocks And Coke                                            │ 656           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Longview                                                     │ 79            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Basket Case                                                  │ 80            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Basket Case                                                  │ 1231          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When I Come Around                                           │ 657           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When I Come Around                                           │ 1805          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ She                                                          │ 81            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Geek Stink Breath                                            │ 82            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Brain Stew                                                   │ 658           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jaded                                                        │ 1232          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walking Contradiction                                        │ 1806          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stuck With Me                                                │ 83            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Redundant                                                    │ 659           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nice Guys Finish Last                                        │ 84            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nice Guys Finish Last                                        │ 1233          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Minority                                                     │ 1807          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Macy's Day Parade                                            │ 85            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Into The Light                                               │ 660           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ River Song                                                   │ 1234          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't You Cry                                                │ 86            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Slave                                                        │ 1808          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cry For Love                                                 │ 661           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Living On Love                                               │ 87            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Living On Love                                               │ 1235          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wherever You May Go                                          │ 88            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Grito De Alerta                                              │ 662           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Não Dá Mais Pra Segurar (Explode Coração)                    │ 1236          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Começaria Tudo Outra Vez                                     │ 1809          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Diga Lá, Coração                                             │ 89            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lindo Lago Do Amor                                           │ 663           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eu Apenas Queria Que Voçê Soubesse                           │ 1237          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Comportamento Geral                                          │ 90            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Comportamento Geral                                          │ 1810          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ponto De Interrogação                                        │ 664           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Indio                                                     │ 1238          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Podres Poderes                                               │ 91            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Voce Nao Entende Nada - Cotidiano                            │ 665           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Menino Do Rio                                                │ 1811          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Queixa                                                       │ 92            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Leaozinho                                                  │ 666           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fora Da Ordem                                                │ 1239          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ando Meio Desligado                                          │ 93            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ando Meio Desligado                                          │ 1812          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Top Top                                                      │ 667           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Chão De Estrelas                                             │ 1240          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vida De Cachorro                                             │ 94            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rita Lee                                                     │ 1813          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Posso Perder Minha Mulher, Minha Mãe, Desde Que Eu Tenha O R │ 668           │
│ ock And Roll                                                 │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meu Refrigerador Não Funciona                                │ 95            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stormbringer                                                 │ 1241          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Smoke On The Water                                           │ 96            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Smoke On The Water                                           │ 1814          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Fool No One                                              │ 669           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Houses Of The Holy                                           │ 1242          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Trampled Under Foot                                          │ 97            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Beija-Flor                                                   │ 1815          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Viradouro                                                    │ 670           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mangueira                                                    │ 1243          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ União Da Ilha                                                │ 98            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Caprichosos                                                  │ 1816          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tradição                                                     │ 671           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Of My Life                                              │ 1244          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Put Your Lights On                                           │ 99            │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Do You Like The Way                                          │ 1817          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maria Maria                                                  │ 672           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ El Farol                                                     │ 1245          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Primavera                                                    │ 100           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Manuel                                                       │ 1818          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Entre E Ouça                                                 │ 673           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Love                                                      │ 1246          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Seis Da Tarde                                                │ 101           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Do You Have Other Loves?                                     │ 1819          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Agora Que O Dia Acordou                                      │ 674           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jeru                                                         │ 1247          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Compulsion                                                   │ 102           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 'Round Midnight                                              │ 1820          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bye Bye Blackbird                                            │ 675           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ So What                                                      │ 1248          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Pan Piper                                                │ 103           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ E.S.P.                                                       │ 1821          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nefertiti                                                    │ 676           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Satin                                                  │ 1249          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jean Pierre (Live)                                           │ 104           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Going Down / Highway Star                                    │ 677           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blue Rythm Fantasy                                           │ 1250          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blue Rythm Fantasy                                           │ 1822          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Drum Boogie                                                  │ 105           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Drum Boogie                                                  │ 1823          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Let Me Off Uptown                                            │ 1824          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Opus No.1                                                    │ 1825          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Boogie Blues                                                 │ 678           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ How High The Moon                                            │ 1826          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Up An' Atom                                                  │ 1827          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bop Boogie                                                   │ 1251          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lemon Drop                                                   │ 106           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lemon Drop                                                   │ 1828          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Overtime                                                     │ 1829          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Take Your Love From Me                                 │ 679           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Take Your Love From Me                                 │ 1830          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jungle Drums                                                 │ 1831          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Showcase                                                     │ 107           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pot-Pourri N.º 4                                             │ 1832          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Onde Anda Você                                               │ 680           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Onde Anda Você                                               │ 1252          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba Da Volta                                               │ 1253          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Canto De Ossanha                                             │ 1254          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pot-Pourri N.º 5                                             │ 1833          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Formosa                                                      │ 1255          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Como É Duro Trabalhar                                        │ 108           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Minha Namorada                                               │ 1256          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Por Que Será                                                 │ 1834          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Berimbau                                                     │ 1257          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Deixa                                                        │ 681           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pot-Pourri N.º 2                                             │ 1258          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba Em Prelúdio                                            │ 1835          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Carta Ao Tom 74                                              │ 1259          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pela Luz dos Olhos Teus (Miúcha e Tom Jobim)                 │ 109           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pela Luz dos Olhos Teus (Miúcha e Tom Jobim)                 │ 1260          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Chão de Giz (Elba Ramalho)                                   │ 1836          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Coração do Agreste (Fafá de Belém)                           │ 1261          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Caçador de Mim (Sá & Guarabyra)                              │ 1837          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Romaria (Renato Teixeira)                                    │ 1262          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ As Rosas Não Falam (Beth Carvalho)                           │ 110           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ As Rosas Não Falam (Beth Carvalho)                           │ 682           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wave (Os Cariocas)                                           │ 683           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Garota de Ipanema (Dick Farney)                              │ 684           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Preciso Apender a Viver Só (Maysa)                           │ 1263          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Susie Q                                                      │ 685           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Susie Q                                                      │ 1838          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Proud Mary                                                   │ 686           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bad Moon Rising                                              │ 1264          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lodi                                                         │ 687           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Green River                                                  │ 111           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Commotion                                                    │ 688           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Commotion                                                    │ 1839          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Down On The Corner                                           │ 1265          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fortunate Son                                                │ 689           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Who'll Stop The Rain                                         │ 690           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Up Around The Bend                                           │ 1266          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Run Through The Jungle                                       │ 1840          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Long As I Can See The Light                                  │ 691           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hey Tonight                                                  │ 1267          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sweet Hitch-Hiker                                            │ 692           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sweet Hitch-Hiker                                            │ 1841          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Someday Never Comes                                          │ 112           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walking On The Water                                         │ 113           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Suzie-Q, Pt. 2                                               │ 114           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Born On The Bayou                                            │ 693           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Good Golly Miss Molly                                        │ 115           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Good Golly Miss Molly                                        │ 1268          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tombstone Shadow                                             │ 1842          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wrote A Song For Everyone                                    │ 116           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Night Time Is The Right Time                                 │ 694           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cotton Fields                                                │ 117           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Look Now                                               │ 118           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Look Now                                               │ 1269          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Midnight Special                                         │ 695           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Midnight Special                                         │ 1843          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Before You Accuse Me                                         │ 119           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pagan Baby                                                   │ 120           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ (Wish I Could) Hideaway                                      │ 696           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It's Just A Thought                                          │ 1270          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Molina                                                       │ 1844          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Born To Move                                                 │ 121           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gatas Extraordinárias                                        │ 697           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Brasil                                                       │ 122           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Brasil                                                       │ 1271          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eu Sou Neguinha (Ao Vivo)                                    │ 1845          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Coroné Antonio Bento                                         │ 123           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Você Passa, Eu Acho Graça (Ao Vivo)                          │ 698           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meu Mundo Fica Completo (Com Você)                           │ 1272          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Música Urbana 2                                              │ 124           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Palavras Ao Vento                                            │ 1846          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Não Sei O Que Eu Quero Da Vida                               │ 699           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Woman Is The Nigger Of The World (Ao Vivo)                   │ 125           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Woman Is The Nigger Of The World (Ao Vivo)                   │ 1273          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Smells Like Teen Spirit (Ao Vivo)                            │ 126           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ E.C.T.                                                       │ 700           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Todo Amor Que Houver Nesta Vida                              │ 1274          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Metrô. Linha 743                                             │ 1847          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Admirável Gado Novo                                          │ 127           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eleanor Rigby                                                │ 701           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Socorro                                                      │ 1275          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mis Penas Lloraba Yo (Ao Vivo) Soy Gitano (Tangos)           │ 128           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mis Penas Lloraba Yo (Ao Vivo) Soy Gitano (Tangos)           │ 1848          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Comin' Home                                                  │ 702           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Need Love                                                  │ 1276          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Drifter                                                      │ 129           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Child                                                   │ 703           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Keep On Moving                                           │ 1849          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Child In Time                                                │ 130           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Flight Of The Rat                                            │ 704           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Into The Fire                                                │ 1277          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No No No                                                     │ 131           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No No No                                                     │ 1850          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Strange Kind Of Woman                                        │ 705           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No One Came                                                  │ 1278          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Knocking At Your Back Door                                   │ 132           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nobody's Home                                                │ 1851          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Night                                                  │ 706           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Unwritten Law                                            │ 133           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hush                                                         │ 1279          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maybe I'm A Leo                                              │ 134           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maybe I'm A Leo                                              │ 1852          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pictures Of Home                                             │ 707           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Space Truckin'                                               │ 1280          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vavoom : Ted The Mechanic                                    │ 135           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sometimes I Feel Like Screaming                              │ 1853          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cascades : I'm Not Your Lover                                │ 708           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Touch Away                                                 │ 1281          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hey Cisco                                                    │ 136           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ King Of Dreams                                               │ 1854          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Cut Runs Deep                                            │ 709           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Conquers All                                            │ 1282          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fortuneteller                                                │ 137           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stormbringer                                                 │ 1855          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Don't Mean a Thing                                      │ 710           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Can't Do it Right (With the One You Love)                │ 1283          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ High Ball Shooter                                            │ 138           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Battle Rages On                                          │ 1856          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lick It Up                                                   │ 711           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ramshackle Man                                               │ 1284          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Twist In The Tail                                          │ 139           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ One Man's Meat                                               │ 1857          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pour Some Sugar On Me                                        │ 712           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Two Steps Behind [Acoustic Version]                          │ 1285          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Animal                                                       │ 140           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When Love & Hate Collide                                     │ 1858          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Action                                                       │ 713           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock Of Ages                                                 │ 1286          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hysteria                                                     │ 141           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Otay                                                         │ 1859          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Groovus Interruptus                                          │ 714           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Outbreak                                                     │ 1287          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Baltimore, DC                                                │ 142           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cigano                                                       │ 715           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Álibi                                                        │ 1288          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Álibi                                                        │ 1860          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Esquinas                                                     │ 143           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Esquinas                                                     │ 1861          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Se...                                                        │ 1862          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lilás                                                        │ 1863          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Acelerou                                                     │ 716           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Amor Puro                                                 │ 1864          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nem Um Dia                                                   │ 1865          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Oceano                                                       │ 1289          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Açai                                                         │ 144           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Açai                                                         │ 1866          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Flor De Lis                                                  │ 1867          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Azul                                                         │ 717           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Azul                                                         │ 1868          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Acelerou                                                     │ 1869          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Amor Puro                                                 │ 145           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Atrás da Porta                                               │ 1870          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dois Pra Lá, Dois Pra Cá                                     │ 718           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dois Pra Lá, Dois Pra Cá                                     │ 1290          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Casa no Campo                                                │ 1291          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Romaria                                                      │ 1292          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Alô, Alô, Marciano                                           │ 1871          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Me Deixas Louca                                              │ 1293          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fascinação                                                   │ 146           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Saudosa Maloca                                               │ 1294          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ As Aparências Enganam                                        │ 1872          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Madalena                                                     │ 1295          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maria Rosa                                                   │ 719           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Aprendendo A Jogar                                           │ 1296          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Layla                                                        │ 1873          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Badge                                                        │ 1297          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sunshine Of Your Love                                        │ 147           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sunshine Of Your Love                                        │ 1298          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Crossroads                                                   │ 1874          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bell Bottom Blues                                            │ 1299          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ After Midnight                                               │ 1875          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Swing Low Sweet Chariot                                      │ 1300          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lay Down Sally                                               │ 148           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lay Down Sally                                               │ 720           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Knockin On Heavens Door                                      │ 721           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wonderful Tonight                                            │ 722           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Let It Grow                                                  │ 1301          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Promises                                                     │ 723           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Promises                                                     │ 1876          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Signe                                                        │ 724           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Before You Accuse Me                                         │ 1302          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hey Hey                                                      │ 725           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tears In Heaven                                              │ 149           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lonely Stranger                                              │ 726           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lonely Stranger                                              │ 1877          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nobody Knows You When You're Down & Out                      │ 1303          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Layla                                                        │ 727           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walkin' Blues                                                │ 728           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Alberta                                                      │ 1304          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ San Francisco Bay Blues                                      │ 1878          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Old Love                                                     │ 729           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stripsearch                                                  │ 1305          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Last Cup Of Sorrow                                           │ 730           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Last Cup Of Sorrow                                           │ 1879          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Naked In Front Of The Computer                               │ 150           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Helpless                                                     │ 151           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mouth To Mouth                                               │ 152           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ashes To Ashes                                               │ 731           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ She Loves Me Not                                             │ 153           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ She Loves Me Not                                             │ 1306          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Got That Feeling                                             │ 1880          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Paths Of Glory                                               │ 154           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Home Sick Home                                               │ 732           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pristina                                                     │ 155           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Caffeine                                                     │ 156           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Caffeine                                                     │ 1307          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Midlife Crisis                                               │ 733           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Midlife Crisis                                               │ 1881          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ RV                                                           │ 157           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Everything's Ruined                                          │ 158           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Malpractice                                                  │ 734           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Kindergarten                                                 │ 1308          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Be Aggressive                                                │ 1882          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Small Victory                                              │ 159           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Midnight Cowboy                                              │ 735           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Easy                                                         │ 160           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Easy                                                         │ 1309          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get Out                                                      │ 1883          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Gentle Art Of Making Enemies                             │ 161           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Star A.D.                                                    │ 736           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cuckoo For Caca                                              │ 1310          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ugly In The Morning                                          │ 162           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Take This Bottle                                             │ 1884          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ King For A Day                                               │ 737           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ What A Day                                                   │ 163           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ What A Day                                                   │ 1311          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ From Out Of Nowhere                                          │ 164           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Epic                                                         │ 738           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Falling To Pieces                                            │ 1312          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Surprise! You're Dead!                                       │ 1885          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Underwater Love                                              │ 165           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Morning After                                            │ 739           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Woodpecker From Mars                                         │ 1313          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Falamansa Song                                               │ 166           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Falamansa Song                                               │ 1886          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Xote Dos Milagres                                            │ 740           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Zeca Violeiro                                                │ 1314          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Avisa                                                        │ 167           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Principiando/Decolagem                                       │ 741           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Medo De Escuro                                               │ 1887          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Desaforo                                                     │ 168           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ In Your Honor                                                │ 742           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No Way Back                                                  │ 1315          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Last Song                                                │ 169           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Last Song                                                │ 1888          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Free Me                                                      │ 743           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Still                                                        │ 1316          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ What If I Do?                                                │ 170           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Friend Of A Friend                                           │ 1889          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Over And Out                                                 │ 744           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Virginia Moon                                                │ 171           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Razor                                                        │ 1317          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Times Like These                                             │ 172           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Times Like These                                             │ 1890          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Disenchanted Lullaby                                         │ 745           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Overdrive                                                    │ 1318          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Burn Away                                                    │ 173           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Monkey Wrench                                                │ 1891          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hey, Johnny Park!                                            │ 746           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ My Hero                                                      │ 1319          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ See You                                                      │ 174           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Everlong                                                     │ 1892          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walking After You                                            │ 747           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ New York, New York                                           │ 1320          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Get A Kick Out Of You                                      │ 175           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ What Now My Love                                             │ 1893          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Summer Love                                                  │ 748           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ My Kind Of Town                                              │ 1321          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fly Me To The Moon                                           │ 176           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It Was A Very Good Year                                      │ 1894          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Come Fly With Me                                             │ 749           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bad, Bad Leroy Brown                                         │ 1322          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mack The Knife                                               │ 177           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Entrando Na Sua (Intro)                                      │ 1895          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nervosa                                                      │ 750           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Zambação                                                     │ 1323          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Funk Hum                                                     │ 178           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dujji                                                        │ 1896          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meu Guarda-Chuva                                             │ 751           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Divirta-Se (Saindo Da Sua)                                   │ 1324          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Forty Days Instrumental                                      │ 179           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Esperando Na Janela                                          │ 1897          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Juazeiro                                                     │ 752           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Assum Preto                                                  │ 1325          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pau-De-Arara                                                 │ 180           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lamento Sertanejo                                            │ 753           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Is This Love (Live)                                          │ 1326          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Is This Love (Live)                                          │ 1898          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stir It Up (Live)                                            │ 181           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stir It Up (Live)                                            │ 1899          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Refavela (Live)                                              │ 1900          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Quanta (Live)                                                │ 1901          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Estrela (Live)                                               │ 754           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pela Internet (Live)                                         │ 1902          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Opachorô (Live)                                              │ 1903          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Copacabana (Live)                                            │ 1327          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Novidade (Live)                                            │ 182           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Novidade (Live)                                            │ 1904          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ De Ouro E Marfim (Live)                                      │ 1905          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lamento De Carnaval                                          │ 755           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lamento De Carnaval                                          │ 1906          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Refazenda                                                    │ 1907          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Realce                                                       │ 183           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Paz                                                        │ 1908          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Beira Mar                                                    │ 756           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Beira Mar                                                    │ 1328          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sampa                                                        │ 1329          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Parabolicamará                                               │ 1330          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tempo Rei                                                    │ 1909          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Expresso 2222                                                │ 1331          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Aquele Abraço                                                │ 184           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Palco                                                        │ 1332          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Toda Menina Baiana                                           │ 1910          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sítio Do Pica-Pau Amarelo                                    │ 1333          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Straight Out Of Line                                         │ 757           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Faceless                                                     │ 1334          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Changes                                                      │ 1911          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Make Me Believe                                              │ 1335          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Re-Align                                                     │ 185           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Re-Align                                                     │ 1336          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Fucking Hate You                                           │ 1912          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Am                                                         │ 1337          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ American Idiot                                               │ 1913          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jesus Of Suburbia / City Of The Damned / I Don't Care / Dear │ 1338          │
│ ly Beloved / Tales Of Another Broken Home                    │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Holiday                                                      │ 186           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Holiday                                                      │ 758           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Boulevard Of Broken Dreams                                   │ 759           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Are We The Waiting                                           │ 760           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ St. Jimmy                                                    │ 1339          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Give Me Novacaine                                            │ 761           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Give Me Novacaine                                            │ 1914          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Extraordinary Girl                                           │ 762           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Letterbomb                                                   │ 1340          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wake Me Up When September Ends                               │ 763           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Homecoming / The Death Of St. Jimmy / East 12th St. / Nobody │ 187           │
│  Likes You / Rock And Roll Girlfriend / We're Coming Home Ag │               │
│ ain                                                          │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whatsername                                                  │ 764           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whatsername                                                  │ 1915          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Welcome to the Jungle                                        │ 1341          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It's So Easy                                                 │ 765           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Out Ta Get Me                                                │ 766           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mr. Brownstone                                               │ 1342          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Paradise City                                                │ 1916          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Think About You                                              │ 767           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Anything Goes                                                │ 1343          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rocket Queen                                                 │ 768           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rocket Queen                                                 │ 1917          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Right Next Door to Hell                                      │ 188           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dust N' Bones                                                │ 189           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Live and Let Die                                             │ 190           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Cry (Original)                                         │ 769           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Perfect Crime                                                │ 191           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Perfect Crime                                                │ 1344          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Ain't the First                                          │ 1918          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bad Obsession                                                │ 192           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Back off Bitch                                               │ 770           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Double Talkin' Jive                                          │ 193           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Garden                                                   │ 194           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Garden                                                   │ 1345          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Garden of Eden                                               │ 771           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Garden of Eden                                               │ 1919          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Damn Me                                                │ 195           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dead Horse                                                   │ 196           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Coma                                                         │ 772           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Civil War                                                    │ 1346          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 14 Years                                                     │ 1920          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Yesterdays                                                   │ 197           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shotgun Blues                                                │ 773           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Breakdown                                                    │ 198           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Breakdown                                                    │ 1347          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pretty Tied Up                                               │ 1921          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Estranged                                                    │ 199           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Could Be Mine                                            │ 774           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Cry                                                    │ 1348          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Colibri                                                      │ 200           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Magnetic Ocean                                               │ 1922          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Deep Waters                                                  │ 775           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ L'Arc En Ciel De Miles                                       │ 201           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ L'Arc En Ciel De Miles                                       │ 1349          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Millenium                                                    │ 202           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Thinking 'Bout Tomorrow                                      │ 776           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jacob's Ladder                                               │ 1350          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ She Wears Black                                              │ 1923          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ These Colours Don't Run                                      │ 203           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Brighter Than a Thousand Suns                                │ 777           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Pilgrim                                                  │ 1351          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ For the Greater Good of God                                  │ 204           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ For the Greater Good of God                                  │ 1924          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lord of Light                                                │ 778           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Trooper                                                  │ 1352          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Prowler                                                      │ 205           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Transylvania                                                 │ 779           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Where Eagles Dare                                            │ 1925          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Run To The Hilss                                             │ 206           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 2 Minutes To Midnight                                        │ 780           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Iron Maiden                                                  │ 1353          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Can I Play With Madness                                      │ 207           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Can I Play With Madness                                      │ 1926          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wasting Love                                                 │ 781           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bring Your Daughter... To The Slaughter                      │ 1354          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heaven Can Wait                                              │ 208           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Wicker Man                                               │ 1927          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ghost Of The Navigator                                       │ 782           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blood Brothers                                               │ 209           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dream Of Mirrors                                             │ 1355          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Thin Line Between Love & Hate                            │ 210           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Thin Line Between Love & Hate                            │ 1928          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wildest Dreams                                               │ 783           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dance Of Death                                               │ 1356          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gates Of Tomorrow                                            │ 211           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Face In The Sand                                             │ 1929          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Age Of Innocence                                             │ 784           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Afraid To Shoot Strangers                                    │ 1357          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fear Is The Key                                              │ 212           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Fugitive                                                 │ 1930          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Chains Of Misery                                             │ 785           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fear Of The Dark                                             │ 1358          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 01 - Prowler                                                 │ 213           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 04 - Running Free                                            │ 1931          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 05 - Phantom of the Opera                                    │ 786           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 09 - Iron Maiden                                             │ 1359          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Ides Of March                                            │ 214           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Another Life                                                 │ 1932          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Genghis Khan                                                 │ 787           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Purgatory                                                    │ 1360          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Drifter                                                      │ 215           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 2 Minutes To Midnight                                        │ 1933          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Trooper                                                  │ 788           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Powerslave                                                   │ 1361          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Number Of The Beast                                      │ 216           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Run To The Hills                                             │ 1934          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Running Free                                                 │ 789           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Die With Your Boots On                                       │ 1362          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Phantom Of The Opera                                         │ 217           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wrathchild                                                   │ 1935          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ From Here To Eternity                                        │ 790           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Evil That Men Do                                         │ 1363          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Afraid To Shoot Strangers                                    │ 218           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heaven Can Wait                                              │ 791           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hallowed Be Thy Name                                         │ 1364          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hallowed Be Thy Name                                         │ 1936          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Trooper                                                  │ 219           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Trooper                                                  │ 1937          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sanctuary                                                    │ 1938          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tailgunner                                                   │ 1939          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Holy Smoke                                                   │ 792           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No Prayer For The Dying                                      │ 1940          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fates Warning                                                │ 1941          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Assassin                                                 │ 1365          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Run Silent Run Deep                                          │ 220           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Run Silent Run Deep                                          │ 1942          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bring Your Daughter... ...To The Slaughter                   │ 1943          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Where Eagles Dare                                            │ 793           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Where Eagles Dare                                            │ 1944          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Trooper                                                  │ 1945          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Still Life                                                   │ 221           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ To Tame A Land                                               │ 1946          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Aces High                                                    │ 794           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Aces High                                                    │ 1366          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 2 Minutes To Midnight                                        │ 1367          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Losfer Words                                                 │ 1368          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Flash of The Blade                                           │ 1947          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Duelists                                                     │ 1369          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Back in the Village                                          │ 222           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Powerslave                                                   │ 1370          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rime of the Ancient Mariner                                  │ 1948          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Intro                                                        │ 1371          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Wicker Man                                               │ 795           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ghost Of The Navigator                                       │ 1372          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Brave New World                                              │ 1949          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wrathchild                                                   │ 1373          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blood Brothers                                               │ 223           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blood Brothers                                               │ 1374          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sign Of The Cross                                            │ 1950          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dream Of Mirrors                                             │ 1375          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fear Of The Dark                                             │ 1951          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Iron Maiden                                                  │ 1376          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Number Of The Beast                                      │ 224           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Number Of The Beast                                      │ 796           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hallowed Be Thy Name                                         │ 797           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sanctuary                                                    │ 798           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Run To The Hills                                             │ 1377          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Moonchild                                                    │ 799           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Moonchild                                                    │ 1952          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Can I Play With Madness                                      │ 800           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Evil That Men Do                                         │ 1378          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Seventh Son of a Seventh Son                                 │ 801           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Prophecy                                                 │ 225           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Clairvoyant                                              │ 802           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Clairvoyant                                              │ 1953          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Only the Good Die Young                                      │ 1379          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Caught Somewhere in Time                                     │ 803           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sea of Madness                                               │ 804           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heaven Can Wait                                              │ 1380          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stranger in a Strange Land                                   │ 1954          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ De Ja Vu                                                     │ 805           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Children of the Damned                                       │ 1381          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gangland                                                     │ 806           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gangland                                                     │ 1955          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hallowed Be Thy Name                                         │ 226           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Invaders                                                     │ 227           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Run to the Hills                                             │ 228           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Number Of The Beast                                      │ 807           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Prisoner                                                 │ 229           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Prisoner                                                 │ 1382          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sign Of The Cross                                            │ 1956          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lord Of The Flies                                            │ 230           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Man On The Edge                                              │ 808           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fortunes Of War                                              │ 231           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Aftermath                                                │ 232           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Aftermath                                                │ 1383          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Judgement Of Heaven                                          │ 809           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Judgement Of Heaven                                          │ 1957          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blood On The World's Hands                                   │ 233           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 2 A.M.                                                       │ 234           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Unbeliever                                               │ 810           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Futureal                                                     │ 1384          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Angel And The Gambler                                    │ 1958          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lightning Strikes Twice                                      │ 235           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Educated Fool                                            │ 811           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Look To The Eyes Of A Stranger                         │ 236           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Look To The Eyes Of A Stranger                         │ 1385          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Como Estais Amigos                                           │ 1959          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Night Train                                                  │ 237           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Out Of Sight                                                 │ 812           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Papa's Got A Brand New Bag Pt.1                              │ 1386          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It's A Man's Man's Man's World                               │ 238           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Say It Loud, I'm Black And I'm Proud Pt.1                    │ 1960          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get Up (I Feel Like Being A) Sex Machine                     │ 813           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hey America                                                  │ 239           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hey America                                                  │ 1387          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get Up Offa That Thing                                       │ 240           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It's Too Funky In Here                                       │ 814           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Living In America                                            │ 1388          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I'm Real                                                     │ 1961          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When You Gonna Learn (Digeridoo)                             │ 241           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Too Young To Die                                             │ 815           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hooked Up                                                    │ 1389          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whatever It Is, I Just Can't Stop                            │ 242           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whatever It Is, I Just Can't Stop                            │ 1962          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blow Your Mind                                               │ 816           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Planet Home                                                  │ 1390          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Capricorn Day                                          │ 243           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Soul Education                                               │ 817           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Destitute Illusions                                          │ 1963          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Were Do We Go From Here                                      │ 244           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ King For A Day                                               │ 818           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Deeper Underground                                           │ 1391          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Light Years                                                  │ 245           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Light Years                                                  │ 1964          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Manifest Destiny                                             │ 819           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Journey To Arnhemland                                        │ 1392          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Morning Glory                                                │ 246           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Are You Gonna Be My Girl                                     │ 1965          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rollover D.J.                                                │ 820           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get What You Need                                            │ 247           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Radio Song                                                   │ 1393          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Take It Or Leave It                                          │ 248           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Take It Or Leave It                                          │ 1966          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lazy Gun                                                     │ 821           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Red House                                                    │ 1394          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Can You See Me                                               │ 249           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ May This Be Love                                             │ 1967          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fire                                                         │ 822           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hey Joe                                                      │ 1395          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stone Free                                                   │ 250           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Wind Cries Mary                                          │ 1968          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Highway Chile                                                │ 823           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Always With Me, Always With You                              │ 1396          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Satch Boogie                                                 │ 251           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lords of Karma                                               │ 1969          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Midnight                                                     │ 824           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mama Africa                                                  │ 1397          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Salve Simpatia                                               │ 252           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Os Alquimistas Estão Chegando                                │ 1970          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Charles Anjo 45                                              │ 825           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Santa Clara Clareou                                          │ 1398          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Filho Maravilha                                              │ 253           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ As Dores do Mundo                                            │ 1971          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vou Pra Ai                                                   │ 826           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Encontrar Alguém                                             │ 1399          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dance Enquanto é Tempo                                       │ 254           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sem Sentido                                                  │ 1972          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Onibusfobia                                                  │ 827           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No Futuro                                                    │ 1400          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Voce Inteira                                                 │ 255           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Equinocio                                                    │ 1973          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Papelão                                                      │ 828           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cafezinho                                                    │ 1401          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Enquanto O Dia Não Vem                                       │ 256           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hot Rockin'                                                  │ 829           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You've Got Another Thing Comin'                              │ 1402          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You've Got Another Thing Comin'                              │ 1974          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Turbo Lover                                                  │ 257           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Turbo Lover                                                  │ 1975          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Freewheel Burning                                            │ 1976          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Metal Meltdown                                               │ 1977          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ram It Down                                                  │ 830           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Diamonds And Rust (Live)                                     │ 1978          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tyrant (Live)                                                │ 1979          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Comin' Home                                                  │ 1403          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Plaster Caster                                               │ 258           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Plaster Caster                                               │ 1980          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Do You Love Me                                               │ 1981          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sure Know Something                                          │ 831           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sure Know Something                                          │ 1982          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Still Love You                                             │ 1983          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Every Time I Look At You                                     │ 259           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nothin' To Lose                                              │ 1984          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock And Roll All Nite                                       │ 832           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock And Roll All Nite                                       │ 1404          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Immigrant Song                                               │ 1405          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heartbreaker                                                 │ 1406          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Since I've Been Loving You                                   │ 1985          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Dog                                                    │ 1407          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dazed And Confused                                           │ 260           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stairway To Heaven                                           │ 1408          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Going To California                                          │ 1986          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ That's The Way                                               │ 1409          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whole Lotta Love (Medley)                                    │ 833           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Thank You                                                    │ 1410          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ We're Gonna Groove                                           │ 1987          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Poor Tom                                                     │ 1411          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walter's Walk                                                │ 261           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walter's Walk                                                │ 1412          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ozone Baby                                                   │ 1988          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wearing And Tearing                                          │ 1413          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Over The Hills And Far Away                                  │ 1989          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Crunge                                                   │ 1414          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dancing Days                                                 │ 262           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dancing Days                                                 │ 834           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ D'Yer Mak'er                                                 │ 835           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No Quarter                                                   │ 836           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Ocean                                                    │ 1415          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ In The Evening                                               │ 837           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ In The Evening                                               │ 1990          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fool In The Rain                                             │ 838           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hot Dog                                                      │ 1416          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Carouselambra                                                │ 839           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All My Love                                                  │ 263           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I'm Gonna Crawl                                              │ 840           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I'm Gonna Crawl                                              │ 1991          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Dog                                                    │ 1417          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock & Roll                                                  │ 841           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stairway To Heaven                                           │ 842           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Misty Mountain Hop                                           │ 1418          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Four Sticks                                                  │ 1992          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When The Levee Breaks                                        │ 843           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Shook Me                                                 │ 1419          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dazed and Confused                                           │ 844           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dazed and Confused                                           │ 1993          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Your Time Is Gonna Come                                      │ 264           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Mountain Side                                          │ 265           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Communication Breakdown                                      │ 266           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Can't Quit You Baby                                        │ 845           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ How Many More Times                                          │ 267           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ How Many More Times                                          │ 1420          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whole Lotta Love                                             │ 1994          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ What Is And What Should Never Be                             │ 268           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Lemon Song                                               │ 846           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Thank You                                                    │ 269           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Living Loving Maid (She's Just A Woman)                      │ 270           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Living Loving Maid (She's Just A Woman)                      │ 1421          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ramble On                                                    │ 847           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ramble On                                                    │ 1995          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Moby Dick                                                    │ 271           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Immigrant Song                                               │ 272           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Friends                                                      │ 848           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Celebration Day                                              │ 1422          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Since I've Been Loving You                                   │ 1996          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Out On The Tiles                                             │ 273           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ That's The Way                                               │ 849           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bron-Y-Aur Stomp                                             │ 274           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bron-Y-Aur Stomp                                             │ 1423          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hats Off To (Roy) Harper                                     │ 1997          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Down By The Seaside                                          │ 275           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ten Years Gone                                               │ 850           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Night Flight                                                 │ 1424          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Boogie With Stu                                              │ 276           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sick Again                                                   │ 1998          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Achilles Last Stand                                          │ 851           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ For Your Life                                                │ 277           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ For Your Life                                                │ 1425          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hots On For Nowhere                                          │ 278           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tea For One                                                  │ 852           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock & Roll                                                  │ 1426          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Celebration Day                                              │ 1999          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dazed And Confused                                           │ 279           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No Quarter                                                   │ 853           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stairway To Heaven                                           │ 1427          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ L'Avventura                                                  │ 280           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ L'Avventura                                                  │ 2000          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Música De Trabalho                                           │ 854           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Aloha                                                        │ 1428          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Soul Parsifal                                                │ 281           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dezesseis                                                    │ 855           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Leila                                                        │ 2001          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Quando Você Voltar                                           │ 282           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Livro Dos Dias                                             │ 856           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Será                                                         │ 1429          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tempo Perdido                                                │ 283           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tempo Perdido                                                │ 2002          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Indios                                                       │ 857           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pais E Filhos                                                │ 1430          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meninos E Meninas                                            │ 284           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Giz                                                          │ 2003          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dezesseis                                                    │ 858           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Are You Gonna Go My Way                                      │ 285           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock And Roll Is Dead                                        │ 1431          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mr. Cab Driver                                               │ 286           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mr. Cab Driver                                               │ 2004          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ American Woman                                               │ 859           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Belong To You                                              │ 1432          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Believe                                                      │ 287           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Assim Caminha A Humanidade                                   │ 2005          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Honolulu                                                     │ 860           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Casa                                                         │ 1433          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Condição                                                     │ 288           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Satisfação                                                   │ 2006          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Brumário                                                     │ 861           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Cura                                                       │ 1434          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Aquilo                                                       │ 289           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ro-Que-Se-Da-Ne                                              │ 2007          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tudo Bem                                                     │ 862           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sereia                                                       │ 1435          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Assaltaram A Gramática                                       │ 290           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Último Romântico (Ao Vivo)                                 │ 2008          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pseudo Silk Kimono                                           │ 863           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heart Of Lothian: Wide Boy / Curtain Call                    │ 1436          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Waterhole (Expresso Bongo)                                   │ 291           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Childhoods End?                                              │ 2009          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ White Feather                                                │ 864           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cérebro Eletrônico                                           │ 1437          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tempos Modernos                                              │ 292           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Panis Et Circenses                                           │ 2010          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ De Noite Na Cama                                             │ 865           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Menina Dança                                               │ 1438          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dança Da Solidão                                             │ 293           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Segue O Seco                                                 │ 2011          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Xote Das Meninas                                           │ 866           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You've Been A Long Time Coming                               │ 1439          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When I Had Your Love                                         │ 294           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Seek And You Shall Find                                      │ 867           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Abraham, Martin And John                                     │ 1440          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Abraham, Martin And John                                     │ 2012          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Save The Children                                            │ 295           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Save The Children                                            │ 2013          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Sure Love To Ball                                        │ 2014          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Praise                                                       │ 2015          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heavy Love Affair                                            │ 868           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Down Under                                                   │ 2016          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Be Good Johnny                                               │ 2017          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Everything I Need                                            │ 1441          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Down by the Sea                                              │ 296           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Down by the Sea                                              │ 2018          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It's a Mistake                                               │ 2019          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shakes and Ladders                                           │ 869           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shakes and Ladders                                           │ 2020          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Holier Than Thou                                             │ 2021          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Unforgiven                                               │ 297           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Through The Never                                            │ 2022          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nothing Else Matters                                         │ 870           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nothing Else Matters                                         │ 1442          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Of Wolf And Man                                              │ 1443          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The God That Failed                                          │ 1444          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ My Friend Of Misery                                          │ 2023          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Struggle Within                                          │ 1445          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Helpless                                                     │ 298           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Small Hours                                              │ 1446          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Wait                                                     │ 2024          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Crash Course In Brain Surgery                                │ 1447          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Last Caress/Green Hell                                       │ 871           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Am I Evil?                                                   │ 1448          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blitzkrieg                                                   │ 2025          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Breadfan                                                     │ 1449          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stone Cold Crazy                                             │ 299           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stone Cold Crazy                                             │ 1450          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ So What                                                      │ 2026          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Damage Case                                                  │ 1451          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hit The Lights                                               │ 2027          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Four Horsemen                                            │ 1452          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Motorbreath                                                  │ 300           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Motorbreath                                                  │ 872           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jump In The Fire                                             │ 873           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ (Anesthesia) Pulling Teeth                                   │ 874           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whiplash                                                     │ 1453          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Phantom Lord                                                 │ 875           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Phantom Lord                                                 │ 2028          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Seek & Destroy                                               │ 876           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Metal Militia                                                │ 1454          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ain't My Bitch                                               │ 877           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 2 X 4                                                        │ 301           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The House Jack Built                                         │ 878           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The House Jack Built                                         │ 2029          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Until It Sleeps                                              │ 1455          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ King Nothing                                                 │ 879           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bleeding Me                                                  │ 880           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cure                                                         │ 1456          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Poor Twisted Me                                              │ 2030          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mama Said                                                    │ 881           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Outlaw Torn                                              │ 1457          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Battery                                                      │ 882           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Battery                                                      │ 2031          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Master Of Puppets                                            │ 302           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Thing That Should Not Be                                 │ 303           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Welcome Home (Sanitarium)                                    │ 304           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Disposable Heroes                                            │ 883           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Leper Messiah                                                │ 305           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Leper Messiah                                                │ 1458          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Orion                                                        │ 2032          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Damage Inc.                                                  │ 306           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fuel                                                         │ 884           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Memory Remains                                           │ 307           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Unforgiven II                                            │ 308           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Unforgiven II                                            │ 1459          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Better Than You                                              │ 885           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Better Than You                                              │ 2033          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Slither                                                      │ 309           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bad Seed                                                     │ 310           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Where The Wild Things Are                                    │ 886           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Prince Charming                                              │ 1460          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Low Man's Lyric                                              │ 2034          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Attitude                                                     │ 311           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ride The Lightning                                           │ 887           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ For Whom The Bell Tolls                                      │ 312           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ For Whom The Bell Tolls                                      │ 1461          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fade To Black                                                │ 2035          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Creeping Death                                               │ 313           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Call Of Ktulu                                            │ 888           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Frantic                                                      │ 1462          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Some Kind Of Monster                                         │ 314           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Invisible Kid                                                │ 2036          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ My World                                                     │ 889           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shoot Me Again                                               │ 315           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shoot Me Again                                               │ 1463          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All Within My Hands                                          │ 316           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blackened                                                    │ 890           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ ...And Justice For All                                       │ 1464          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eye Of The Beholder                                          │ 2037          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Harvester Of Sorrow                                          │ 317           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Frayed Ends Of Sanity                                    │ 891           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ To Live Is To Die                                            │ 1465          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Duke                                                     │ 318           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Duke                                                     │ 2038          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ My Ship                                                      │ 892           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Meaning Of The Blues                                     │ 1466          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lament                                                       │ 319           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Don't Wanna Be Kissed (By Anyone But You)                  │ 893           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blues For Pablo (Alternate Take)                             │ 2039          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Coração De Estudante                                         │ 320           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Noite Do Meu Bem                                           │ 894           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Paisagem Na Janela                                           │ 1467          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Menestrel Das Alagoas                                        │ 321           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Menestrel Das Alagoas                                        │ 2040          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Brasil                                                       │ 895           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Para Lennon E McCartney                                      │ 1468          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maria, Maria                                                 │ 322           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Beijo Partido                                                │ 2041          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Saudade Dos Aviões Da Panair (Conversando No Bar)            │ 896           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ponta de Areia                                               │ 323           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Idolatrada                                                   │ 1469          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Norwegian Wood                                               │ 324           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Norwegian Wood                                               │ 2042          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Caso Você Queira Saber                                       │ 897           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Live To Win                                                  │ 1470          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fast And Loose                                               │ 325           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jailbait                                                     │ 2043          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dance                                                        │ 898           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dirty Love                                                   │ 1471          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Please Don't Touch                                           │ 326           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Que Vai Em Meu Coração                                     │ 2044          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Aos Leões                                                    │ 899           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ É Fogo                                                       │ 1472          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Já Foi                                                       │ 327           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Moça e a Chuva                                             │ 2045          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Demorou!                                                     │ 900           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Kickstart My Heart                                           │ 1473          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wild Side                                                    │ 328           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Same Ol' Situation                                           │ 2046          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Home Sweet Home                                              │ 901           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Smokin' in The Boys Room                                     │ 1474          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Primal Scream                                                │ 329           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shout At The Devil                                           │ 2047          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Intro                                                        │ 902           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Smells Like Teen Spirit                                      │ 1475          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Been A Son                                                   │ 330           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Spank Thru                                                   │ 2048          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Scentless Apprentice                                         │ 903           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Polly                                                        │ 1476          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Breed                                                        │ 331           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Smells Like Teen Spirit                                      │ 2049          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ In Bloom                                                     │ 904           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Polly                                                        │ 1477          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Territorial Pissings                                         │ 332           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ On A Plain                                                   │ 905           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sangue Latino                                                │ 1478          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sangue Latino                                                │ 2050          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Folhas Secas                                                 │ 333           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Folhas Secas                                                 │ 2051          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Poeira                                                       │ 2052          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Quem Mata A Mulher Mata O Melhor                             │ 2053          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mundaréu                                                     │ 906           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Braço Da Minha Guitarra                                    │ 2054          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mãe Terra                                                    │ 2055          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Às Vezes                                                     │ 1479          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Menino De Rua                                                │ 334           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Menino De Rua                                                │ 2056          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Elza                                                         │ 2057          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nossa Gente (Avisa Là)                                       │ 907           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nossa Gente (Avisa Là)                                       │ 2058          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Todo Amor (Asas Da Liberdade)                                │ 2059          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Denúncia                                                     │ 335           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jeito Faceiro                                                │ 2060          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Revolta Olodum                                               │ 908           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Revolta Olodum                                               │ 1480          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Reggae Odoyá                                                 │ 1481          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Protesto Do Olodum (Ao Vivo)                                 │ 1482          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Olodum - Smile (Instrumental)                                │ 2061          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vulcão Dub - Fui Eu                                          │ 1483          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Trem Da Juventude                                          │ 336           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Manguetown                                                   │ 1484          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Amor, Um Lugar                                            │ 2062          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bora-Bora                                                    │ 1485          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vai Valer                                                    │ 909           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Feel Good (I Got You) - Sossego                            │ 1486          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Uns Dias                                                     │ 2063          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sincero Breu                                                 │ 1487          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Selvagem                                                     │ 337           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Selvagem                                                     │ 1488          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Brasília 5:31                                                │ 2064          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Navegar Impreciso                                            │ 1489          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vamo Batê Lata                                               │ 2065          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Life During Wartime                                          │ 1490          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nebulosa Do Amor                                             │ 338           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nebulosa Do Amor                                             │ 910           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Caleidoscópio                                                │ 911           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Trac Trac                                                    │ 912           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tendo A Lua                                                  │ 1491          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mensagen De Amor (2000)                                      │ 913           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mensagen De Amor (2000)                                      │ 2066          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ La Bella Luna                                                │ 914           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Busca Vida                                                   │ 1492          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Uma Brasileira                                               │ 915           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Luis Inacio (300 Picaretas)                                  │ 339           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Saber Amar                                                   │ 916           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Saber Amar                                                   │ 2067          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ela Disse Adeus                                              │ 1493          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Amor Nao Sabe Esperar                                      │ 917           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Caleidoscópio                                                │ 918           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Óculos                                                       │ 1494          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cinema Mudo                                                  │ 2068          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lanterna Dos Afogados                                        │ 919           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Beco                                                       │ 1495          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meu Erro                                                     │ 920           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meu Erro                                                     │ 2069          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Perplexo                                                     │ 340           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Me Liga                                                      │ 341           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Quase Um Segundo                                             │ 342           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Selvagem                                                     │ 921           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Romance Ideal                                                │ 343           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Romance Ideal                                                │ 1496          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Será Que Vai Chover?                                         │ 2070          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ SKA                                                          │ 344           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bark at the Moon                                             │ 922           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Don't Know                                                 │ 345           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Flying High Again                                            │ 346           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Flying High Again                                            │ 1497          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mama, I'm Coming Home                                        │ 923           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mama, I'm Coming Home                                        │ 2071          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No More Tears                                                │ 347           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Crazy Train                                                  │ 348           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Believer                                                     │ 924           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mr. Crowley                                                  │ 1498          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Flying High Again                                            │ 2072          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Relvelation (Mother Earth)                                   │ 349           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Iron Man                                                     │ 925           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Children Of The Grave                                        │ 350           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Children Of The Grave                                        │ 1499          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Paranoid                                                     │ 2073          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dee                                                          │ 351           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shining In The Light                                         │ 926           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When The World Was Young                                     │ 1500          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blue Train                                                   │ 352           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Most High                                                    │ 2074          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heart In Your Hand                                           │ 927           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walking Into Clarksdale                                      │ 353           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walking Into Clarksdale                                      │ 1501          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sons Of Freedom                                              │ 354           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ United Colours                                               │ 928           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Slug                                                         │ 1502          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Your Blue Room                                               │ 2075          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Beach Sequence                                               │ 355           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Miss Sarajevo                                                │ 929           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ito Okashi                                                   │ 1503          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Plot 180                                                     │ 356           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Plot 180                                                     │ 2076          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Theme From The Swan                                          │ 930           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Prowler                                                      │ 1504          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Murders In The Rue Morgue                                    │ 357           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Women In Uniform                                             │ 931           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sanctuary                                                    │ 2077          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Iron Maiden                                                  │ 358           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Corduroy                                                     │ 932           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Given To Fly                                                 │ 1505          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Untitled                                                     │ 359           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Untitled                                                     │ 2078          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ MFC                                                          │ 933           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Off He Goes                                                  │ 1506          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nothingman                                                   │ 360           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black                                                        │ 2079          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ F*Ckin' Up                                                   │ 934           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ World Wide Suicide                                           │ 361           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Severed Hand                                                 │ 1507          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Big Wave                                                     │ 362           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Big Wave                                                     │ 2080          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gone                                                         │ 935           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Inside Job                                                   │ 1508          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Can't Keep                                                   │ 363           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cropduster                                                   │ 2081          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ghost                                                        │ 936           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get Right                                                    │ 1509          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Green Disease                                                │ 364           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 1/2 Full                                                     │ 2082          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Arc                                                          │ 937           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Alive                                                        │ 1510          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Why Go                                                       │ 365           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Oceans                                                       │ 2083          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Porch                                                        │ 938           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Go                                                           │ 1511          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Animal                                                       │ 366           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dissident                                                    │ 2084          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ W.M.A.                                                       │ 939           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Elderly Woman Behind The Counter In A Small Town             │ 1512          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Leash                                                        │ 367           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Look Back                                              │ 2085          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jah Seh No                                                   │ 940           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bush Doctor                                                  │ 1513          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wanted Dread And Alive                                       │ 368           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pick Myself Up                                               │ 2086          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Crystal Ball                                                 │ 941           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Time                                                         │ 1514          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Great Gig In The Sky                                     │ 369           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Any Colour You Like                                          │ 2087          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Brain Damage                                                 │ 942           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hip Hop Rio                                                  │ 1515          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bossa                                                        │ 370           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Bicho Tá Pregando                                          │ 943           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rappers Reais                                                │ 1516          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rappers Reais                                                │ 2088          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nega Do Cabelo Duro                                          │ 371           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nega Do Cabelo Duro                                          │ 2089          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hemp Family                                                  │ 2090          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Se Liga                                                      │ 2091          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bohemian Rhapsody                                            │ 944           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Another One Bites The Dust                                   │ 2092          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fat Bottomed Girls                                           │ 2093          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bicycle Race                                                 │ 1517          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You're My Best Friend                                        │ 372           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You're My Best Friend                                        │ 2094          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Save Me                                                      │ 2095          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Somebody To Love                                             │ 945           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Somebody To Love                                             │ 2096          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Flash                                                        │ 2097          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Seven Seas Of Rhye                                           │ 373           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ We Will Rock You                                             │ 2098          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ We Are The Champions                                         │ 946           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ We Are The Champions                                         │ 1518          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sheer Heart Attack                                           │ 1519          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All Dead, All Dead                                           │ 1520          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Spread Your Wings                                            │ 2099          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fight From The Inside                                        │ 1521          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get Down, Make Love                                          │ 374           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sleep On The Sidewalk                                        │ 1522          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Who Needs You                                                │ 2100          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It's Late                                                    │ 1523          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ My Melancholy Blues                                          │ 947           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shiny Happy People                                           │ 1524          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Me In Honey                                                  │ 2101          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Radio Song                                                   │ 1525          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get Up                                                       │ 375           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get Up                                                       │ 1526          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Are The Everything                                       │ 2102          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Wrong Child                                              │ 1527          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hairshirt                                                    │ 2103          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Remember California                                        │ 1528          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Untitled                                                     │ 376           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Untitled                                                     │ 948           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ How The West Was Won And Where It Got Us                     │ 949           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Wake-Up Bomb                                             │ 950           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ New Test Leper                                               │ 1529          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Undertow                                                     │ 951           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Undertow                                                     │ 2104          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Leave                                                        │ 952           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Departure                                                    │ 1530          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bittersweet Me                                               │ 953           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Be Mine                                                      │ 377           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Binky The Doormat                                            │ 954           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Binky The Doormat                                            │ 2105          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Zither                                                       │ 1531          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ So Fast, So Numb                                             │ 955           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Electrolite                                                  │ 956           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Losing My Religion                                           │ 1532          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Low                                                          │ 2106          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Endgame                                                      │ 957           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Texarkana                                                    │ 1533          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Country Feedback                                             │ 958           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Country Feedback                                             │ 2107          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Carnival Of Sorts                                            │ 378           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Radio Free Aurope                                            │ 379           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Perfect Circle                                               │ 380           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Talk About The Passion                                       │ 959           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ So Central Rain                                              │ 381           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ So Central Rain                                              │ 1534          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Go Back To Rockville                                   │ 2108          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pretty Persuasion                                            │ 382           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Green Grow The Rushes                                        │ 960           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Can't Get There From Here                                    │ 383           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fall On Me                                                   │ 384           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fall On Me                                                   │ 1535          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Believe                                                    │ 961           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Believe                                                    │ 2109          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cuyahoga                                                     │ 385           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Finest Worksong                                          │ 386           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It's The End Of The World As We Know It (And I Feel Fine)    │ 962           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Infeliz Natal                                                │ 1536          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Sua                                                        │ 2110          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Papeau Nuky Doe                                              │ 387           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Puteiro Em João Pessoa                                       │ 963           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Esporrei Na Manivela                                         │ 388           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Esporrei Na Manivela                                         │ 1537          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bê-a-Bá                                                      │ 2111          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maluco Beleza                                                │ 389           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Dia Em Que A Terra Parou                                   │ 964           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No Fundo Do Quintal Da Escola                                │ 1538          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ As Profecias                                                 │ 390           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sapato 36                                                    │ 2112          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Todo Mundo Explica                                           │ 965           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Que Luz É Essa                                               │ 391           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Que Luz É Essa                                               │ 1539          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Século XXI                                                   │ 392           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock Das Aranhas (Ao Vivo) (Live)                            │ 966           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Power Of Equality                                        │ 1540          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ If You Have To Ask                                           │ 2113          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Suck My Kiss                                                 │ 393           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Could Have Lied                                            │ 967           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mellowship Slinky In B Major                                 │ 1541          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Under The Bridge                                             │ 394           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Under The Bridge                                             │ 2114          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Naked In The Rain                                            │ 968           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sir Psycho Sexy                                              │ 1542          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ They're Red Hot                                              │ 395           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ By The Way                                                   │ 969           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ This Is The Place                                            │ 2115          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Zephyr Song                                              │ 396           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Can't Stop                                                   │ 970           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Could Die For You                                          │ 1543          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tear                                                         │ 397           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tear                                                         │ 2116          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ On Mercury                                                   │ 971           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Around The World                                             │ 1544          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Parallel Universe                                            │ 398           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get On Top                                                   │ 2117          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Californication                                              │ 972           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Porcelain                                                    │ 399           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Like Dirt                                                  │ 1545          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Right On Time                                                │ 400           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Right On Time                                                │ 2118          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Road Trippin'                                                │ 973           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Freewill                                                     │ 1546          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Xanadu                                                       │ 401           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Anthem                                                       │ 2119          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Closer To The Heart                                          │ 974           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fly By Night                                                 │ 1547          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Finding My Way                                               │ 402           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ La Puesta Del Sol                                            │ 2120          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Persuasion                                                   │ 975           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Santana Jam                                                  │ 1548          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Evil Ways                                                    │ 403           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Just Ain't Good Enough                                       │ 2121          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Funky Piano                                                  │ 976           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Right Thing                                              │ 1549          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It's Only Love                                               │ 404           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ If You Don't Know Me By Now                                  │ 2122          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stars                                                        │ 977           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ For Your Babies                                              │ 1550          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ So Beautiful                                                 │ 405           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Água E Fogo                                                  │ 2123          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Três Lados                                                   │ 978           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Muçulmano                                                    │ 1551          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Maquinarama                                                  │ 406           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fica                                                         │ 2124          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ali                                                          │ 979           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Zé Trindade                                                  │ 1552          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Garota Nacional                                              │ 407           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Os Exilados                                                  │ 2125          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Dia Qualquer                                              │ 980           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lucky 13                                                     │ 1553          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Aeroplane Flies High                                         │ 408           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ My Mistake                                                   │ 981           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Waiting                                                      │ 1554          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Waiting                                                      │ 2126          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Saturnine                                                    │ 409           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Saturnine                                                    │ 2127          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock On                                                      │ 2128          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Winterlong                                                   │ 2129          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Soot & Stars                                                 │ 982           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Blissed & Gone                                               │ 2130          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rhinocerous                                                  │ 2131          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Drown                                                        │ 1555          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cherub Rock                                                  │ 410           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cherub Rock                                                  │ 2132          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Disarm                                                       │ 2133          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bullet With Butterfly Wings                                  │ 983           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bullet With Butterfly Wings                                  │ 2134          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eye                                                          │ 2135          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ava Adore                                                    │ 411           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stand Inside Your Love                                       │ 2136          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Real Love                                                    │ 984           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Real Love                                                    │ 1556          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ [Untitled]                                                   │ 1557          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nothing To Say                                               │ 1558          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Flower                                                       │ 2137          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Loud Love                                                    │ 1559          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hands All Over                                               │ 412           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get On The Snake                                             │ 1560          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jesus Christ Pose                                            │ 2138          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Outshined                                                    │ 1561          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rusty Cage                                                   │ 985           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Spoonman                                                     │ 1562          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Day I Tried To Live                                      │ 2139          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Hole Sun                                               │ 1563          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pretty Noose                                                 │ 413           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pretty Noose                                                 │ 1564          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Burden In My Hand                                            │ 2140          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bleed Together                                               │ 1565          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rasul                                                        │ 2141          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Song For Lorraine                                            │ 1566          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Starburst                                                    │ 414           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Starburst                                                    │ 986           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heliopolis                                                   │ 987           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ It Doesn't Matter                                            │ 988           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Little Linda                                                 │ 1567          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ End Of Romanticism                                           │ 989           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ End Of Romanticism                                           │ 2142          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Crossfire                                                    │ 990           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tightrope                                                    │ 1568          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Let Me Love You Baby                                         │ 991           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Leave My Girl Alone                                          │ 415           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Travis Walk                                                  │ 992           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Travis Walk                                                  │ 2143          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wall Of Denial                                               │ 1569          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Scratch-N-Sniff                                              │ 993           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Riviera Paradise                                             │ 994           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dead And Bloated                                             │ 1570          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sex Type Thing                                               │ 2144          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ No Memory                                                    │ 995           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Creep                                                        │ 1571          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Piece Of Pie                                                 │ 996           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Piece Of Pie                                                 │ 2145          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Plush                                                        │ 416           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wet My Bed                                                   │ 417           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Crackerman                                                   │ 418           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Where The River Goes                                         │ 997           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Soldier Side - Intro                                         │ 419           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Soldier Side - Intro                                         │ 1572          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ B.Y.O.B.                                                     │ 2146          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Revenga                                                      │ 420           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cigaro                                                       │ 998           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Radio/Video                                                  │ 421           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Violent Pornography                                          │ 422           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Violent Pornography                                          │ 1573          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Question!                                                    │ 999           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Question!                                                    │ 2147          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sad Statue                                                   │ 423           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lost in Hollywood                                            │ 424           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Sun Road                                                 │ 1000          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dark Corners                                                 │ 1574          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Duende                                                       │ 2148          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Light Syndrome                                         │ 425           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Chaos-Control                                                │ 1001          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Midnight From The Inside Out                                 │ 426           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Midnight From The Inside Out                                 │ 1575          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sting Me                                                     │ 2149          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sometimes Salvation                                          │ 427           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cursed Diamonds                                              │ 1002          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Miracle To Me                                                │ 1576          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Girl From A Pawnshop                                         │ 428           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Black Moon Creeping                                          │ 2150          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ High Head Blues                                              │ 1003          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Title Song                                                   │ 429           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Title Song                                                   │ 1577          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Soul Singing                                                 │ 430           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hard To Handle                                               │ 1004          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Remedy                                                       │ 1578          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ White Riot                                                   │ 2151          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Clash City Rockers                                           │ 431           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ (White Man) In Hammersmith Palais                            │ 1005          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tommy Gun                                                    │ 1579          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Train In Vain                                                │ 432           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Train In Vain                                                │ 2152          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bankrobber                                                   │ 1006          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ This Is Radio Clash                                          │ 1580          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Know Your Rights                                             │ 433           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rock The Casbah                                              │ 1007          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ War (The Process)                                            │ 2153          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Take The Power                                               │ 434           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Breathe                                                      │ 1008          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nico                                                         │ 1581          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Speed Of Light                                               │ 435           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Speed Of Light                                               │ 2154          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ True Believers                                               │ 1009          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lil' Evil                                                    │ 1582          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Spirit Walker                                                │ 436           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wild Hearted Son                                             │ 2155          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Removal Machine                                         │ 1010          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Edie (Ciao Baby)                                             │ 437           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love                                                         │ 1583          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sun King                                                     │ 438           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sun King                                                     │ 2156          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sweet Soul Sister                                            │ 1011          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Crystal Ship                                             │ 1584          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Twentienth Century Fox                                       │ 439           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Back Door Man                                                │ 2157          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Looked At You                                              │ 1012          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Roxanne                                                      │ 1585          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Can't Stand Losing You                                       │ 440           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Don't Stand so Close to Me                                   │ 2158          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ De Do Do Do, De Da Da Da                                     │ 1013          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Every Breath You Take                                        │ 1586          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ King Of Pain                                                 │ 441           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Message in a Bottle (new classic rock mix)                   │ 2159          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Time Is On My Side                                           │ 1014          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ As Tears Go By                                               │ 1587          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Get Off Of My Cloud                                          │ 442           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Paint It Black                                               │ 2160          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Under My Thumb                                               │ 1015          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Got Me Rocking                                           │ 1588          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gimmie Shelters                                              │ 443           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Corinna                                                      │ 2161          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Saint Of Me                                                  │ 1016          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Respectable                                                  │ 1589          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Thief In The Night                                           │ 444           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Is Strong                                               │ 2162          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Got Me Rocking                                           │ 1017          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Moon Is Up                                                   │ 1590          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Out Of Tears                                                 │ 445           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sweethearts Together                                         │ 2163          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Suck On The Jugular                                          │ 1018          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mean Disposition                                             │ 1591          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walking Wounded                                              │ 446           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sister Awake                                                 │ 1019          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Release                                                      │ 1592          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Release                                                      │ 2164          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heaven Coming Down                                           │ 447           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heaven Coming Down                                           │ 2165          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The River (Remix)                                            │ 2166          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Waiting On A Sign                                            │ 2167          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Life Line                                                    │ 1020          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Paint It Black                                               │ 2168          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Army Ants                                                    │ 2169          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Psychopomp                                                   │ 1593          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gyroscope                                                    │ 448           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gyroscope                                                    │ 2170          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Release                                                      │ 2171          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Babylon                                                      │ 1021          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Babylon                                                      │ 2172          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Can't Explain                                              │ 2173          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Anyway, Anyhow, Anywhere                                     │ 449           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I'm A Boy                                                    │ 2174          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Boris The Spider                                             │ 1022          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Boris The Spider                                             │ 1594          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Happy Jack                                                   │ 1595          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pictures Of Lily                                             │ 1596          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Can See For Miles                                          │ 2175          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Magic Bus                                                    │ 1597          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pinball Wizard                                               │ 450           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Seeker                                                   │ 1598          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Baba O'Riley                                                 │ 2176          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Won't Get Fooled Again (Full Length Version)                 │ 1599          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Let's See Action                                             │ 1023          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 5.15                                                         │ 1600          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Join Together                                                │ 2177          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Squeeze Box                                                  │ 1601          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Better You Bet                                           │ 451           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Better You Bet                                           │ 1602          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Primavera                                                    │ 2178          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Descobridor Dos Sete Mares                                 │ 1603          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ New Love                                                     │ 2179          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Não Vou Ficar                                                │ 1604          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Música No Ar                                                 │ 452           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Música No Ar                                                 │ 1024          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Salve Nossa Senhora                                          │ 1025          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Você Fugiu                                                   │ 1026          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cristina Nº 2                                                │ 1605          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Compadre                                                     │ 1027          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Compadre                                                     │ 2180          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Réu Confesso                                                 │ 1028          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Que Me Importa                                             │ 1606          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gostava Tanto De Você                                        │ 1029          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Você                                                         │ 453           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Não Quero Dinheiro                                           │ 1030          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Não Quero Dinheiro                                           │ 2181          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eu Amo Você                                                  │ 1607          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Festa Do Santo Reis                                        │ 1031          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Padre Cícero                                                 │ 1032          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nosso Adeus                                                  │ 1608          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Canário Do Reino                                             │ 2182          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Balanço                                                      │ 1033          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Formigueiro                                                  │ 1609          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Comida                                                       │ 1034          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Comida                                                       │ 2183          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Go Back                                                      │ 454           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Prá Dizer Adeus                                              │ 455           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Família                                                      │ 456           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Os Cegos Do Castelo                                          │ 1035          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Pulso                                                      │ 457           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ O Pulso                                                      │ 1610          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Marvin                                                       │ 2184          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nem 5 Minutos Guardados                                      │ 458           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Flores                                                       │ 1036          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Palavras                                                     │ 459           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Melhor Forma                                               │ 460           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Melhor Forma                                               │ 1611          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cabeça Dinossauro                                            │ 1037          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cabeça Dinossauro                                            │ 2185          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ 32 Dentes                                                    │ 461           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Não Vou Lutar                                                │ 462           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Homem Primata (Vinheta)                                      │ 1038          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Homem Primata                                                │ 1612          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Polícia (Vinheta)                                            │ 2186          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Querem Meu Sangue                                            │ 463           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sonifera Ilha                                                │ 1039          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lugar Nenhum                                                 │ 464           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lugar Nenhum                                                 │ 1613          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sua Impossivel Chance                                        │ 2187          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Domingo                                                      │ 465           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Amanhã Não Se Sabe                                           │ 1040          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Caras Como Eu                                                │ 1614          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Era Uma Vez                                                  │ 466           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Insensível                                                   │ 2188          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eu E Ela                                                     │ 1041          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Toda Cor                                                     │ 467           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Toda Cor                                                     │ 1615          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Occupation / Precipice                                       │ 468           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Exodus, Pt. 1                                                │ 1042          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Exodus, Pt. 2                                                │ 1616          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Collaborators                                                │ 2189          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hero                                                         │ 469           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Unfinished Business                                          │ 1043          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Passage                                                  │ 1617          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Woman King                                               │ 470           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Woman King                                               │ 2190          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Day In the Life                                            │ 1044          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Crossroads, Pt. 1                                            │ 1618          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Crossroads, Pt. 2                                            │ 471           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Genesis                                                      │ 1045          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ One Giant Leap                                               │ 2191          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Better Halves                                                │ 472           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Nothing to Hide                                              │ 1046          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Seven Minutes to Midnight                                    │ 1619          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Fix                                                      │ 473           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Fix                                                      │ 2192          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Distractions                                                 │ 1047          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Company Man                                                  │ 1620          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Parasite                                                     │ 474           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Man of Science, Man of Faith (Premiere)                      │ 2193          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Adrift                                                       │ 1048          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Glass Ballerina                                          │ 475           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Orientation                                                  │ 1621          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walkabout                                                    │ 476           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walkabout                                                    │ 2194          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ ...And Found                                                 │ 1049          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ House of the Rising Sun                                      │ 1622          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Do                                                         │ 477           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Moth                                                     │ 2195          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Other 48 Days                                            │ 1050          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lost Survival Guide                                          │ 1623          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Solitary                                                     │ 478           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stranger In a Strange Land                                   │ 2196          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The 23rd Psalm                                               │ 1051          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Enter 77                                                     │ 1624          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fire + Water                                                 │ 479           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Par Avion                                                    │ 2197          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Long Con                                                 │ 1052          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Exposé                                                       │ 1625          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Homecoming                                                   │ 480           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Outlaws                                                      │ 2198          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Whole Truth                                              │ 1053          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Catch-22                                                     │ 1626          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dave                                                         │ 481           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Deus Ex Machina                                              │ 2199          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ S.O.S.                                                       │ 1054          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ "?"                                                          │ 1627          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Born to Run                                                  │ 482           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Live Together, Die Alone, Pt. 1                              │ 2200          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Exodus (Part 2) [Season Finale]                              │ 1055          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Even Better Than The Real Thing                              │ 1628          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ One                                                          │ 483           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ So Cruel                                                     │ 2201          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Fly                                                      │ 1056          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Acrobat                                                      │ 1629          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Is Blindness                                            │ 484           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walk On                                                      │ 1057          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Peace On Earth                                               │ 1630          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Peace On Earth                                               │ 2202          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When I Look At The World                                     │ 485           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When I Look At The World                                     │ 2203          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ New York                                                     │ 2204          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Three Sunrises                                           │ 2205          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Spanish Eyes                                                 │ 1058          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sweetest Thing                                               │ 2206          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bass Trap                                                    │ 2207          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dancing Barefoot                                             │ 1631          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Everlasting Love                                             │ 486           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Everlasting Love                                             │ 2208          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Walk To The Water                                            │ 2209          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hallelujah Here She Comes                                    │ 1059          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hallelujah Here She Comes                                    │ 2210          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Trash, Trampoline And The Party Girl                         │ 2211          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Vertigo                                                      │ 487           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love And Peace Or Else                                       │ 2212          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ City Of Blinding Lights                                      │ 1060          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ City Of Blinding Lights                                      │ 1632          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All Because Of You                                           │ 1633          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Man And A Woman                                            │ 1634          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Crumbs From Your Table                                       │ 2213          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ One Step Closer                                              │ 1635          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Original Of The Species                                      │ 488           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Yahweh                                                       │ 1636          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Discotheque                                                  │ 2214          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Do You Feel Loved                                            │ 1637          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Mofo                                                         │ 1061          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ If God Will Send His Angels                                  │ 1638          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Staring At The Sun                                           │ 2215          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Last Night On Earth                                          │ 1639          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Miami                                                        │ 489           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Miami                                                        │ 1640          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Playboy Mansion                                          │ 2216          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wake Up Dead Man                                             │ 1641          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Desire                                                       │ 2217          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hawkmoon 269                                                 │ 1642          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All Along The Watchtower                                     │ 490           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All Along The Watchtower                                     │ 1062          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Still Haven't Found What I'm Looking for                   │ 1063          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Freedom For My People                                        │ 1064          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Silver And Gold                                              │ 1643          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pride (In The Name Of Love)                                  │ 1065          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pride (In The Name Of Love)                                  │ 2218          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Rescue Me                                               │ 1066          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When Love Comes To Town                                      │ 1644          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Heartland                                                    │ 1067          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ God Part II                                                  │ 491           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Star Spangled Banner                                     │ 1068          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Star Spangled Banner                                     │ 2219          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bullet The Blue Sky                                          │ 1645          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All I Want Is You                                            │ 1069          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ New Year's Day                                               │ 1070          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ With Or Without You                                          │ 1646          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Still Haven't Found What I'm Looking For                   │ 2220          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bad                                                          │ 1071          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Unforgettable Fire                                       │ 1647          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sweetest Thing                                               │ 1072          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sweetest Thing                                               │ 2221          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Desire                                                       │ 492           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ When Love Comes To Town                                      │ 493           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Angel Of Harlem                                              │ 494           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All I Want Is You                                            │ 1073          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sunday Bloody Sunday                                         │ 495           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sunday Bloody Sunday                                         │ 1648          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Seconds                                                      │ 2222          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ New Year's Day                                               │ 496           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Like A Song...                                               │ 1074          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Drowning Man                                                 │ 497           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Two Hearts Beat As One                                       │ 498           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Two Hearts Beat As One                                       │ 1649          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Red Light                                                    │ 1075          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Red Light                                                    │ 2223          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Surrender                                                    │ 499           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Zooropa                                                      │ 500           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Babyface                                                     │ 1076          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Numb                                                         │ 1650          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lemon                                                        │ 2224          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Stay (Faraway, So Close!)                                    │ 501           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The First Time                                               │ 1077          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dirty Day                                                    │ 502           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dirty Day                                                    │ 1651          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Wanderer                                                 │ 2225          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Would Do For You                                           │ 503           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Homely Girl                                                  │ 1078          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Here I Am (Come And Take Me)                                 │ 1652          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wear You To The Ball                                         │ 504           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Higher Ground                                                │ 2226          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Bring Me Your Cup                                            │ 1079          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ C'est La Vie                                                 │ 505           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ C'est La Vie                                                 │ 1653          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Where Have All The Good Times Gone?                          │ 506           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hang 'Em High                                                │ 1080          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cathedral                                                    │ 1654          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Secrets                                                      │ 2227          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dancing In The Street                                        │ 507           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Little Guitars (Intro)                                       │ 1081          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Little Guitars                                               │ 1655          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eruption                                                     │ 508           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eruption                                                     │ 2228          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ain't Talkin' 'bout Love                                     │ 1082          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Unchained                                                    │ 1656          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jump                                                         │ 509           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Panama                                                       │ 1083          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dreams                                                       │ 2229          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Right Now                                                    │ 510           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Can't Stop Loving You                                        │ 1084          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Humans Being                                                 │ 1657          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eruption                                                     │ 511           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Eruption                                                     │ 2230          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Really Got Me                                            │ 1085          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Atomic Punk                                                  │ 1658          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Feel Your Love Tonight                                       │ 512           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ On Fire                                                      │ 2231          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Neworld                                                      │ 1086          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ One I Want                                                   │ 513           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dirty Water Dog                                              │ 1659          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Year to the Day                                              │ 514           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Year to the Day                                              │ 2232          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Primary                                                      │ 1087          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Do It For The Kids                                           │ 1660          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Big Machine                                                  │ 515           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fall To Pieces                                               │ 2233          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Headspace                                                    │ 1088          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Slither                                                      │ 1661          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Dirty Little Thing                                           │ 516           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Bencao E Outros                                            │ 2234          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tudo Na Mais Santa Paz                                       │ 1089          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba Pra Endrigo                                            │ 1662          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ So Por Amor                                                  │ 517           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Homem Chamado Alfredo                                     │ 2235          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba Do Jato                                                │ 1090          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Still Of The Night                                           │ 1663          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Here I Go Again                                              │ 518           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Looking For Love                                             │ 2236          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Now You're Gone                                              │ 1091          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You're Gonna Break My Hart Again                             │ 1664          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Deeper The Love                                          │ 519           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sweet Lady Luck                                              │ 2237          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Faixa Amarela                                                │ 1092          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Coração Em Desalinho                                         │ 1665          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Seu Balancê                                                  │ 520           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Feirinha da Pavuna/Luz do Repente/Bagaço da Laranja          │ 2238          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sem Essa de Malandro Agulha                                  │ 1093          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Camarão que Dorme e Onda Leva                                │ 1666          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sapopemba e Maxambomba                                       │ 521           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Samba pras moças                                             │ 2239          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Verdade                                                      │ 1094          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Hard Part                                                │ 1667          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Man Behind the Curtain                                   │ 522           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Diversity Day                                                │ 1095          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hot Girl                                                     │ 1668          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Hot Girl                                                     │ 2240          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Dundies                                                  │ 523           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Halloween                                                    │ 1096          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Email Surveillance                                           │ 1669          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Christmas Party                                              │ 524           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Carpet                                                   │ 1097          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Michael's Birthday                                           │ 525           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gay Witch Hunt                                               │ 1098          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gay Witch Hunt                                               │ 1670          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Convention                                               │ 1671          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Coup                                                     │ 1672          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Initiation                                               │ 1673          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Diwali                                                       │ 526           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Branch Closing                                               │ 1674          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Convict                                                  │ 1675          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Benihana Christmas, Pts. 1 & 2                             │ 1099          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Back from Vacation                                           │ 1676          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Producer's Cut: The Return                                   │ 1677          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Phyllis's Wedding                                            │ 527           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Phyllis's Wedding                                            │ 1678          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Safety Training                                              │ 1679          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Job                                                      │ 1680          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ How to Stop an Exploding Man                                 │ 528           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ How to Stop an Exploding Man                                 │ 1100          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Through a Looking Glass                                      │ 1101          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Your Time Is Gonna Come                                      │ 1102          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Battlestar Galactica, Pt. 1                                  │ 1681          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Battlestar Galactica, Pt. 2                                  │ 1103          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lost Planet of the Gods, Pt. 1                               │ 1104          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Lost Planet of the Gods, Pt. 2                               │ 1682          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Lost Warrior                                             │ 1105          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Long Patrol                                              │ 529           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Gun On Ice Planet Zero, Pt. 1                            │ 1106          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Gun On Ice Planet Zero, Pt. 2                            │ 1683          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Magnificent Warriors                                     │ 1107          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Living Legend, Pt. 1                                     │ 1108          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Living Legend, Pt. 2                                     │ 1684          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ War of the Gods, Pt. 2                                       │ 1109          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Greetings from Earth, Pt. 1                                  │ 1685          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Greetings from Earth, Pt. 2                                  │ 1110          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Baltar's Escape                                              │ 530           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Experiment In Terra                                          │ 531           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Take the Celestra                                            │ 532           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Hand of God                                              │ 1111          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pilot                                                        │ 533           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pilot                                                        │ 1686          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Through the Looking Glass, Pt. 1                             │ 534           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Instant Karma                                                │ 1112          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ #9 Dream                                                     │ 535           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Give Peace a Chance                                          │ 536           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Give Peace a Chance                                          │ 1687          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Cold Turkey                                                  │ 1113          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Whatever Gets You Thru the Night                             │ 537           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gimme Some Truth                                             │ 538           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Oh, My Love                                                  │ 1114          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Imagine                                                      │ 1688          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jealous Guy                                                  │ 539           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Imagine                                                      │ 1115          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Beautiful Boy                                                │ 540           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Beautiful Boy                                                │ 1689          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Gimme Some Truth                                             │ 541           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ [Just Like] Starting Over                                    │ 1116          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ God                                                          │ 1690          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sympton of the Universe                                      │ 542           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fairies Wear Boots                                           │ 1117          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ War Pigs                                                     │ 543           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ War Pigs                                                     │ 1691          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Never Say Die                                                │ 544           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sabbath, Bloody Sabbath                                      │ 1118          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Iron Man/Children of the Grave                               │ 1692          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Zoo                                                      │ 545           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Loving You Sunday Morning                                    │ 1119          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Still Loving You                                             │ 1693          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Can't Explain                                              │ 546           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tease Me Please Me                                           │ 1120          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Salutations                                                  │ 1694          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Put Your Head Out                                            │ 547           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Top O' The Morning To Ya                                     │ 1121          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Danny Boy, Danny Boy                                         │ 548           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Guess Who's Back                                             │ 1122          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Commercial 2                                                 │ 1695          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ One For The Road                                             │ 549           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Feel It                                                      │ 1123          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Instinto Colectivo                                           │ 1696          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Chapa o Coco                                                 │ 550           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Um Lugar ao Sol                                              │ 1124          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Todo o Carnaval tem seu Fim                                  │ 551           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Armadura                                                     │ 1697          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Funk de Bamba                                                │ 552           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Chega no Suingue                                             │ 1125          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Past, Present, and Future                                    │ 1698          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Beginning of the End                                     │ 553           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Economist                                                │ 1126          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Ji Yeon                                                      │ 1699          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Meet Kevin Johnson                                           │ 554           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Din Din Wo (Little Child)                                    │ 1127          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Love Comes                                                   │ 1700          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Muita Bobeira                                                │ 555           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Something Nice Back Home                                     │ 1128          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ There's No Place Like Home, Pt. 3                            │ 1701          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Say Hello 2 Heaven                                           │ 556           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Call Me a Dog                                                │ 1129          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Four Walled World                                            │ 1702          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ All Night Thing                                              │ 557           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Safe and Sound                                               │ 1130          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Billie Jean                                                  │ 1703          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Scar On the Sky                                              │ 558           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Disappearing Act                                             │ 1131          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sound of a Gun                                               │ 1704          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Until We Fall                                                │ 559           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Shape of Things to Come                                      │ 1132          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Moth                                                         │ 1705          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Show Me How to Live (Live at the Quart Festival)             │ 560           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Canon and Gigue in D Major: I. Canon                         │ 1133          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Suite for Solo Cello No. 1 in G Major, BWV 1007: I. Prélude  │ 1706          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ The Messiah: Behold, I Tell You a Mystery... The Trumpet Sha │ 561           │
│ ll Sound                                                     │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Symphony No. 104 in D Major "London": IV. Finale: Spiritoso  │ 1134          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Die Walküre: The Ride of the Valkyries                       │ 1707          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Requiem, Op.48: 4. Pie Jesu                                  │ 562           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Jupiter, the Bringer of Jollity                              │ 1135          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Branch Closing                                               │ 563           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Scheherazade, Op. 35: I. The Sea and Sindbad's Ship          │ 1136          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Scheherazade, Op. 35: I. The Sea and Sindbad's Ship          │ 1708          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Concerto No.2 in F Major, BWV1047, I. Allegro                │ 1709          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Concerto for Piano No. 2 in F Minor, Op. 21: II. Larghetto   │ 1710          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Karelia Suite, Op.11: 2. Ballade (Tempo Di Menuetto)         │ 1711          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Piano Sonata No. 14 in C Sharp Minor, Op. 27, No. 2, "Moonli │ 564           │
│ ght": I. Adagio sostenuto                                    │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Fantasia On Greensleeves                                     │ 1712          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Concerto for Cello and Orchestra in E minor, Op. 85: I. Adag │ 1713          │
│ io - Moderato                                                │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Two Fanfares for Orchestra: II. Short Ride in a Fast Machine │ 1137          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wellington's Victory or the Battle Symphony, Op.91: 2. Symph │ 1714          │
│ ony of Triumph                                               │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Romeo et Juliette: No. 11 - Danse des Chevaliers             │ 1715          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Symphonie Fantastique, Op. 14: V. Songe d'une nuit du sabbat │ 565           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Symphonie Fantastique, Op. 14: V. Songe d'une nuit du sabbat │ 1716          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Peer Gynt Suite No.1, Op.46: 1. Morning Mood                 │ 1717          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Symphony No. 41 in C Major, K. 551, "Jupiter": IV. Molto all │ 1718          │
│ egro                                                         │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rehab                                                        │ 566           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rehab                                                        │ 1138          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Know I'm No Good                                         │ 1139          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Me & Mr. Jones                                               │ 1140          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Just Friends                                                 │ 1719          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Back to Black                                                │ 1141          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Tears Dry On Their Own                                       │ 1142          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Wake Up Alone                                                │ 1720          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Some Unholy War                                              │ 1143          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ He Can Only Hold Her                                         │ 567           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ You Know I'm No Good (feat. Ghostface Killah)                │ 1144          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Rehab (Hot Chip Remix)                                       │ 1721          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Intro / Stronger Than Me                                     │ 1145          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ F**k Me Pumps                                                │ 1146          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ I Heard Love Is Blind                                        │ 1722          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Take the Box                                                 │ 1147          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Help Yourself                                                │ 1723          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Amy Amy Amy (Outro)                                          │ 1148          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Slowness                                                     │ 568           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Prometheus Overture, Op. 43                                  │ 569           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sonata for Solo Violin: IV: Presto                           │ 570           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ A Midsummer Night's Dream, Op.61 Incidental Music: No.7 Nott │ 1149          │
│ urno                                                         │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Suite No. 3 in D, BWV 1068: III. Gavotte I & II              │ 571           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Suite No. 3 in D, BWV 1068: III. Gavotte I & II              │ 1724          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Adios nonino                                                 │ 572           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Symphony No. 3 Op. 36 for Orchestra and Soprano "Symfonia Pi │ 1150          │
│ esni Zalosnych" \ Lento E Largo - Tranquillissimo            │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Act IV, Symphony                                             │ 573           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Music for the Funeral of Queen Mary: VI. "Thou Knowest, Lord │ 574           │
│ , the Secrets of Our Hearts"                                 │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Music for the Funeral of Queen Mary: VI. "Thou Knowest, Lord │ 1725          │
│ , the Secrets of Our Hearts"                                 │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Symphony No. 2: III. Allegro vivace                          │ 1151          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Partita in E Major, BWV 1006A: I. Prelude                    │ 575           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Sing Joyfully                                                │ 576           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Metopes, Op. 29: Calypso                                     │ 1152          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Symphony No. 2, Op. 16 -  "The Four Temperaments": II. Alleg │ 1726          │
│ ro Comodo e Flemmatico                                       │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Étude 1, In C Major - Preludio (Presto) - Liszt              │ 577           │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ Pini Di Roma (Pinien Von Rom) \ I Pini Della Via Appia       │ 1153          │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ String Quartet No. 12 in C Minor, D. 703 "Quartettsatz": II. │ 578           │
│  Andante - Allegro assai                                     │               │
├──────────────────────────────────────────────────────────────┼───────────────┤
│ String Quartet No. 12 in C Minor, D. 703 "Quartettsatz": II. │ 1727          │
│  Andante - Allegro assai                                     │               │
└──────────────────────────────────────────────────────────────┴───────────────┘
**/
-- Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.
/**
**/
-- Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.
/**
**/
-- Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.
/**
**/
-- Proporciona una consulta que muestre todas las facturas.
/**
**/
-- Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.
/**
**/
-- ¿Qué agente de ventas realizó más ventas en 2009?
/**
**/
-- Escribe una consulta que liste todas las canciones de una playlist.
/**
**/
-- Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.