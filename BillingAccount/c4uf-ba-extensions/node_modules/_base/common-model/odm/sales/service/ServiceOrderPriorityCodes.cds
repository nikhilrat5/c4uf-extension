namespace sap.odm.sales.service;

using {sap.odm.common.codeList} from '../../common';

/**
 * Specifies the priority of a service order, such as high or
 * low.
 */
@odm.doc.alternateTerms : [
'Priority',
'Service document priority'
]
@odm.doc.SAPDelivered   : true
@odm.doc.extensible     : true
@odm.doc.relatedGDT     : 'PriorityCode'
entity ServiceOrderPriorityCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(1);
}

/**
 * Specifies the priority of a service order, such as high or
 * low.
 */
type ServiceOrderPriorityCode : Association to one ServiceOrderPriorityCodes;
