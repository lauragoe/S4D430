@AbapCatalog.sqlViewName: 'Z04EXTENDED'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 8'
@AbapCatalog: {
    buffering: {
        status: #ACTIVE,
        type: #GENERIC,
        numberOfKeyFields: 4
    }
}
define view Z04_EXTENDED as select from Z04_BOOKING as b
association[1..1] to Z04_CUSTOMER as _customer
    on $projection.customid = _customer.id {
    key carrid,
    key connid,
    key fldate,
    key bookid,
    b.customid,
    b.currency,
    b.amount,
    b.days_ahead,
    _customer
//        c.name,
//        c.street,
//        c.postcode,
//        c.city,
//        c.country,
//        c.discount  
}
