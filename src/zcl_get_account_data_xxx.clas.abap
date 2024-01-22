CLASS zcl_get_account_data_xxx DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GET_ACCOUNT_DATA_XXX IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_accounts type ZTT_ACCOUNTS_XXX.

    select * from ZACCOUNTS_XXX
    into table @lt_accounts.

    out->write( EXPORTING
    data = lt_accounts
    name = 'Accounts:' ).


  ENDMETHOD.
ENDCLASS.
