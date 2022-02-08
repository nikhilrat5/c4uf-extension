using { LegalEntitiesResponse } from './DataRetentionManagerTypes';

service LegalEntitiesService  @(path: '/api/v1/dpp/legalEntities', requires: 'authenticated-user', protocol: 'rest') {
  
    /**
    * Legal Entities 
    * Indicates the endpoint for getting Legal Entities from the system
    * @returns {Array} - List of Legal Entities
    */
    @(restrict: [{ to: 'DataRetentionManagerUser' }])
    function BusinessPartner() returns many LegalEntitiesResponse;
}