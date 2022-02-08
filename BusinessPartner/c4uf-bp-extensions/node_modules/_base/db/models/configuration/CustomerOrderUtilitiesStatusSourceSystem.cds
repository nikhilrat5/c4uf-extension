namespace sap.c4u.foundation.retailer.configuration;

/**
 * Entity for processingStatus source system Provides details
 * on source system ()
 */
entity CustomerOrderUtilitiesStatusSourceSystems {
        
        /**
         * Specifies the source system id
         */
        @(description: '{i18n>descriptionCustomerOrderUtilitiesStatusSourceSystemsSourceSystemId}')
    key sourceSystemId : String(200) ;
        
        /**
         * Source system host or destination
         */
        @(description: '{i18n>descriptionCustomerOrderUtilitiesStatusSourceSystemsDestination}') 
        destination    : String(1024);

        /**
         * Resource path within the source system
         */
         @(description: '{i18n>descriptionCustomerOrderUtilitiesStatusSourceSystemsPath}') 
        path           : String(1024);

        /**
         * Status property path within the message payload
         */
        @(description: '{i18n>descriptionCustomerOrderUtilitiesStatusSourceSystemsStatusPath}') 
        statusPath     : String(1000);
}

/*
 * Type for Customer Order status source system
 */
type CustomerOrderUtilitiesStatusSourceSystem : Association to one CustomerOrderUtilitiesStatusSourceSystems;