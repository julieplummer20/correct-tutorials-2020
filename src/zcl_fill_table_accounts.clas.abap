CLASS zcl_fill_table_accounts DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FILL_TABLE_ACCOUNTS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: it_accounts type table of ZDB_ACCOUNT_001,
          it_accounts_2 type table of ZDB_ACCOUNT_001.

    "fill internal table, with VALUE : Fields Client Cust_ID Acc_num Bank_name
    it_accounts =

    VALUE #( ( CLIENT ='100' BANK_CUSTOMER_ID ='000001' ACCOUNT_NUMBER ='00000000' BANK_NAME ='' BALANCE ='200.00 ' CURRENCY ='EUR' ACCOUNT_CATEGORY ='Private' LASTCHANGEDAT ='0.0000000 '  )
 ( CLIENT ='100' BANK_CUSTOMER_ID ='000002' ACCOUNT_NUMBER ='00000000' BANK_NAME ='' BALANCE ='500.00 ' CURRENCY ='EUR' ACCOUNT_CATEGORY ='Business' LASTCHANGEDAT ='0.0000000 '  )
 ( CLIENT ='100' BANK_CUSTOMER_ID ='000003' ACCOUNT_NUMBER ='00000000' BANK_NAME ='' BALANCE ='150.00 ' CURRENCY ='EUR' ACCOUNT_CATEGORY ='Business' LASTCHANGEDAT ='0.0000000 '  )
 ).

    "Delete possible entries; insert new entries
    DELETE FROM ZDB_ACCOUNT_001.

    INSERT ZDB_ACCOUNT_001 from table @it_accounts.



    "Check result in console
    out->write( sy-dbcnt ).
    out->write(  'DONE!' ).
  ENDMETHOD.
ENDCLASS.
