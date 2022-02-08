namespace sap.odm.utilities.billingaccount;

using {
    sap.odm.utilities.billingaccount.BillingAccount,
    sap.odm.utilities.billingaccount.BillingAccountPartner,
    sap.odm.utilities.billingaccount.AccountManagementData,
    sap.odm.utilities.billingaccount.PaymentControl,
    sap.odm.utilities.billingaccount.TaxControl,
    sap.odm.utilities.billingaccount.DunningControl,
    sap.odm.utilities.billingaccount.IncomingPayment,
    sap.odm.utilities.billingaccount.OutgoingPayment,
    sap.odm.utilities.billingaccount.CorrespondenceToOtherPartners
} from '../../odm/billingaccount';

using { sap.beta.c4u.foundation.retailer.dpp } from '../../extensions';

/* --------------------------------------------------------------- */
/* Extensions                                                      */
/* --------------------------------------------------------------- */
extend BillingAccount                   with dpp.DataRetentionManagerAspectOnlyIsBlocked;
extend BillingAccountPartner            with dpp.DataRetentionManagerAspectOnlyIsBlocked;
extend AccountManagementData            with dpp.DataRetentionManagerAspectOnlyIsBlocked;
extend PaymentControl                   with dpp.DataRetentionManagerAspectOnlyIsBlocked;
extend TaxControl                       with dpp.DataRetentionManagerAspectOnlyIsBlocked;
extend DunningControl                   with dpp.DataRetentionManagerAspectOnlyIsBlocked;
extend IncomingPayment                  with dpp.DataRetentionManagerAspectOnlyIsBlocked;
extend OutgoingPayment                  with dpp.DataRetentionManagerAspectOnlyIsBlocked;
extend CorrespondenceToOtherPartners    with dpp.DataRetentionManagerAspectOnlyIsBlocked;
