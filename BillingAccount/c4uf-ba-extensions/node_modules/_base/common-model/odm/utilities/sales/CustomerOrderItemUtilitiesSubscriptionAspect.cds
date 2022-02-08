namespace sap.odm.utilities.sales;

using {
  sap.odm.common.cuid,
} from '../../common';

using {
    sap.odm.utilities.sales.CustomerOrderItemUtilitiesSubscriptionAspect,
} from './CustomerOrderUtilitiesApects';

extend CustomerOrderItemUtilitiesSubscriptionAspect with {
    /**
     * Technical resources of customer order item 
     */
    technicalResources: Composition of many SubscriptionTechnicalResourceAspect;
    /**
     * Header level custom reference for suscription billing
     */
    headerCustomReferences: Composition of many CustomReferenceAspect;
    /**
     * Item level custom reference for subscription billing
     */
    itemCustomReferences: Composition of many CustomReferenceAspect;
    /**
     * Subscription parameters for subscription billing
     */
	itemSubscriptionParameters: Composition of many SubscriptionParameterAspect;
}

/**
 * Technical resources of customer order item 
 */
aspect SubscriptionTechnicalResourceAspect : cuid {
    /**
     * Human-readable identifier for the technical resource of the customer order item.
     */
    resourceId: String(255);
    /**
     * Name of the customer order item technical resource.
     */
    resourceName: String(255);
}
/**
 * Subscription Parameter for Subscription Billing
 */
aspect SubscriptionParameterAspect: cuid {
    /**
     * Code related to Subscription Parameter
     */
	code: String(50);
    /**
     * Value related to Subscription Parameter
     */
	value: String(10);
}
/**
 * Custom Reference for Subscription Billing
 */
aspect CustomReferenceAspect: cuid {
    /**
     * Type Code related to Custom Reference
     */
	typeCode: String(255);
    /**
     * Non-GUID identifier related to Custom Reference
     */
	customReferenceId: String(255);
}
