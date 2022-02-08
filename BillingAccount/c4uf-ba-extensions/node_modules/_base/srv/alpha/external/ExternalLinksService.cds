using {
    sap.odm.sales as sales,
    sap.alpha.c4u.foundation.retailer.external as external} from '../../../db/models/alpha/external/index';

service ExternalLinksService @(
    path     : '/api/alpha/external',
    requires : 'authenticated-user',
    version: 'alpha'
) {
    @(restrict : [
        {
            grant : ['WRITE'],
            to    : 'API.Write'
        },
        {
            grant : ['READ'],
            to    : 'API.Read'
        },
    ])
    entity ExternalLinks as projection on external.ExternalLinks {
        id, 
        customerOrder, 
        items, 
        measurementConceptInstancesAspect
    };

    @(restrict : [
        {
            grant : ['WRITE'],
            to    : 'API.Write'
        },
        {
            grant : ['READ'],
            to    : 'API.Read'
        },
    ])
    entity CustomerOrder as projection on sales.CustomerOrder {
        id
    }

    @(restrict : [
        {
            grant : ['WRITE'],
            to    : 'API.Write'
        },
        {
            grant : ['READ'],
            to    : 'API.Read'
        },
    ])
    entity CustomerOrderItems as projection on sales.CustomerOrder.items {
        up_,
        id
    }
   
};


