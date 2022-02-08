namespace sap.odm.utilities.sales;

using {sap.odm.common.codeList} from '../../common';

/**
 * Specifies the type of a customer order item utilities
 * subsequent document.
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : true
entity CustomerOrderItemUtilitiesSubsequentDocumentCodes : codeList {
        /**
         * Specifies the type of a customer order item utilities
         * subsequent document.
         */
    key code : String(4);
}

/**
 * Specifies the type of a customer order item utilities
 * subsequent document.
 */
type CustomerOrderItemUtilitiesSubsequentDocumentCode : Association to one CustomerOrderItemUtilitiesSubsequentDocumentCodes;
