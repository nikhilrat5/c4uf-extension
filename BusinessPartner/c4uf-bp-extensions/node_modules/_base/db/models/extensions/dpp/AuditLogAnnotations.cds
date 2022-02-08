using {
  sap.odm.sales.CustomerOrder,
  sap.odm.sales.CustomerOrderItem,
  sap.odm.sales.CustomerOrderNote,
  sap.odm.sales.CustomerOrderPriceComponent,
  sap.odm.sales.CustomerOrderItemSalesAspect,
  sap.odm.sales.SalesOrderScheduleLine,
  sap.odm.sales.service.CustomerOrderItemServiceAspect,
  sap.odm.sales.service.ServiceOrderItemReferenceObject,
  sap.odm.sales.CustomerOrderPartner,
  sap.odm.sales.SalesDocumentAddress,
  sap.odm.sales.CustomerOrderPartnerInternalRef,
  sap.odm.sales.CustomerOrderSalesAspect,
  sap.odm.sales.service.CustomerOrderServiceAspect,
  sap.odm.sales.service.ServiceOrderReferenceObject
} from '../../../../common-model/odm/sales';


using {
    sap.odm.utilities.sales.CustomerOrderItemUtilitiesAspect,
    sap.odm.utilities.sales.CustomerOrderItemUtilitiesReferenceObjectAspect,
    sap.odm.utilities.sales.CustomerOrderItemUtilitiesSubsequentDocumentAspect,
    sap.odm.utilities.sales.CustomerOrderItemUtilitiesSubscriptionAspect
} from '../../../../common-model/odm/utilities';

annotate CustomerOrder with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderItem with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderNote  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderPriceComponent  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderItemSalesAspect  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate SalesOrderScheduleLine  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderItemServiceAspect  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate ServiceOrderItemReferenceObject  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderPartner  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate SalesDocumentAddress  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderPartnerInternalRef  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderSalesAspect  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderServiceAspect  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderItemUtilitiesAspect  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderItemUtilitiesReferenceObject  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderItemUtilitiesSubsequentDocumentAspect  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate CustomerOrderItemUtilitiesSubscriptionAspect  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};
annotate ServiceOrderReferenceObject  with @AuditLog.Operation: {Insert: true, Update: true, Delete: true};