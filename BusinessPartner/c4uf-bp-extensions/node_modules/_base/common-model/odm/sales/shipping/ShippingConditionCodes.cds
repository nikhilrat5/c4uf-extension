namespace sap.odm.sales.shipping;

using {sap.odm.common.codeList} from '../../common';

/**
 * Specifies the shipping strategy for a delivery; the strategy
 * can define, for example, that the goods must reach the
 * customer as soon as possible, the system proposes the
 * fastest shipping point and route.
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : true
entity ShippingConditionCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(2);
}

/**
 * Specifies the shipping strategy for a delivery; the strategy
 * can define, for example, that the goods must reach the
 * customer as soon as possible, the system proposes the
 * fastest shipping point and route.
 */
type ShippingConditionCode : Association to one ShippingConditionCodes;
