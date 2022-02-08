using {
  ConfigurationService.CustomerOrderUtilitiesStatusMapping as StatusMapping,
  ConfigurationService.CustomerOrderUtilitiesStatusSourceSystems as SourceSystem,
  ConfigurationService.CustomerOrderUtilitiesStatusMappingTypeCodes as MappingTypeCodes
} from './../../api/ConfigurationService';

annotate StatusMapping with @Capabilities: {
    ReadRestrictions: {
        Description: 'Retrieves a list of status mappings for the customer order.',
        LongDescription: 'Retrieves a list of the processing status codes which are mapped to the status codes of the customer order item of the source system.',
        ReadByKeyRestrictions: {
            Description: 'Retrieves a status mapping item for the customer order.',
            LongDescription: 'Retrieves a single processing status code which is mapped to the status codes of the customer order item of the source system.'
        }
    },
    InsertRestrictions: {
        Description: 'Creates a new status mapping for the customer order.',
        LongDescription: 'Creates a new status mapping between utilities processing status codes and status codes of customer order items of the source system.',
    },
    UpdateRestrictions: {
        Description: 'Updates a status mapping for the customer order.',
        LongDescription: 'Updates a mapping between utilities processing status codes and status codes of customer order items of the source system.',
    },
    DeleteRestrictions: {
        Description: 'Deletes a status mapping for the customer order.',
        LongDescription: 'Deletes a mapping between utilities processing status codes and status codes of customer order items of the source system.',
    },
    NavigationRestrictions: {
        RestrictedProperties : [
        {
            NavigationProperty : processingStatus,
            ReadRestrictions : {
                Description: 'Retrieves processing status of a status mapping for the customer order.',
                LongDescription : 'Retrieves the processing status of a status mapping for the customer order associated with the selected status mapping.'
            }
        },
        {
            NavigationProperty : sourceSystem,
            ReadRestrictions : {
                Description: 'Retrieves the source system of a status mapping for the customer order.',
                LongDescription : 'Retrieves the source system of a status mapping for the customer order associated with the selected status mapping.'
            }
        },
        {
            NavigationProperty : type,
            ReadRestrictions : {
                Description: 'Retrieves type of a status mapping for the customer order.',
                LongDescription : 'Retrieves the type of a status mapping for the customer order associated with the selected status mapping.'
            }
        }
    ]}
};

annotate SourceSystem with @Capabilities: {
    ReadRestrictions: {
        Description: 'Retrieves a list of source systems.',
        LongDescription: 'Retrieves a list of source systems which can be used to define mapping of the status codes.',
        ReadByKeyRestrictions: {
            Description: 'Retrieves an item of a source system.',
            LongDescription: 'Retrieves a single item of a source system.'
        }
    },
    InsertRestrictions: {
        Description: 'Creates a new entity of the source system.',
        LongDescription: 'Creates a new entity of the source system which can be used to define mapping of the status codes.',
    },
    UpdateRestrictions: {
        Description: 'Updates a source system.',
        LongDescription: 'Updates settings of a source system which can be used to define mapping of the status codes.',
    },
    DeleteRestrictions: {
        Description: 'Deletes a source system.',
        LongDescription: 'Deletes an entity of the source system which can be used to define mapping of the status codes.',
    }
};

annotate MappingTypeCodes with @Capabilities: {
    ReadRestrictions: {
        Description: 'Retrieves a list of entities to specify the type of source.',
        LongDescription: 'Retrieves a list of entities to specify the type which can be used to define mapping of the status codes.',
        ReadByKeyRestrictions: {
            Description: 'Retrieves an item of the type.',
            LongDescription: 'Retrieves a single item of the type.'
        }
    },
    InsertRestrictions: {
        Description: 'Creates a new entity of the type.',
        LongDescription: 'Creates a new entity of the type which can be used to define mapping of the status codes.',
    },
    UpdateRestrictions: {
        Description: 'Updates the type.',
        LongDescription: 'Updates settings of the type which can be used to define mapping of the status codes.',
    },
    DeleteRestrictions: {
        Description: 'Deletes the type.',
        LongDescription: 'Deletes an entity of the type which can be used to define mapping of the status codes.',
    }
};
