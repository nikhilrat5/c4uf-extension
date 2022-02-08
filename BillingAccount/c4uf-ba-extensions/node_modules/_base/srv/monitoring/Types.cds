type HealthReponse {
    overall: Health;
    cycletime: Double;
    timestamp: Timestamp;
    services: many HealthOfService; 
}

type HealthOfService {
    name: String;
    cycletime: Double;
    status: Health
}

type Health: String enum { UP = 'UP'; DOWN = 'DOWN' };