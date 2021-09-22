@AbapCatalog.sqlViewName: 'Z04CUSTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 9'
define view Z04_CUSTOMER_WITH_REVENUE as select from S4d430_Booking_And_Customer as c{
    key customid as id,
    c.name,
    c.street,
    c.postcode,
    c.city,
    c.country,
    @Semantics.amount.currencyCode: 'currency'
    sum( c.amount ) as amount,
    @Semantics.currencyCode: true
    c.currency,
    avg(c.days_ahead) as days_ahead
}
group by
    customid,
    c.name,
    c.street,
    c.postcode,
    c.city,
    c.country,
    c.currency
