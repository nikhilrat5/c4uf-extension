namespace sap.odm.finance.accounting;

using {sap.odm.common.codeList} from '../../common';

/**
 * Key for defining payment terms composed of cash discount
 * percentages and payment periods. It is used in customers
 * orders, purchase orders, and invoices. Terms of payment
 * provide information for: Cash management, Dunning
 * procedures, Payment transactions.
 */
@odm.doc.alternateTerms : ['Cash discount']
@odm.doc.SAPDelivered   : true
@odm.doc.extensible     : true
entity PaymentTermsCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(4);
}

/**
 * Key for defining payment terms composed of cash discount
 * percentages and payment periods. It is used in customers
 * orders, purchase orders, and invoices. Terms of payment
 * provide information for: Cash management, Dunning
 * procedures, Payment transactions.
 */
type PaymentTermsCode : Association to one PaymentTermsCodes;
