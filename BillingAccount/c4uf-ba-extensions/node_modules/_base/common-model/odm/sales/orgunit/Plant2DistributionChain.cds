namespace sap.odm.sales.orgunit;

using {sap.odm.common.cuid} from '../../common';
// EXCLUDED Dependency to Plant
// using {sap.odm.orgunit.Plant} from '../../orgunit';
using {
  sap.odm.sales.orgunit.DistributionChannelCode,
  sap.odm.sales.orgunit.SalesOrganization
} from './.';

/**
 * Maps a plant to a distribution chain. It consists of a sales
 * organization and a distribution channel. Entity needed due
 * to the n:m relationship of both.
 */
@ODM.root : true
entity Plant2DistributionChain : cuid {
  /**
   * Association to the plant.
   */
  // MODIFIED from managed association to unmanaged foreign key
  plant               : UUID; // Association to one Plant;
  /**
   * Association to the sales organization.
   */
  salesOrganization   : Association to one SalesOrganization;
  /**
   * For which Distribution Channel is this link valid?
   */
  distributionChannel : DistributionChannelCode;
}
