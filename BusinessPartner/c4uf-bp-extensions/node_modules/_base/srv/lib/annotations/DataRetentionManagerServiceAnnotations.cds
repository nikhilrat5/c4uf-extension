using {
  DataRetentionManagerService.DataController as DataController
} from './../../dpp/DataRetentionManagerService';

annotate DataController with @Capabilities: {
    ReadRestrictions: {
        Description: 'Retrieves a list of entities to process the personal data.',
        LongDescription: 'Retrieves a list of entities to process the personal data and manage legal entities.',
        ReadByKeyRestrictions: {
            Description: 'Retrieves an item of the personal data entity.',
            LongDescription: 'Retrieves a single item of of the personal data entity.'
        }
    },
    InsertRestrictions: {
        Description: 'Creates legal entity.',
        LongDescription: 'Creates a new legal entity.',
    },
    UpdateRestrictions: {
        Description: 'Updates a legal entity.',
        LongDescription: 'Updates a legal entity using the ID.',
    },
    DeleteRestrictions: {
        Description: 'Deletes a legal entity.',
        LongDescription: 'Deletes a legal entity using the ID.',
    }
};
