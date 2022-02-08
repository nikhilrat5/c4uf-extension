namespace sap.odm.finance.payment;

using {sap.odm.common.codeList} from '../../common';

/**
 * List of possible categories for payment cards. Examples:
 * Debit Card, Credit Card, ...
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : true
@odm.doc.relatedGDT   : 'PaymentCardCategoryCode'
entity PaymentCardCategoryCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(2);
}

/**
 * A specific category for a payment card.
 */
type PaymentCardCategoryCode : Association to one PaymentCardCategoryCodes;
