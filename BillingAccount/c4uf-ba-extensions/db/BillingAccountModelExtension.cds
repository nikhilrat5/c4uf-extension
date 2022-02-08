namespace sap.odm.utilities.billingaccount;

// This references the skeleton BillingAccount under the node_modules folder
using sap.odm.utilities.billingaccount from '_base/db/models/odm/billingaccount/index';

// This an example of creating a new entity in the model with new field
entity ext__BANewEntity {
  newBAEntityFieldNote1      : String(12);
  newBAEntityFieldNote2      : String(12);
}

// This an example of creating a new field in an existing entity in the model
extend entity billingaccount.BillingAccount with {
    ext__newBAFieldStatus1 : String(12);
    ext__newBAFieldStatus2 : String(12);
}
