namespace sap.odm.utilities.billingaccount;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * Key used to define agreements for tolerance values in the
 * case of payment differences.
 */
entity ToleranceGroupCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(4);
}

/**
 * Code identifying Tolerance Group for Billing Account
 */
type ToleranceGroupCode : Association to one ToleranceGroupCodes;