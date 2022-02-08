namespace sap.odm.utilities.billingaccount;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * A contract account category defines certain attributes for a
 * contract account, For example:
 *
 * - Whether you are allowed to assign only one business partner
 *   or more than one to a contract account,
 * - Whether you are allowed to assign only one contract or more
 *   than one,
 * - Whether you are allowed to maintain a contract account
 *   online,
 *
 * etc
 */
entity CategoryCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(2);
}

/**
 * Code identifying the Account Category.
 */
type CategoryCode : Association to one CategoryCodes;