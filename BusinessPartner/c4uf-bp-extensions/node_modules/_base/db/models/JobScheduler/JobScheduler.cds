namespace sap.c4u.jobscheduler;


entity Job {
    key jobId: Integer;
    name: String;
    description: String;
    action: String;
    active: Boolean;
    httpMethod: String;
    jobType: String;
    @readonly
    tenantId: String;
    @readonly
    subDomain: String;
    @readonly
    createdAt: String;
    @readonly
    ACTIVECOUNT: Integer;
    @readonly
    INACTIVECOUNT: Integer;
    schedules: array of ScheduleResponse
    }

    type ScheduleResponse {
    cron : String;
    description: String;
    active : Boolean;
    startTime : DateFormat;
    endTime : DateFormat;
    time: DateFormat;
    data : String;
    @readonly
    nextRunAt : String;
    @readonly
    type: String;

 }

 type DateFormat {
    date: String;
    format: String;
}