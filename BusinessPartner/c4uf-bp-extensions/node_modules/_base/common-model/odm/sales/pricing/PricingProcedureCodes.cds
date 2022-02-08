namespace sap.odm.sales.pricing;

using {sap.odm.common.codeList} from '../../common';

/**
 * Specifies the pricing procedure; a pricing procedure defines
 * the pricing conditions and the sequence in which the system
 * takes these conditions into account during pricing.
 */
@odm.doc.SAPDelivered : true
@odm.doc.extensible   : true
@odm.doc.relatedGDT   : 'PricingProcedureCode'
entity PricingProcedureCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(6);
}

/**
 * Specifies the pricing procedure; a pricing procedure defines
 * the pricing conditions and the sequence in which the system
 * takes these conditions into account during pricing.
 */
type PricingProcedureCode : Association to one PricingProcedureCodes;
