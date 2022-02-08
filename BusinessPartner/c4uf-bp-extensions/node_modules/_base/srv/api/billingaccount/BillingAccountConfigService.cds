
using {sap.odm.utilities.billingaccount as ba} from '../../../db';
using {sap.odm.utilities.billingaccount as bac} from '../../../db/models/configuration/billingaccount';

/**
 * Service definition
 */
service BillingAccountConfigService
@(  path: '/api/billingAccount/v1/config', 
    requires: 'authenticated-user') {
    /**
     * Templates for Billing accounts
     */
    @(restrict: [
        { grant: ['WRITE'], to: 'API.Write'},
        { grant: ['READ'], to: 'API.Read'}
    ])
    entity BillingAccountTemplates as projection on bac.BillingAccountTemplates
    {
        templateId,
        category,
        billingAccountRelationship,
        toleranceGroup,
        clearingCategory,
        paymentCondition,
        accountDeterminationCode,        
        companyCodeGroup,
        standardCompanyCode,
        incomingPaymentMethod,
        outgoingPaymentMethod,
        supplyingCountry,
        dunningProcedure,
        interestKey
    };   
    
    /**
     * Entities for codelists
     */
    @(restrict: [
        { grant: ['WRITE'], to: 'API.Write'},
        { grant: ['READ'], to: 'API.Read'
        }
    ])
    entity CategoryCodes as projection on ba.CategoryCodes;

    @(restrict: [
        { grant : ['WRITE'], to: 'API.Write'},
        { grant : ['READ'], to: 'API.Read'}
    ])
    entity BillingAccountRelationshipCodes as projection on ba.BillingAccountRelationshipCodes;

    @(restrict: [
        { grant: ['WRITE'], to: 'API.Write'},
        { grant: ['READ'], to: 'API.Read'}
    ])
    entity ClearingCategoryCodes as projection on ba.ClearingCategoryCodes;
    
    @(restrict: [
        { grant: ['WRITE'], to: 'API.Write'},
        { grant: ['READ'], to: 'API.Read'}
    ])
    entity DunningProcedureCodes as projection on ba.DunningProcedureCodes;

    @(restrict: [
        { grant: ['WRITE'], to: 'API.Write'},
        { grant: ['READ'], to: 'API.Read'}
    ])
    entity ToleranceGroupCodes as projection on ba.ToleranceGroupCodes;

    @(restrict: [
        { grant: ['WRITE'], to: 'API.Write'},
        { grant: ['READ'], to: 'API.Read'}
    ])
    entity AccountDeterminationIdCodes as projection on ba.AccountDeterminationIdCodes;

    @(restrict: [
        { grant: ['WRITE'], to: 'API.Write'},
        { grant: ['READ'], to: 'API.Read'}
    ])
    entity PaymentConditionCodes as projection on ba.PaymentConditionCodes;

        @(restrict: [
        { grant: ['WRITE'], to: 'API.Write'},
        { grant: ['READ'], to: 'API.Read'}
    ])
    entity PaymentMethodCodes as projection on ba.PaymentMethodCodes;

    @(restrict: [
        { grant: ['WRITE'], to: 'API.Write'},
        { grant: ['READ'], to: 'API.Read'}
    ])
    entity InterestKeyCodes as projection on ba.InterestKeyCodes;
}