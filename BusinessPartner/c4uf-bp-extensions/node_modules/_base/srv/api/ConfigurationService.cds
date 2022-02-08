using {sap.c4u.foundation.retailer.configuration as configuration} from '../../db/models/configuration/index';
using {sap.odm.sales as sales} from '../../db/models/extensions/index';

/*
 * v1 ConfigurationService API
 */
service ConfigurationService @(
    path     : '/api/v1/config',
    requires : 'authenticated-user'
) {

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
    entity CustomerOrderUtilitiesStatusMapping          as projection on configuration.CustomerOrderUtilitiesStatusMapping {
        sourceSystem, sourceSystemStatus, processingStatus, type
    };

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
    entity CustomerOrderUtilitiesStatusSourceSystems    as projection on configuration.CustomerOrderUtilitiesStatusSourceSystems {
        sourceSystemId, destination, path, statusPath
    };

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
    entity CustomerOrderUtilitiesStatusMappingTypeCodes as projection on configuration.CustomerOrderUtilitiesStatusMappingTypeCodes {
        code, name, descr
    };
}
