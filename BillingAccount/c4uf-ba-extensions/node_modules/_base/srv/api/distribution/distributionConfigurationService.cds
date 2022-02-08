using {sap.odm.sales as sales} from '../../../db';
using {sap.c4u.foundation.retailer.configuration as configuration} from '../../../db/models/configuration';

service DistributionConfigurationService @(
    path     : '/api/distribution/v1/config',
    protocol : 'odata',
    requires : 'authenticated-user'
) {

    // /*
    //  * Business Scenarios
    //  */
    @(restrict : [
        {
            grant : [
                'CREATE',
                'UPSERT',
                'UPDATE'
            ],
            to    : 'API.Write'
        },
        {
            grant : ['READ'],
            to    : 'API.Read'
        },
        {
            grant : [
                'DELETE',
                'UPDATE'
            ],
            to    : 'API.Delete',
            where : 'sapProvided = false'
        }
    ])
    entity UtilitiesBusinessScenarios as projection on configuration.UtilitiesBusinessScenarios {
        customerOrderType, customerOrderItemType, externalDocumentType, businessAction, externalDocumentHeaderType, externalDocumentItemType, subscriptionProfile, sapProvided
    }

    /*
     * Type codes
     */

    @(restrict : [
        {
            grant : ['WRITE'],
            to    : 'API.Write'
        },
        {
            grant : ['READ'],
            to    : 'API.Read'
        }
    ])

    entity BusinessActionTypeCodes    as projection on configuration.BusinessActionTypeCodes {
        code, name, descr
    }

    @(restrict : [
        {
            grant : ['WRITE'],
            to    : 'API.Write'
        },
        {
            grant : ['READ'],
            to    : 'API.Read'
        }
    ])


    entity ExternalDocumentTypeCodes  as projection on configuration.ExternalDocumentTypeCodes {
        code, name, descr
    }
};
