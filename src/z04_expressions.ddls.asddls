@AbapCatalog.sqlViewName: 'Z04EXPR'
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
define view Z04_EXPRESSIONS as select from sbook as b
inner join scustom as c
    on b.customid = c.id {
    key b.mandt,
    key carrid,
    key connid,
    key fldate,
    key bookid,
    case class
        when 'Y' then 'Economy'
        when 'C' then 'Business'
        when 'F' then 'First'
        else '???'
    end as class,
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
    c.country,
    @EndUserText.label: 'Discount Factor'
    @EndUserText.quickInfo: 'Customer Specific Discount Factor'
    cast (c.discount as abap.fltp) / 100.0  as discount   
}
where cancelled <> 'X'
