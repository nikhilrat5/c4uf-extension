type DataSubjectRole : String enum { BusinessPartner = 'BusinessPartner'; } 

type LegalGround: String enum { CustomerOrder = 'CustomerOrder'; }

type StartTime: String enum { endOfBusinessDate = 'endOfBusinessDate'; }

type DataSubjects {
    dataSubjectID: String
}

type LegalEntitiesResidenceRules {
    legalEntity: String;
    residenceRules: many ResidenceSet;
}

type ResidenceSet {
    residenceDate: String;
    conditionSet: many ConditionSet
}

type ConditionSet {
    conditionFieldName: String;
    conditionFieldValue: String;
}

type LegalEntity {
    legalEntity: String;
}

type RuleCondition {
    retentionID: String;
    conditionSet: many ConditionSet;
}

type RetentionRule {
    legalEntity: String;
    retentionPeriod: String;
    retentionUnit: String enum {DAY = 'DAY'; MON = 'MON'; ANN = 'ANN'};
    conditionSet: many ConditionSet;
}

type DataSubjectsEndofResidenceRespose {
    success: many DataSubjects;
    nonConfirmCondition: many DataSubjects;
}

type DataSubjectEndofBusinessResponse {
        dataSubjectExpired: Boolean;
        dataSubjectNotExpiredReason: String;
    };

type DataSubjectLastRetentionStartDatesResponse {
        retentionID: String;
        retentionStartDate: String;
    };


type DataSubjectInformationReponse {
        dataSubjectId: String;
        name: String;
        emailId: String;
    };
    
type LegalEntitiesResponse {
        value: String;
        valueDesc: String;
    }; 


