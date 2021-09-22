@AbapCatalog.sqlViewAppendName: 'Z04EXTENSION'
@EndUserText.label: 'exercise 14'
extend view Z04_EXTENDED with Z04_EXTENSION
    association[1] to spfli as _connection
        on b.carrid = _connection.carrid
        and b.connid = _connection.connid
{
  b.class,
  b.counter,
  _connection
}
