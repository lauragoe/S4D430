@AbapCatalog.sqlViewName: 'Z04SIMPLE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 3'
define view Z04_SIMPLE as select from sbook {
    carrid,
    connid,
    fldate,
    bookid,
    class,
    forcuram,
    forcurkey,
    luggweight,
    wunit,
    order_date,
    agencynum,
    counter,
    customid    
}
