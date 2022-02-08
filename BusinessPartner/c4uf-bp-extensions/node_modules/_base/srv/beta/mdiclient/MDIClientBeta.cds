using { sap.c4u.foundation.retailer.mdiclient as mdiclient } from '../../../db/models/mdiclient/MDIClient';


service MDIClientServiceBeta @(
    path: '/api/beta/mdiClient/v2', 
    requires: 'authenticated-user', 
    version: 'beta',
    impl: 'srv/mdiclient/MDIClient'
) { 
    @(  restrict: [
        { grant: ['WRITE'], to: ['jobcallback','MasterData.Sync']},
        { grant: ['READ'], to: ['jobcallback','MasterData.Sync']}
    ])
    entity MDIClient as projection on mdiclient.MDIClient {
        deltaLoad
    }

    @(  restrict: [
        { grant: ['WRITE'], to: ['jobcallback','MasterData.Sync']},
        { grant: ['READ'], to: ['jobcallback','MasterData.Sync']}
    ])
    entity DeltaTokenBookKeeping as projection on mdiclient.DeltaTokenBookKeeping {
        id,
        deltaToken,
        status,
        type,
        createdAt
    }
}