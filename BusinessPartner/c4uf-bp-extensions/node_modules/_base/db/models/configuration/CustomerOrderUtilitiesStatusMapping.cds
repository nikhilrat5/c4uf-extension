namespace sap.c4u.foundation.retailer.configuration;

using {
        sap.odm.sales.CustomerOrder,
        sap.odm.sales.SalesProcessingStatusCode
} from '../../../common-model/odm/sales';

using {sap.c4u.foundation.retailer.configuration.CustomerOrderUtilitiesStatusMappingTypeCode} from './CustomerOrderUtilitiesStatusMappingTypeCodes';
using {sap.c4u.foundation.retailer.configuration.CustomerOrderUtilitiesStatusSourceSystem} from './CustomerOrderUtilitiesStatusSourceSystem';


/**
 * Entity for source system Order Items status mapping to
 * Foundation CustomerOrder item Processing Status Code
 */
entity CustomerOrderUtilitiesStatusMapping {

            /**
             * Specifies the source system
             */
            @(description : '{i18n>descriptionCustomerOrderUtilitiesStatusMappingSourceSystem}')
        key sourceSystem       : CustomerOrderUtilitiesStatusSourceSystem;

            /**
             * Specifies the source system item status
             */
            @(description : '{i18n>descriptionCustomerOrderUtilitiesStatusMappingSourceSystemStatus}')
        key sourceSystemStatus : String(40);

            /**
             * Specifies the processing status of a sales document
             */
            @(description : '{i18n>descriptionCustomerOrderUtilitiesStatusMappingProcessingStatus}')
            processingStatus   : SalesProcessingStatusCode;

            /**
             * Specifies the type of source
             */
            @(description : '{i18n>descriptionCustomerOrderUtilitiesStatusMappingType}')
            type               : CustomerOrderUtilitiesStatusMappingTypeCode;
}

/**
 * View to get CustomerOrderItems processing statuses
 */
view CustomerOrderWithItems as
        select from CustomerOrder {
                id,
                items.id               as itemID,
                items.processingStatus as processingStatus
        };
