@AbapCatalog.sqlViewName: 'Z04CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 5'
@AbapCatalog: {
    buffering: {
        status: #ACTIVE,
        type: #GENERIC,
        numberOfKeyFields: 1
    }
}
define view Z04_CUSTOMER as select from scustom as c {
    key c.mandt,  
    key c.id,
    concat_with_space(form, name, 1) as name,
    c.street,
    c.postcode,
    c.city,
    c.country,
    @EndUserText.label: 'Discount Factor'
    @EndUserText.quickInfo: 'Customer Specific Discount Factor'
    division(cast (c.discount as abap.int4), 100, 2) as discount
    //cast (c.discount as abap.fltp) / 100.0  as discount   
}
