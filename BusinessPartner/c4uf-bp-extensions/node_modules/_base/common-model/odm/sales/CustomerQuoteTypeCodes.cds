namespace sap.odm.sales;

using {sap.odm.common.codeList} from '../common';

/**
 * Specifies the type of a customer quote.
 */
@odm.doc.alternateTerms : [
'Transaction type',
'Processing type'
]
@odm.doc.SAPDelivered   : true
@odm.doc.extensible     : true
entity CustomerQuoteTypeCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(4);
}

/**
 * Specifies the type of a customer quote.
 */
type CustomerQuoteTypeCode : Association to one CustomerQuoteTypeCodes;
