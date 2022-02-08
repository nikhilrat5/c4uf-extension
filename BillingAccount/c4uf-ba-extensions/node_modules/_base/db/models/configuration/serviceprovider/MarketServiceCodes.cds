namespace sap.c4u.foundation.retailer.serviceprovider;

using {sap.odm.common.codeList} from '../../../../common-model/odm/common';

/**
 * Codes for a service that a market function provides
 */
entity MarketServiceCodes : codeList {
  /**
    * Code list entry.
    */
  key code : String(3);
}

/**
 * Codes for a service that a market function provides
 */
type MarketServiceCode : Association to one MarketServiceCodes;
