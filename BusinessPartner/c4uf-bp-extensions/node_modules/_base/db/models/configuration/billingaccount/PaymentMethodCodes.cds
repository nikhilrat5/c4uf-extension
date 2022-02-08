namespace sap.odm.utilities.billingaccount;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * Key used to define payment method values to differentiate
 * BillingAccount outgoing/incoming payment methods validations.
 */
entity PaymentMethodCodes : codeList {
      /**
       * Code list entry.
       */
  key code           : String(4);
      /**
      * Identifier for Bank transfer payement method.
      */
      isBankTransfer : Boolean;
      /**
      * Identifier for  Card payment method.
      */
      isCardPayment  : Boolean;
}

/**
 * Code identifying Tolerance Group for Billing Account
 */
type PaymentMethodCode : Association to one PaymentMethodCodes;
