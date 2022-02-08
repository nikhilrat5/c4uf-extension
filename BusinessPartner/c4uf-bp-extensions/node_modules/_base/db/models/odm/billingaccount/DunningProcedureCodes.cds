namespace sap.odm.utilities.billingaccount;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * The dunning procedure controls how dunning is carried out by
 * the system
 */
entity DunningProcedureCodes : codeList {
        /**
         * Code list entry.
         */
    key code : String(2);
}

/**
 * Code to identify the Dunning Procedure
 */
type DunningProcedureCode : Association to one DunningProcedureCodes;
