namespace sap.odm.sales;

using {sap.odm.common.codeList} from '../common';

/**
 * Specifies the reason for canceling a document such as a
 * sales quote or sales order. The cancellation can be done
 * either from your organization, for example to reject a
 * customer request for a credit memo, or from the customer,
 * for example if the price given in a quote is too high.
 */
@odm.doc.alternateTerms : ['Rejection reason']
@odm.doc.SAPDelivered   : true
@odm.doc.extensible     : true
@odm.doc.relatedGDT     : 'OrderRejectionReasonCode'
entity SalesCancellationReasonCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(2);
}

/**
 * Specifies the reason for canceling a document such as a
 * sales quote or sales order. The cancellation can be done
 * either from your organization, for example to reject a
 * customer request for a credit memo, or from the customer,
 * for example if the price given in a quote is too high.
 */
type SalesCancellationReasonCode : Association to one SalesCancellationReasonCodes;
