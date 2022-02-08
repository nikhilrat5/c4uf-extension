namespace sap.odm.sales;

using {sap.odm.common.codeList} from '../common';

/**
 * Specifies a reason why the specific customer order is
 * entered into the system.
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : true
@odm.doc.relatedGDT   : 'CustomerTransactionDocumentReasonCode'
entity CustomerOrderReasonCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(4);
}

/**
 * Specifies a reason why the specific customer order is
 * entered into the system.
 */
type CustomerOrderReasonCode : Association to one CustomerOrderReasonCodes;
