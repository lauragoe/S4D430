@AbapCatalog.sqlViewName: 'Z04CUSTASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 11'

define view Z04_CUSTOMER_WITH_PATH
    with parameters @Environment.systemField: #SYSTEM_DATE
                    P_FlightsBefore : abap.dats 
as select from Z04_ASSOCIATION as c{
    key customid as id,
    c._customer.name,
    c._customer.street,
    c._customer.postcode,
    c._customer.city,
    c._customer.country,
    @Semantics.amount.currencyCode: 'currency'
    sum(c.amount) as amount,
    @Semantics.currencyCode: true
    c.currency,
    avg(c.days_ahead) as days_ahead
}
where fldate < $parameters.P_FlightsBefore
group by
    customid,
    c._customer.name,
    c._customer.street,
    c._customer.postcode,
    c._customer.city,
    c._customer.country,
    c.currency
