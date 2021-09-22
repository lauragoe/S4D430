@AbapCatalog.sqlViewName: 'Z04BOOKCUST'
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
define view Z04_BOOKING_AND_CUSTOMER as select from Z04_BOOKING as b
inner join Z04_CUSTOMER as c
    on b.customid = c.id {
    key carrid,
    key connid,
    key fldate,
    key bookid,
    b.customid,
    b.class,
    b.currency,
    b.days_ahead,
    c.name,
    c.street,
    c.postcode,
    c.city,
    c.country,
    c.discount  
}
