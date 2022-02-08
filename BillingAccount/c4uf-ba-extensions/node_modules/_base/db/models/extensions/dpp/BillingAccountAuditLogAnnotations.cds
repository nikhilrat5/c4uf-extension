using {
  sap.odm.utilities.billingaccount.BillingAccount,
  sap.odm.utilities.billingaccount.BillingAccountPartner,  
  sap.odm.utilities.billingaccount.AccountManagementData,
  sap.odm.utilities.billingaccount.PaymentControl,
  sap.odm.utilities.billingaccount.OutgoingPayment,
  sap.odm.utilities.billingaccount.IncomingPayment,
  sap.odm.utilities.billingaccount.TaxControl,
  sap.odm.utilities.billingaccount.DunningControl,
  sap.odm.utilities.billingaccount.CorrespondenceToOtherPartners,
  
} from '../../odm/billingaccount';

annotate BillingAccount with @AuditLog.Operation : {
  Read   : true,  Insert : true,  Update : true
};

annotate TaxControl with @AuditLog.Operation : {
  Read   : true,  Insert : true,  Update : true
};

annotate OutgoingPayment with @AuditLog.Operation : {
  Read   : true,  Insert : true,  Update : true
};

annotate IncomingPayment with @AuditLog.Operation : {
  Read   : true,  Insert : true,  Update : true
};

annotate AccountManagementData with @AuditLog.Operation : {
  Read   : true,  Insert : true,  Update : true
};

annotate BillingAccountPartner with @AuditLog.Operation : {
  Read   : true,  Insert : true,  Update : true
};

annotate DunningControl with @AuditLog.Operation : {
  Read   : true,  Insert : true,  Update : true
};

annotate CorrespondenceToOtherPartners with @AuditLog.Operation : {
  Read   : true,  Insert : true,  Update : true
};