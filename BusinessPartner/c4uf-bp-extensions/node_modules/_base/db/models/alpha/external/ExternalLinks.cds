namespace sap.alpha.c4u.foundation.retailer.external;

using {sap.odm.common.cuid} from '../../../../common-model/odm/common';

using {
    sap.odm.sales.CustomerOrder
} from '../../../../common-model/odm/sales';


/* --------------------------------------------------------------- */
/* Entities                                                        */
/* --------------------------------------------------------------- */
/**
 * Specifies the entity for storing links for customer order and external services
 */
entity ExternalLinks : cuid {
    /**
     * Specifies customer order id
     */
     customerOrder: Association to  CustomerOrder;
     /**
     * Specifies customer order item id
     */
     items: Composition of many CustomerOrder.items;  
    /**
     * Specifies link between customer order and measurement concept model
     */
    measurementConceptInstancesAspect: Composition of one MeasurementConceptInstancesAspect;
}

/**
 * Aspect to establish link between customer order and measurement concept model
 * 
 */
aspect  MeasurementConceptInstancesAspect: cuid {
   /**
    * Specifies identifier of measurement instance 
    */  
    measurementInstanceId: UUID;
}