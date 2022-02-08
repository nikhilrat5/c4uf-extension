namespace sap.odm.finance.payment;

using {sap.odm.common.codeList} from '../../common';

/**
 * List of possible payment card types.
 */
@odm.doc.SAPDelivered : false
@odm.doc.extensible   : true
@odm.doc.relatedGDT   : 'PaymentCardTypeCode'
entity PaymentCardTypeCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(4);
}

/**
 * A specific payment card type.
 */
type PaymentCardTypeCode : Association to one PaymentCardTypeCodes;