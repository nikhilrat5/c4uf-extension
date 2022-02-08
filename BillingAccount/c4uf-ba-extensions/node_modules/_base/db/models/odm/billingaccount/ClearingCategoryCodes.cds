namespace sap.odm.utilities.billingaccount;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * Clearing Category For Clearing Postings For example:
 * Standard Offsetting
 */
entity ClearingCategoryCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(4);
}

/**
 * Code to identify the Clearing Category
 */
type ClearingCategoryCode : Association to one ClearingCategoryCodes;