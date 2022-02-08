namespace sap.c4u.foundation.retailer.configuration;

using {sap.odm.common.codeList} from '../../../common-model/odm/common';

using {
     sap.odm.sales.CustomerOrderItemTypeCode,
     sap.odm.sales.CustomerOrderTypeCode,
} from '../../../common-model/odm/sales';

/**
 * This entity determines the business scenarios to fulfill a
 * customer order during order distribution
 */
entity UtilitiesBusinessScenarios {
         /**
          * Identifies the type of the customer order
          */
     key customerOrderType          : CustomerOrderTypeCode;
         /**
          * Identifies the type of the customer order item
          */
     key customerOrderItemType      : CustomerOrderItemTypeCode;
         /**
          * Holds the value of external document type
          */
         externalDocumentType       : ExternalDocumentTypeCode;
         /**
          * Holds the value of Action to be performed
          */
         businessAction             : BusinessActionTypeCode;
         /**
          * √ Holds the value of External Document Header type
          */
         externalDocumentHeaderType : String(4);
         /**
          * Holds the value of External Document Item type
          */
         externalDocumentItemType   : String(4);
         /**
          * Holds the value of subscriptionProfile
          */
         subscriptionProfile        : String(25);
         /**
          * Identifies whether the template details were provided by SAP
          */
         sapProvided                : Boolean;
}


/**
 * Entity to specify the type of business action
 */
entity BusinessActionTypeCodes : codeList {
         /**
          * Code list entry
          */
     key code : String(10);
}

/*
 * Type for external document
 */
type BusinessActionTypeCode : Association to one BusinessActionTypeCodes;

/**
 * Entity to specify the type of external document
 */
entity ExternalDocumentTypeCodes : codeList {
         /**
          * Code list entry
          */
     key code : String(25);
}

/*
 * Type for external document type codes
 */
type ExternalDocumentTypeCode : Association to one ExternalDocumentTypeCodes;
