namespace sap.odm.sales;

using {sap.odm.finance.accounting.PaymentTermsCode} from '../finance';
// EXCLUDED Dependency to Logistics
// using {sap.odm.logistics.ShippingPoint} from '../logistics';
// EXCLUDED Dependency to Plant
// using {sap.odm.orgunit.Plant} from '../orgunit';
using {
  sap.odm.sales.CustomerOrderItemRef,
  sap.odm.sales.shipping.DeliveryPriorityCode,
  sap.odm.sales.shipping.ShippingConditionCode,
} from '.';
using {sap.odm.sales.Incoterms} from './common';
using {sap.odm.sales.Quantity} from './types';

/**
 * Identifies a customer order as a sales order.
 */
aspect CustomerOrderSalesAspect : Incoterms {
  /**
   * Shipping condition of the sales order.
   */
  shippingCondition : ShippingConditionCode;
  /**
   * Payment terms of the sales order.
   */
  paymentTerms      : PaymentTermsCode;
}

/**
 * Item of the sales order.
 */
aspect CustomerOrderItemSalesAspect : Incoterms {
  /**
   * Plant of the sales order item.
   */
  // MODIFIED from managed association to unmanaged foreign key
  plant            : UUID; // Association to one Plant;
  /**
   * Physical location (for example, a warehouse or collection of
   * loading ramps) from which the sales order item is shipped.
   */
  // MODIFIED from managed association to unmanaged foreign key
  shippingPoint    : UUID; // Association to one ShippingPoint;
  /**
   * Specifies the priority of a delivery of the sales order
   * item.
   */
  deliveryPriority : DeliveryPriorityCode;
  /**
   * Divides an item in a sales order according to date and
   * quantity. For example, if the total quantity of an item can
   * only be delivered in four partial deliveries, the system
   * creates four schedule lines and determines the appropriate
   * quantities and delivery dates for each schedule line.
   */
  scheduleLines    : Composition of many SalesOrderScheduleLine;
  /**
   * Specifies conditions for payment in a sales order such as
   * discount rate or payment period.
   */
  paymentTerms     : PaymentTermsCode;
}

/**
 * Divides an item in a sales order according to date and
 * quantity. For example, if the total quantity of an item can
 * only be delivered in four partial deliveries, the system
 * creates four schedule lines and determines the appropriate
 * quantities and delivery dates for each schedule line.
 */
aspect SalesOrderScheduleLine {
  /**
   * ID of the sales order schedule line.
   */
  key id       : SalesOrderScheduleLineId;
  /**
   * Quantity for the schedule line.
   */
  quantity     : Quantity;
  /**
   * Requested delivery date for the schedule line.
   */
  deliveryDate : DateTime;
}

/**
 * ID of the sales order schedule line.
 */
type SalesOrderScheduleLineId : String(4);

/**
 * Sales order schedule line reference.
 */
type SalesOrderScheduleLineRef : CustomerOrderItemRef {
  /**
   * ID of the sales order schedule line.
   */
  scheduleLineId : SalesOrderScheduleLineId
}
