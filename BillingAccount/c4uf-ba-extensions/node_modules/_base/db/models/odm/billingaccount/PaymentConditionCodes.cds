namespace sap.odm.utilities.billingaccount;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * Rules to determine the due dates for incoming payments and
 * the deadlines for outgoing payments
 */
entity PaymentConditionCodes : codeList {
        /**
         * Code list entry.
         */
    key code : String(4);
}

/**
 * Code to identify the Payment Terms
 */
type PaymentConditionCode : Association to one PaymentConditionCodes;
