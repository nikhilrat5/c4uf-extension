namespace sap.c4u.foundation.retailer.serviceprovider;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * Codes for a service provider's corresponding market function 
 */
entity MarketFunctionCodes : codeList {
  /**
    * Code list entry.
    */
  key code : String(20);

   /**
   * A boolean flag that represents whether a location can only be tied to one market function.
   */
  unique   : Boolean;
}

/**
 * Codes for a service provider's market function
 */
type MarketFunctionCode : Association to one MarketFunctionCodes;
