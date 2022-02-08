namespace sap.odm.utilities.billingaccount;

using { sap.odm.common.CountryCode, 
} from '../../../../common-model/odm/common';

/** reference to codeLists in index.cds */
using { 
        sap.odm.utilities.billingaccount.CategoryCode,
        sap.odm.utilities.billingaccount.BillingAccountRelationshipCode,
        sap.odm.utilities.billingaccount.ToleranceGroupCode, 
        sap.odm.utilities.billingaccount.ClearingCategoryCode,
        sap.odm.utilities.billingaccount.AccountDeterminationIdCode,
        sap.odm.utilities.billingaccount.DunningProcedureCode,
        sap.odm.utilities.billingaccount.PaymentConditionCode,
        sap.odm.utilities.billingaccount.InterestKeyCode
       }
        from '../../odm/billingaccount';

/**
 * This entity holds the values for fields of BillingAccount
 */
entity BillingAccountTemplates {
        /**
         * Identifies the template
         */
    key templateId  : String(100) not null;
 
        category                        : CategoryCode;
        billingAccountRelationship      : BillingAccountRelationshipCode;
        toleranceGroup                  : ToleranceGroupCode;        
        clearingCategory                : ClearingCategoryCode;        
        paymentCondition                : PaymentConditionCode ;
        accountDeterminationCode        : AccountDeterminationIdCode;
        
        companyCodeGroup                : String(4);
        standardCompanyCode             : String(4);        
        
        incomingPaymentMethod           : String(1);
        outgoingPaymentMethod           : String(5);
        
        supplyingCountry                : CountryCode;
        
        dunningProcedure                : DunningProcedureCode;
        interestKey                     : InterestKeyCode;
} 