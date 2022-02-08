namespace sap.odm.sales;

using {sap.odm.common.codeList} from '../common';

/**
 * Specifies the type of a customer order.
 */
@odm.doc.alternateTerms : [
'Sales Document Type',
'Transaction type'
]
@odm.doc.SAPDelivered   : true
@odm.doc.extensible     : true
entity CustomerOrderTypeCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(4);
}

/**
 * Specifies the type of a customer order.
 */
type CustomerOrderTypeCode : Association to one CustomerOrderTypeCodes;
