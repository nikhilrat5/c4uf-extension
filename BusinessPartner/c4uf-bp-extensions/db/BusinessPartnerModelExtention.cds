namespace sap.odm.businesspartner;

// This references the skeleton BusinessPartner under the node_modules folder
using sap.odm.businesspartner from '_base/db/models/extensions/index';

// This an example of creating a new entity in the model
entity ext__NewEntity {
    newEntityField    : String(10);
};

// This an example of creating a new field in an existing entity in the model
extend entity businesspartner.BusinessPartner with {
    ext__newField : String(10);
}

