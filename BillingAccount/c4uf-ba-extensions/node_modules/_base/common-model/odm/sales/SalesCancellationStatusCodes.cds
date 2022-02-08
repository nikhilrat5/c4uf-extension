namespace sap.odm.sales;

using {sap.odm.common.codeList} from '../common';

/**
 * Specifies the status of the cancellation; the overall
 * cancellation status is derived from the cancellation status
 * of the individual items of the sales document.
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : false
@odm.doc.relatedGDT   : 'RejectionStatusCode'
entity SalesCancellationStatusCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(2);
}

/**
 * Specifies the status of the cancellation; the overall
 * cancellation status is derived from the cancellation status
 * of the individual items of the sales document.
 */
type SalesCancellationStatusCode : Association to one SalesCancellationStatusCodes;
