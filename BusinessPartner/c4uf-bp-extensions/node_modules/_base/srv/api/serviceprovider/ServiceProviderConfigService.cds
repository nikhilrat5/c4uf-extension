using {
    sap.odm.common as common,
    sap.c4u.foundation.retailer.serviceprovider as serviceprovider,
    sap.odm.sales as sales,
} from '../../../db';

service ServiceProviderConfigService @(path: '/api/serviceProvider/v1/config', requires: 'authenticated-user') { 
    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read'}
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity MarketFunctionConfiguration as projection on serviceprovider.MarketFunctionConfiguration {
        marketService,
        division,
        marketFunction
    }
    
    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read'}
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity MarketFunctionCodes as projection on serviceprovider.MarketFunctionCodes
    
    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read'}
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity MarketServiceCodes as projection on serviceprovider.MarketServiceCodes
    
    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read'}
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity DivisionCodes as projection on sales.orgunit.DivisionCodes
}