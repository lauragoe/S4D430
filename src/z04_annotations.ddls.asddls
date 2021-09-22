@AbapCatalog.sqlViewName: 'Z04ANNO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 5'
@AbapCatalog: {
    buffering: {
        status: #ACTIVE,
        type: #GENERIC,
        numberOfKeyFields: 4
    }
}
define view Z04_ANNOTATIONS as select from sbook as b
inner join scustom as c
    on b.customid = c.id {
    key b.mandt,
    key carrid,
    key connid,
    key fldate,
    key bookid,
    class,
    @Semantics.amount.currencyCode: 'currency'
    forcuram as amount,
    @Semantics.currencyCode: true
    forcurkey as currency,
    @Semantics.quantity.unitOfMeasure: 'wunit'
    luggweight,
    @Semantics.unitOfMeasure: true
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
