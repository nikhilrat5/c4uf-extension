namespace sap.odm.sales.orgunit;

using {sap.odm.common.cuid, } from '../../common';
using {
  sap.odm.sales.orgunit.SalesOrganization,
  sap.odm.sales.orgunit.DistributionChannelCode,
  sap.odm.sales.orgunit.DivisionCode,
  sap.odm.sales.orgunit.SalesArea2SalesOffice,
} from './.';

/**
 * Sales area is a combination of sales organization,
 * distribution channel, and division.
 */
@odm.doc.alternateTerms : ['Vertriebsbereich']
@odm.doc.relatedGDT     : 'SlsArea'
@ODM.root               : true

entity SalesArea : cuid {
  /**
   * Human-readable identifier, which is the concatenation of the
   * IDs of the components.
   */
  displayId           : String(14);
  /**
   * Name of the sales area.
   */
  name                : localized String(20);
  /**
   * Sales organization.
   */
  salesOrganization   : Association to one SalesOrganization;
  /**
   * Division the sales area is assigned to.
   */
  division            : DivisionCode;
  /**
   * Distribution channel.
   */
  distributionChannel : DistributionChannelCode;
  /**
   * Sales offices assigned to the sales area. This is a n:m
   * relationship.
   */
  salesOffices        : Association to many SalesArea2SalesOffice
                          on salesOffices.salesArea = $self;
}
