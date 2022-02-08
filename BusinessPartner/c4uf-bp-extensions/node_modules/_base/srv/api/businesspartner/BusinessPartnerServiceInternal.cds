using {
    sap.odm.common as common,
    sap.odm.finance as finance,
    sap.odm.sales as sales,
    sap.c4u.foundation.retailer.serviceprovider as serviceprovider,
    sap.odm.businesspartner as businesspartner
} from '../../../db';

service BusinessPartnerServiceInternal @(path: '/api/beta/bpinternal', requires: 'authenticated-user') { 
    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin', where: 'isBlocked = false' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity BusinessPartner as projection on businesspartner.BusinessPartner

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity LifecycleStatusCodes as projection on businesspartner.LifecycleStatusCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity TaxNumberTypeCodes as projection on businesspartner.TaxNumberTypeCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity IndustrySectorCodes as projection on businesspartner.IndustrySectorCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity IndustrySystemTypeCodes as projection on businesspartner.IndustrySystemTypeCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CompanyLegalFormCodes as projection on businesspartner.CompanyLegalFormCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity AddressDataUsageCodes as projection on businesspartner.AddressDataUsageCodes;

        @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity BusinessPartnerRoleCodes as projection on businesspartner.BusinessPartnerRoleCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CommunicationMethodCodes as projection on businesspartner.CommunicationMethodCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity GenderCodes as projection on common.GenderCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity LanguageCodes as projection on common.LanguageCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CountryCodes as projection on common.CountryCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CurrencyCodes as projection on common.CurrencyCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity TimeZoneCodes as projection on common.TimeZoneCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity IncotermsClassificationCodes as projection on common.IncotermsClassificationCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity FormOfAddressCodes as projection on common.address.FormOfAddressCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity AcademicTitleCodes as projection on common.address.AcademicTitleCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity FamilyNamePrefixCodes as projection on common.address.FamilyNamePrefixCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity FamilyNameSuffixCodes as projection on common.address.FamilyNameSuffixCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CountrySubdivisionCodes as projection on common.address.CountrySubdivisionCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity StreetCodes as projection on common.address.StreetCodes;

        @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity TownCodes as projection on common.address.TownCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity TaxCategoryCodes as projection on finance.TaxCategoryCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity PaymentCardTypeCodes as projection on finance.payment.PaymentCardTypeCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity PaymentCardCategoryCodes as projection on finance.payment.PaymentCardCategoryCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CheckVoidReasonCodes as projection on finance.payment.CheckVoidReasonCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerClassificationCodes as projection on sales.s4.CustomerClassificationCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerAccountGroupCodes as projection on sales.s4.CustomerAccountGroupCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity NielsenRegionCodes as projection on sales.s4.NielsenRegionCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity DataMediumExchangeIndicatorCodes as projection on sales.s4.DataMediumExchangeIndicatorCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity DataExchangeInstructionCodes as projection on sales.s4.DataExchangeInstructionCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerConditionGroupCodes as projection on sales.s4.CustomerConditionGroupCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CfopCategoryCodes as projection on sales.s4.CfopCategoryCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity IndustryCodes as projection on sales.s4.IndustryCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity AccountTaxTypeCodes as projection on sales.s4.AccountTaxTypeCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerOrderBlockingReasonCodes as projection on sales.CustomerOrderBlockingReasonCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerDeliveryBlockingReasonCodes as projection on sales.CustomerDeliveryBlockingReasonCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerBillingBlockingReasonCodes as projection on sales.CustomerBillingBlockingReasonCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity SalesPartnerRoleCodes as projection on sales.SalesPartnerRoleCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerTaxClassificationCodes as projection on sales.CustomerTaxClassificationCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerSalesArrangementGroupCodes as projection on sales.CustomerSalesArrangementGroupCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerSalesArrangementPriceGroupCodes as projection on sales.CustomerSalesArrangementPriceGroupCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity DivisionCodes as projection on sales.orgunit.DivisionCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity DeliveryPriorityCodes as projection on sales.shipping.DeliveryPriorityCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity MarketFunctionCodes as projection on serviceprovider.MarketFunctionCodes;
}
