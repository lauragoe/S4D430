@AbapCatalog.sqlViewName: 'Z04PARTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 10'
define view Z04_PARTNER_WITH_REVENUE as select from Z04_CUSTOMER_WITH_REVENUE as c{
    key id,
        'C' as type,
        name,
        street,
        postcode,
        city,
        country,
        amount,
        days_ahead
} union
select from S4d430_Agency_With_Revenue{
    key id,
        'A' as type,
        name,
        street,
        postcode,
        city,
        country,
        amount,
        days_ahead
}
