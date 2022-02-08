namespace sap.odm.sales.orgunit;

using {sap.odm.common.cuid, } from '../../common';
using {sap.odm.sales.orgunit.SalesOffice} from './.';

/**
 * A sales group is an organizational unit that performs and is
 * responsible for sales transactions.
 */
@odm.doc.alternateTerms : ['Verkäufergruppe']
@odm.doc.relatedGDT     : 'SlsGroup'
@ODM.root               : true
entity SalesGroup : cuid {
  /**
   * Human-readable identifier of a sales group.
   */
  displayId   : String(3);
  /**
   * Name of the sales group.
   */
  name        : localized String(20);
  /**
   * Sales office.
   */
  salesOffice : Association to one SalesOffice;
//TODO: check if a real Legal Entity must be referenced
}
