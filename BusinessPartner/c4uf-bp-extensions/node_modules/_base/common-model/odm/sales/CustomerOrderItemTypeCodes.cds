namespace sap.odm.sales;

using {sap.odm.common.codeList} from '../common';

/**
 * Identifier for the characteristics of an item; the item type
 * distinguishes between different item categories such as free
 * of charge or text items (i.e. documents) and determines how
 * the system processes the item.
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : true
entity CustomerOrderItemTypeCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(4);
}

/**
 * Identifier for the characteristics of an item; the item type
 * distinguishes between different item categories such as free
 * of charge or text items (i.e. documents) and determines how
 * the system processes the item.
 */
type CustomerOrderItemTypeCode : Association to one CustomerOrderItemTypeCodes;
