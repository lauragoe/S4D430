@AbapCatalog.sqlViewName: 'Z04JOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 4'
define view Z04_JOIN_AND_SELECTION as select from sbook as b
inner join scustom as c
    on b.customid = c.id {
    key carrid,
    key connid,
    key fldate,
    key bookid,
    class,
    forcuram as amount,
    forcurkey as currency,
    luggweight,
    wunit,
    order_date,
    agencynum,
    counter,
    customid,
    c.name,
    c.street,
    c.postcode,
    c.city,
    c.country    
}
where cancelled <> 'X'
