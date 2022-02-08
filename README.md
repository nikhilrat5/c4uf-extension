### Allowing Extensibility in `package.json`
By default, CAP model extensibility is disabled. To enable it, the `mtx` field in the `package.json` has to be updated:
- `element-prefix`: lists the allowed prefixes for the names of the extended entities and fields.

   ```
   "element-prefix": [ "ext__"]
   ```
- `namespace-blacklist`: lists all the namespaces and services that cannot be extended

   ```
   "namespace-blacklist": [ "com.sap." ]
   ```
- `extension-allowlist`: lists all the namespaces and services that can be extended. This is also where a max limit of number of "new-fields" and "new-entities" can be set.

   ```
   "extension-allowlist": [{
      "for": [
         "sap.odm.businesspartner.BusinessPartner",
         "sap.odm.utilities.billingaccount.BillingAccount",
         "BusinessPartnerService.BusinessPartner",
         "BillingAccountService.BillingAccount"
      ],
      new-fields": 10
   }, {
      "for": [
         "BusinessPartnerService",
         "BillingAccountService"
      ],
      "new-entities": 3
   }]
   ```

### Getting The Activated Extenstions
1. In BTP, add the necessary role collections for extensibility under your name in the consumer subaccount where the extensibility will be done
   - `ExtensionDeveloper` and `ExtensionDeveloperUndeploy` roles from `c4u-foundation-retailer-{{env}}` application
2. In your terminal, make sure you have the latest versions of the `cds` packages installed (eg. `@sap/cds`, `@sap/cds-dk`)
3. Make a folder where you want the extensions will be saved. Run `mkdir extensions` to create a folder called `extensions`
3. Run `cds extend -s "edomexttestframework" "https://c4u-foundation-retailer-dev-service.cfapps.eu10.hana.ondemand.com" -d "extensions" -p "my8JmcqGma"`
   - `-s edomexttestframework` is the subdomain of your consumer subaccount found in the Overview of the subaccount
   - `"https://c4u-foundation-retailer-dev-service.cfapps.eu10.hana.ondemand.com"` is the base endpoint of your application. This can be found in the Overview of the application in the retailer subaccount's space
   - `-d "extensions"` is the folder name of where the extensions will be save
   - `-p "my8JmcqGma"` is the temporary password that is taken from an authenication url (eg. https://edomexttestframework.authentication.eu10.hana.ondemand.com/passcode where `edomexttestframework` is the subdomain)
4. Running the previous command will populate the folder with the current extensions. It will have a `db`, `srv`, `node_modules` folders. The node_modules will contain a `_base` that contains a template of the base C4Uf. This `_base` folder is used for referencing entities/services that we are extending.

### Adding Extensions and Activation
1. In the extenstion folder, add your extensions by creating a `.cds` file in the `db` folder to extend the model and in the `srv` folder to extend the service

- For Business Partner : 
   ```
   // In ./db/BusinessPartnerExtension.cds

   namespace sap.odm.businesspartner;
   using sap.odm.businesspartner from '_base/db/models/extensions/index';

   // creating a new entity in the namespace
   entity ext__BusinessPartner1 {
     BP_id      : String(10);
   }

   // adding a new field to an existing entity in db
   extend entity businesspartner.BusinessPartner with {
     ext__BP_field1 : String(10);
   }
   ```
   ```
   // In ./srv/BusinessPartnerServiceExtension.cds
   using BusinessPartnerService from '_base/srv/api/businesspartner/BusinessPartnerService';
   using sap.odm.businesspartner from '../db/BusinessPartnerExtension';

   // extending a service with a new entity
   extend service BusinessPartnerService with {
     entity ext__BusinessPartner1 as projection on businesspartner.ext__BusinessPartner1;
   }

   // extending an entity in a service with a new field
   extend projection BusinessPartnerService.BusinessPartner with {
     ext__BP_field1,
   }

   ```
- For Billing Account : 
   ```
   // In ./db/BillingAccountModelExtension.cds

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

   ```

   ```
  // In ./srv/BillingAccountServiceExtention.cds
   
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

   ```
2. Activate the extension by running `cds activate --to https://c4u-foundation-retailer-dev-service.cfapps.eu10.hana.ondemand.com -s edomexttestframework`
3. This would apply the extension to the edomexttestframework subaccount. Note that other subaccounts would not be affected.
4. To check the changes, run a Postman request GET /{api-bp}}/$metadata and see that the new `ext__` extensions are there

### Subsequent Activations: Overwriting / Undeploying Extensions
> It is recommended to run`cds extend` before running `cds activate` so you will have the currently activated extensions
- `cds activate --to https://c4u-foundation-retailer-dev-service.cfapps.eu10.hana.ondemand.com -s edomexttestframework`
   -  Subsequent `cds activate ...` will activate all the files that are currently in the extension folder and it will not change any extensions that are activated but are not present in the extension folder.
- `cds activate --undeploy --to https://c4u-foundation-retailer-dev-service.cfapps.eu10.hana.ondemand.com -s edomexttestframework` 
   - This is similar ot the command above except it will undeploy all the extensions that are activated but are not present in the extension folder.
   - This will replace all that the extensions that are activated with the ones that are in the extension folder.
- Note that the changes to data types has to be consistent with the values present in the database or this would result in an error and that removal of an extended field or entity results to the columns or table in the database getting deleted

### Useful Links and Commands
- Authentication URL: https://edomexttestframework.authentication.eu10.hana.ondemand.com/login
- `cds extend -s "edomexttestframework" "https://c4u-foundation-retailer-dev-service.cfapps.eu10.hana.ondemand.com" -d "extension"`
- `cds activate --to https://c4u-foundation-retailer-dev-service.cfapps.eu10.hana.ondemand.com -s edomexttestframework`
- `cds activate --undeploy --to https://c4u-foundation-retailer-dev-service.cfapps.eu10.hana.ondemand.com -s edomexttestframework`
- MDI extensibility URL: https://github.wdf.sap.corp/re-wunder/ONEmasterdata/blob/master/docs/documentation/development/extensibility.md#mdi-rest-extensibility
- CAP mtx API URL: https://pages.github.tools.sap/cap/docs/guides/deployment/as-saas#api-reference

### Sample Security Descriptor for MDI Extensibility Authorities 
```shell
{
  "xs-security": {
      "xsappname": "f0943167-f635-4d4c-be7c-dc6af0f14e61",
      "authorities": ["$XSMASTERAPPNAME.ExtendCDSdelete", 
"$XSMASTERAPPNAME.BPGenericConfigRead", 
"$XSMASTERAPPNAME.BPGenericConfigWrite",
"$XSMASTERAPPNAME.ExtendCDS"]
  }
}
```
In AWS EXT subaccount, Instance "c4uext-mdi-admin" has been configured with the above descriptor.

### Extensibility Testing
- To test the extensibility is tricky one, so one way to test it with the existing [repository](https://github.wdf.sap.corp/c4u/extension_automation) and we have included separate script file [BA and BP Extension Test ](https://github.wdf.sap.corp/c4u/extension_automation/blob/master/ext_automation_jenkins_ba_bp.sh) which will automate the extension test. The idea is to:
1. Unsubscribe from C4U Foundation retailer application in a test subaccount [SAP C4Uf Extensibility Test Framework](https://cockpit.eu10.hana.ondemand.com/cockpit/#/globalaccount/f2c6eec6-550f-4723-b605-062af127df39/subaccount/4ec0e205-5d52-423e-a3c4-89a987bf4095/subaccountoverview)
2. Subscribe to C4U Foundation retailer application in a test subaccount [SAP C4Uf Extensibility Test Framework](https://cockpit.eu10.hana.ondemand.com/cockpit/#/globalaccount/f2c6eec6-550f-4723-b605-062af127df39/subaccount/4ec0e205-5d52-423e-a3c4-89a987bf4095/subaccountoverview)
3. Get the passcode to perform extension (this step requires Selenium docker step as the passcode retrieval is a browser based flow, no way to get the passcode via API😩), in interactive mode we can keep the passcode via cds login using npm module keytar. Unfortunately, keytar can't be used in headless mode via docker since it requires UI components; therefore, in Jenkins mode the script reruns selenium every time we need to get passcode (3 times).
4. Execute 'cds extend' command
5. Create new extended cds artifact in extension project for both Business Partner and Billing Account
6. Activate extension via 'cds activate' command
7. Undeploy extension via 'cds activate --undeploy'

### Notes
- According to the CAP documentation, the following can be extended
   - [The Data Model](https://pages.github.tools.sap/cap/docs/guides/extensibility/new#extend-the-data-model) (eg. `.cds` files under the `db` folder)
   - [The Service Model](https://pages.github.tools.sap/cap/docs/guides/extensibility/new#extend-the-service-model) (eg. `.cds` files under the `srv` folder)
   - [The UI Annotations](https://pages.github.tools.sap/cap/docs/guides/extensibility/new#extend-the-ui-annotations) (eg. `.cds` files under the `app` folder)
    > Note that extending `.js` implementation is not yet supported. [It is planned in the future but a timeline has not been decided yet](https://github.wdf.sap.corp/cap/issues/issues/10593)
- Here are sample extension repos:
   - [extension_automation](https://github.wdf.sap.corp/c4u/extension_automation)
   - [edom-retailer-extension-sample](https://github.wdf.sap.corp/c4u/edom-retailer-extension-sample)
- There's a plan to have a sample repo in https://github.com/SAP-samples/ in the future
- Separate sub-account SAP C4Uf Extensibility Test Framework used for automate testing the extension functionality.

