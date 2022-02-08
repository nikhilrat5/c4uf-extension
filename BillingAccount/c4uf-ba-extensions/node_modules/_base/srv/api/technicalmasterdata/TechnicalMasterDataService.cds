type createTMDResponse {
    mcmInstance : UUID;
    isSuccess   : String;
    message     : String(5000)
}

service TechnicalMasterDataService @(
    path     : '/api/internal/technicalmasterdata',
    protocol : 'odata',
    requires : 'authenticated-user',
    version  : 'v1'
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
    action generate(id : UUID) returns createTMDResponse;
}
