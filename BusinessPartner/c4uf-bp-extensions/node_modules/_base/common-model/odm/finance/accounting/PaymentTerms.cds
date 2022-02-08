namespace sap.odm.finance.accounting;

using {
  sap.odm.common.codeList,
  sap.odm.common.cuid
} from '../../common';
using {sap.odm.finance.accounting.PaymentBlockCode} from './';
using {sap.odm.finance.payment.PaymentMethodCode};

/**
 * The agreed conditions for the payment of the price charged
 * for products, such as due date and credit terms. Terms of
 * payment provide information for: Cash management, Dunning
 * procedures, Payment transactions and others.
 */

@ODM.root : true
entity PaymentTerms : cuid {
  /**
   * Code for defining payment terms composed of cash discount
   * percentages and payment periods.
   */
  paymentTermCode               : String(4);
  /**
   * Description of terms of payment.
   */
  description                   : String(30);
  /**
   * Day of the month until which the corresponding terms are
   * valid. Maximum number of digits is 2.
   */
  dayLimit                      : Integer;
  /**
   * Explanation of the terms of payment which is different to
   * the automatically created explanations.
   */
  ownExplanation                : String(50);
  /**
   * Indicates whether the payment term is intended to use for
   * Customer.
   */
  isAccountTypeCustomer           : Boolean;
  /**
   * Indicates whether the payment term is intended to use for
   * Vendor.
   */
  isAccountTypeVendor             : Boolean;
  /**
   * Calendar day with which the system overwrites the day of the
   * baseline date for payment of the line item.
   */
  fixedDay                      : Decimal(2, 0);
  /**
   * Number of months which the system adds to the calendar month
   * of the baseline date for payment.
   */
  additionalMonths              : Decimal(2, 0);
  /**
   * Payment block (default value).
   */
  blockCode                      : PaymentBlockCode;
  /**
   * Payment method.
   */
  paymentMethod                 : PaymentMethodCode;
  /**
   * Indicator that the document date is to be proposed in the
   * base date field during document entry.
   */
  isDocumentDate         : Boolean;
  /**
   * Indicator that no default value is required for the baseline
   * date for payment. You then have to enter the base date
   * manually during document entry.
   */
  isDefaultValue         : Boolean;
  /**
   * Indicator that the posting date is to be proposed in the
   * base date field during document entry.
   */
  isPostingDate          : Boolean;
  /**
   * Indicator that the entry date is to be proposed in the field
   * "Base date" during document entry.
   */
  isEntryDate            : Boolean;
  /**
   * Indicator that the invoiced amount is to be broken down into
   * partial amounts with different due dates.
   */
  isInstallmentPayments  : Boolean;
  /**
   * This indicator controls whether the terms of payment in a
   * recurring entry are to be taken from the customer or vendor
   * master record, if no terms of payment key has been entered
   * in the recurring entry original document.
   */
  isRecurringEntries     : Boolean;
  /**
   * 1. Cash Discount Percentage Rate. Cash discount percentage rate
   *    which is granted for payment within the specified period.
   */
  cashDiscount1Percentage       : Decimal(5, 3);
  /**
   * 1. Days from Baseline Date for Payment. Number of days
   *    following the baseline date for payment after which the
   *    payment must be made in order to make use of the
   *    corresponding cash discount terms and(or) to pay within the
   *    due date for net payment period.
   */
  cashDiscount1Days             : Decimal(3, 0);
  /**
   * 1. Due Date for Special Condition. Fixed calendar date as part
   *    of the date on which the first or second cash discount
   *    period ends and/or the date on which the due date for net
   *    payment is reached.
   */
  cashDiscount1DueDate          : Date;
  /**
   * 1. Additional Months for Special Condition. Number of months
   *    which are to be added to the baseline date for payment in
   *    order to determine the end of the first or second cash
   *    discount period and/or the date on which the due date for
   *    net payment is reached.
   */
  cashDiscount1AdditionalMonths : Decimal(2, 0);
  /**
   * 2. Cash Discount Percentage Rate. Cash discount percentage rate
   *    which is granted for payment within the specified period.
   */
  cashDiscount2Percentage       : Decimal(5, 3);
  /**
   * 2. Days from Baseline Date for Payment. Number of days
   *    following the baseline date for payment after which the
   *    payment must be made in order to make use of the
   *    corresponding cash discount terms and(or) to pay within the
   *    due date for net payment period.
   */
  cashDiscount2Days             : Decimal(3, 0);
  /**
   * 2. Due Date for Special Condition. Fixed calendar date as part
   *    of the date on which the first or second cash discount
   *    period ends and/or the date on which the due date for net
   *    payment is reached.
   */
  cashDiscount2DueDate          : Date;
  /**
   * 2. Additional Months for Special Condition. Number of months
   *    which are to be added to the baseline date for payment in
   *    order to determine the end of the first or second cash
   *    discount period and/or the date on which the due date for
   *    net payment is reached.
   */
  cashDiscount2AdditionalMonths : Decimal(2, 0);
  /**
   * Days from Baseline Date for Payment. Number of days
   * following the baseline date for payment after which the
   * payment must be made in order to pay within the due date for
   * net payment period.
   */
  netPaymentDays                : Decimal(3, 0);
  /**
   * Due Date for Special Condition. Fixed calendar date as part
   * of the date on which the due date for net payment is
   * reached.
   */
  netPaymentDueDate             : Date;
  /**
   * Additional Months for Special Condition. Number of months
   * which are to be added to the baseline date for payment in
   * order to determine the date on which the due date for net
   * payment is reached.
   */
  netPaymentAdditionalMonths    : Decimal(2, 0);
  /**
   * Explanation of First Payment Term.
   */
  explanation1Text              : String(50);
  /**
   * Explanation of Second Payment Term.
   */
  explanation2Text              : String(50);
  /**
   * Explanation of Net Payment Term.
   */
  explanationNetText            : String(50);
  /**
   * Description of the Validity Area of the Conditions.
   */
  descriptionValidity           : String(50);
}
