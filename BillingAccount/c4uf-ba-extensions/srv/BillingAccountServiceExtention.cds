
// This references the skeleton BillingAccount under the node_modules folder
using BillingAccountService from '_base/srv/api/billingaccount/BillingAccountService';

// This references the extended entity model in the db folder
using sap.odm.utilities.billingaccount from '../db/BillingAccountModelExtension';

// This an example of creating a new entity in the service
extend service BillingAccountService with {
    entity ext__newBAEntity as projection on billingaccount.ext__BANewEntity;
  }

// This an example of creating a new field in an existing entity in the service
extend projection BillingAccountService.BillingAccount with {
   ext__newBAFieldStatus1,
   ext__newBAFieldStatus2
     
}
