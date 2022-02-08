namespace sap.odm.sales;

using {sap.odm.common.codeList} from '../common';

/**
 * Specifies the processing status of a sales document.
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : true
@odm.doc.relatedGDT   : 'ProcessingStatusCode'
entity SalesProcessingStatusCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(2);
}

/**
 * Specifies the processing status of a sales document.
 */
type SalesProcessingStatusCode : Association to one SalesProcessingStatusCodes;
