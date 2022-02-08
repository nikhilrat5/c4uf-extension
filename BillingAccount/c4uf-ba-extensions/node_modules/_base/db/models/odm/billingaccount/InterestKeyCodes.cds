namespace sap.odm.utilities.billingaccount;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * Key for determining the factors that influence interest
 * calculation and posting
 */
entity InterestKeyCodes : codeList {
        /**
         * Code list entry.
         */
    key code : String(2);
}

/**
 * Code to identify the Interest Key
 */
type InterestKeyCode : Association to one InterestKeyCodes;
