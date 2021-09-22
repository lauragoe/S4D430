@AbapCatalog.sqlViewName: 'Z04BOOK'
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
define view Z04_BOOKING as select from sbook as b {
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
    @Semantics.amount.currencyCode: 'CURRENCY'
    currency_conversion( 
        amount => forcuram,
        source_currency => forcurkey,
        round => 'X',
        target_currency => cast( 'USD' as abap.cuky),
        exchange_rate_type => 'M',        
        exchange_rate_date => order_date,
        error_handling => 'SET_TO_NULL') as amount,
    @Semantics.currencyCode: true
    cast( 'USD' as abap.cuky) as currency,
    @Semantics.quantity.unitOfMeasure: 'wunit'
    luggweight,
    @Semantics.unitOfMeasure: true
    wunit,
    order_date,
    dats_days_between(b.order_date, b.fldate) as days_ahead,
    agencynum,
    counter,
    customid
}
where cancelled <> 'X'
