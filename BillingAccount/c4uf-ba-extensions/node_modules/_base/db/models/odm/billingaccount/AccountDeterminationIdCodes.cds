namespace sap.odm.utilities.billingaccount;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * Characteristic that, together with the company code, the
 * division, the main transaction and, where relevant, the
 * subtransaction, determines a general ledger account.
 */
entity AccountDeterminationIdCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(2);
}

/**
 * Account determination ID for IS-U contract accounts
 */
type AccountDeterminationIdCode : Association to one AccountDeterminationIdCodes;