namespace sap.beta.c4u.foundation.retailer.dpp;

/* --------------------------------------------------------------- */
/* Aspects                                                         */
/* --------------------------------------------------------------- */

aspect DataRetentionManagerAspect {
    endOfBusinessDate : DateTime; // closed date or the date of payment, also considered as reference date from which residence & retention period is calculated
    maxDeletionDate   : DateTime; // date when retention period of data subject expires
    isBlocked         : Boolean default false; // Set to True if data subject residence period is over
}

aspect DataRetentionManagerAspectWithoutIsBlocked {
    endOfBusinessDate : DateTime; // closed date or the date of payment, also considered as reference date from which residence & retention period is calculated
    maxDeletionDate   : DateTime; // date when retention period of data subject expires
    // isBlocked         : Boolean default false; // Set to True if data subject residence period is over
}

aspect DataRetentionManagerAspectOnlyIsBlocked {
    // endOfBusinessDate : DateTime; // closed date or the date of payment, also considered as reference date from which residence & retention period is calculated
    // maxDeletionDate   : DateTime; // date when retention period of data subject expires
    isBlocked         : Boolean default false; // Set to True if data subject residence period is over
}