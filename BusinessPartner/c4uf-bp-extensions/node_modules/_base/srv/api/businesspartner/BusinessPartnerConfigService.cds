
using {
    sap.odm.common as common,
    sap.odm.finance as finance,
    sap.odm.sales as sales,
    sap.c4u.foundation.retailer.serviceprovider as serviceprovider,
    sap.odm.businesspartner as businesspartner,
} from '../../../db';


service BusinessPartnerConfigService @(path: '/api/businessPartner/v1/config', requires: 'authenticated-user') { 

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity TaxNumberTypeCodes as projection on businesspartner.TaxNumberTypeCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity AddressDataUsageCodes as projection on businesspartner.AddressDataUsageCodes;

        @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity BusinessPartnerRoleCodes as projection on businesspartner.BusinessPartnerRoleCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity TaxCategoryCodes as projection on finance.TaxCategoryCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerAccountGroupCodes as projection on sales.s4.CustomerAccountGroupCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity SalesPartnerRoleCodes as projection on sales.SalesPartnerRoleCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerTaxClassificationCodes as projection on sales.CustomerTaxClassificationCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerSalesArrangementGroupCodes as projection on sales.CustomerSalesArrangementGroupCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CustomerSalesArrangementPriceGroupCodes as projection on sales.CustomerSalesArrangementPriceGroupCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity DeliveryPriorityCodes as projection on sales.shipping.DeliveryPriorityCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity MarketFunctionCodes as projection on serviceprovider.MarketFunctionCodes;

}
