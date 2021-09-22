@AbapCatalog.sqlViewName: 'Z04CUSTREV2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 11'

define view Z04_Customer_With_Parameter
    with parameters @Environment.systemField: #SYSTEM_DATE
                    P_FlightsBefore : abap.dats 
as select from  S4d430_Booking_And_Customer as c{
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
where fldate < $parameters.P_FlightsBefore
group by
    customid,
    c.name,
    c.street,
    c.postcode,
    c.city,
    c.country,
    c.currency
