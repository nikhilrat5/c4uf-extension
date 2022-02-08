namespace sap.odm.utilities.billingaccount;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * Indicates whether a business partner is the account holder
 * for a contract account.
 */
entity BillingAccountRelationshipCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(2);
}

/**
 * Code identifying Relationship of Business Partner to the
 * Account.
 */
type BillingAccountRelationshipCode : Association to one BillingAccountRelationshipCodes;