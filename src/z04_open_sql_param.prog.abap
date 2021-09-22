*&---------------------------------------------------------------------*
*& Report S4D430_INTRO_S1
*&---------------------------------------------------------------------*

REPORT s4d430_intro_S1.

TYPES ty_t_customers TYPE STANDARD TABLE OF z04_customer_with_parameter
                         WITH NON-UNIQUE KEY id.

DATA gt_customers TYPE ty_t_customers.

* ALV Processing

DATA go_salv TYPE REF TO cl_salv_table.
DATA gx_excp TYPE REF TO cx_salv_error.

* Selection Screen

PARAMETERS pa_city TYPE s_city DEFAULT 'New York' LOWER CASE.

START-OF-SELECTION.

* Data Retrieval
************************************************************************

 SELECT * FROM z04_customer_with_parameter( P_FlightsBefore = @sy-datum )
           WHERE city = @pa_city
           order by city, name
           INTO TABLE @gt_customers.

 SELECT * FROM z04_customer_with_parameter
           WHERE city = @pa_city
           order by city, name
           INTO TABLE @gt_customers.
* output
***********************************************************************
  TRY.

  cl_salv_table=>factory(
    IMPORTING
      r_salv_table   = go_salv
    CHANGING
      t_table        = gt_customers
  ).

* Display
*-------------------------*

  go_salv->display( ).

CATCH cx_salv_error INTO gx_excp.    "
  MESSAGE gx_excp TYPE 'I'.
ENDTRY.