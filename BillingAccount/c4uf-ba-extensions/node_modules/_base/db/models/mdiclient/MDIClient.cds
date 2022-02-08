// @Todo: Namespace change
namespace sap.c4u.foundation.retailer.mdiclient;

using {
  sap.odm.common.cuid,
  sap.odm.common.managed
  } from '../../../common-model/odm/common';

entity MDIClient: cuid {
  /**
    * Code list entry.
    */
  deltaLoad: Boolean;
}

entity DeltaTokenBookKeeping : cuid, managed {
  deltaToken: String(5000);
  status: DeltaTokenBookKeepingStatus;
  type: DeltaTokenBookKeepingType;
}

/**
 * Indicates the status of DeltaTokenBookKeeping
 */
type DeltaTokenBookKeepingStatus: String(8) enum {
  success = 'success';
  failed = 'failed';
};

/**
 * Indicates the type of DeltaTokenBookKeeping
 */
type DeltaTokenBookKeepingType: String(8) enum {
  BP = 'BP';
  PR = 'PR';
};
