namespace sap.odm.finance.payment;

using {sap.odm.common.codeList} from '../../common';

/**
 * List of possible void reasons for a check. Checks that can
 * be voided receive a description why they cannot be used as
 * means of payment (called void reason codes).
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : true
@odm.doc.relatedGDT   : 'CheckVoidReasonCode'
entity CheckVoidReasonCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(2);
}

/**
 * A specific void reason for a check.
 */
type CheckVoidReasonCode : Association to one CheckVoidReasonCodes;
