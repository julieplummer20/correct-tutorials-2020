"! <p>Class fills table ZACCOUNTS_XXX with three rows of test data.</p>
"! <p>Implements the interface { @link INTF: if_oo_adt_classrun } </p>
"!
CLASS zcl_fill_accounts_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FILL_ACCOUNTS_001 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_accounts type table of zaccounts_xxx.

    "read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

    "fill internal table
    lt_accounts =

VALUE #( ( CLIENT ='100' BANK_CUSTOMER_ID ='000001' ACCOUNT_NUMBER ='00000000' BANK_NAME ='Volksbank' CITY = 'Gaertringen' BALANCE ='200.00 ' CURRENCY ='EUR' ACCOUNT_CATEGORY ='01' LASTCHANGEDAT = zv_tsl )
 ( CLIENT ='100' BANK_CUSTOMER_ID ='000002' ACCOUNT_NUMBER ='00000000' BANK_NAME ='Sparkasse' CITY ='Schwetzingen' BALANCE ='500.00 ' CURRENCY ='EUR' ACCOUNT_CATEGORY ='02' LASTCHANGEDAT = zv_tsl )
 ( CLIENT ='100' BANK_CUSTOMER_ID ='000003' ACCOUNT_NUMBER ='00000000' BANK_NAME ='Commerzbank' CITY ='Nuernberg' BALANCE ='150.00 ' CURRENCY ='EUR' ACCOUNT_CATEGORY ='02' LASTCHANGEDAT = zv_tsl )
 ).

   "Delete possible entries; insert new entries
    DELETE FROM ZACCOUNTS_XXX.

    INSERT ZACCOUNTS_XXX from table @lt_accounts.


    "Check result in console
    out->write( sy-dbcnt ).
    out->write(  'DONE!' ).


  ENDMETHOD.
ENDCLASS.
