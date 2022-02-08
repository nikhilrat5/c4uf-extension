
// This references the skeleton BusinessPartner under the node_modules folder
using BusinessPartnerService from '_base/srv/api/businesspartner/BusinessPartnerService';

// This references the extended entity model in the db folder
using sap.odm.businesspartner from '../db/BusinessPartnerModelExtention';

// This an example of creating a new entity in the service
extend service BusinessPartnerService with {
    entity ext__NewEntity as projection on businesspartner.ext__NewEntity;
}

// This an example of creating a new field in an existing entity in the service
extend projection BusinessPartnerService.BusinessPartner with {
    ext__newField,
}

