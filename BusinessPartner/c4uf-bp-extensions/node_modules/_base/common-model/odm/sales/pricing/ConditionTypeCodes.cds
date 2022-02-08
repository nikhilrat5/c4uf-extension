namespace sap.odm.sales.pricing;

using {sap.odm.common.codeList} from '../../common';

/**
 * Specifies the condition type, such as free-goods,
 * sales-based rebate, or gross price discount.
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : true
entity ConditionTypeCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(4);
}

/**
 * Specifies the condition type, such as free-goods,
 * sales-based rebate, or gross price discount.
 */
type ConditionTypeCode : Association to one ConditionTypeCodes;
