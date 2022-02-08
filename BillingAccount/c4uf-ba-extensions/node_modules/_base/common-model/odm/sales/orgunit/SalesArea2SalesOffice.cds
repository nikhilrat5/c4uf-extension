namespace sap.odm.sales.orgunit;

using {sap.odm.common.cuid} from '../../common';
using {
  sap.odm.sales.orgunit.SalesArea,
  sap.odm.sales.orgunit.SalesOffice,
} from './.';

/**
 * Maps sales area to sales office. Entity needed due to the
 * n:m relationship of both.
 */
@ODM.root : true
entity SalesArea2SalesOffice : cuid {
  /**
   * Associated sales area.
   */
  salesArea   : Association to one SalesArea;
  /**
   * Associated sales office.
   */
  salesOffice : Association to one SalesOffice;
}
