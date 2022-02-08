using { sap.c4u.jobscheduler as js } from '../../db/models/JobScheduler/JobScheduler';
service JobSchedulerService @(path: '/api/jobscheduler/v1', requires: 'authenticated-user') { 
     @(  restrict: [
            { grant: ['WRITE'], to: 'Admin'},
            { grant: ['READ'], to: 'Admin'}
        ])
    @cds.persistence.skip
    entity Job as projection on js.Job {
        jobId,
        name,
        description,
        action,
        active,
        httpMethod,
        jobType,
        tenantId,
        subDomain,
        createdAt,
        ACTIVECOUNT,
        INACTIVECOUNT,
        schedules,
    }
}

