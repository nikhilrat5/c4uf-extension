namespace sap.odm.finance.accounting;

using {sap.odm.common.codeList} from '../../common';

/** Payment blocking key. */
@odm.doc.SAPDelivered   : true
@odm.doc.extensible     : true
entity PaymentBlockCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(1);
}

/**
 * Payment blocking key.
 */
type PaymentBlockCode : Association to one PaymentBlockCodes;
