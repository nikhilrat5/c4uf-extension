namespace sap.c4u.foundation.retailer.configuration;

using {sap.odm.common.codeList} from '../../../common-model/odm/common';

using {
    sap.odm.sales.CustomerOrder,
    sap.odm.sales.SalesProcessingStatusCode
} from '../../../common-model/odm/sales';

/**
 * Entity to specify the type of source
 */
entity CustomerOrderUtilitiesStatusMappingTypeCodes : codeList {
        /**
         * Code list entry
         */
         @(description: '{i18n>descriptionCustomerOrderUtilitiesStatusMappingTypeCodesCode}') 
    key code : String(2);
}

/*
 * Type for Customer Order status mapping type codes
 */
type CustomerOrderUtilitiesStatusMappingTypeCode : Association to one CustomerOrderUtilitiesStatusMappingTypeCodes;