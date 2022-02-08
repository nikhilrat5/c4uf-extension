using {sap.odm.sales as sales} from '../../../db';

type message : String(5000);

type orderFulfillResponseItems {
    orderItemId           :      String(6);
    createdDocumentNumber :      String(40);
    isSuccess             :      String;
    messages              : many message;
};

type orderFulfillResponse {
    orderId    :      UUID;
    orderItems : many orderFulfillResponseItems;
}

service DistributionService @(
    path     : '/api/internal/distribution',
    protocol : 'odata',
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
        },
    ])

    action distributeOrder(id : UUID) returns orderFulfillResponse;
};
