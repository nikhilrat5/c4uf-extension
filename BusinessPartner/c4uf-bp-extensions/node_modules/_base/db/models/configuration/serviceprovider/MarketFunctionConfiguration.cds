namespace sap.c4u.foundation.retailer.serviceprovider;

using {
  sap.c4u.foundation.retailer.serviceprovider.MarketFunctionCode,
  sap.c4u.foundation.retailer.serviceprovider.MarketServiceCode,
} from '.';

using {
  sap.odm.sales.orgunit.DivisionCode,
} from '../../../../common-model/odm/sales';

using {
  sap.odm.common.cuid, 
} from '../../../../common-model/odm/common';

/**
 * Relationship between market function and 
 * market services per division
 */
entity MarketFunctionConfiguration {
  /**
   * Unique code corresponding to market service
   */
  key marketService             : MarketServiceCode;
  /**
   * Unique code corresponding to division
   */
  key division                  : DivisionCode;
  /**
   * Unique code corresponding to market function
   */
  marketFunction                : MarketFunctionCode;
};