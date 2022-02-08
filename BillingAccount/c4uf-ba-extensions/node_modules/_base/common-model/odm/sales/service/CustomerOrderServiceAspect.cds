namespace sap.odm.sales.service;

// EXCLUDED Dependency to AssetManagement
// using {sap.odm.assetmanagement.Equipment} from '../../assetmanagement';
using {
  sap.odm.sales.service.ServiceOrderPriorityCode,
  sap.odm.sales.service.ServiceOrganization,
} from '.';

/**
 * Service order aspect.
 */
aspect CustomerOrderServiceAspect {
  /**
   * Service organization for organizational management.
   */
  serviceOrganization     : Association to one ServiceOrganization;
  /**
   * Specifies the priority of a service order, such as high or
   * low.
   */
  priority                : ServiceOrderPriorityCode;
  /**
   * Specifies when the service is requested to start.
   */
  requestedServiceStartAt : DateTime;
  /**
   * Specifies when the requested service is due.
   */
  requestedServiceEndAt   : DateTime;
  /**
   * Reference objects in a service order.
   */
  referenceObjects        : Composition of many ServiceOrderReferenceObject;
}

/**
 * Service order aspect.
 */
aspect CustomerOrderItemServiceAspect {
  /**
   * Specifies when the service is planned to start.
   */
  plannedServiceStartAt : DateTime;
  /**
   * Specifies when the service is due.
   */
  plannedServiceEndAt   : DateTime;
  /**
   * Referenced objects in a service order.
   */
  referenceObjects      : Composition of many ServiceOrderItemReferenceObject;
}

/**
 * Reference object in a service order.
 */
aspect ServiceOrderReferenceObject {
  /**
   * Referenced equipment in a service order.
   */
  // MODIFIED from managed association to unmanaged foreign key
  key equipment : UUID; // Association to one Equipment;
}

/**
 * Reference object in a service order.
 */
aspect ServiceOrderItemReferenceObject {
  /**
   * Referenced equipment in a service order.
   */
  // MODIFIED from managed association to unmanaged foreign key
  key equipment : UUID; // Association to one Equipment;
}
