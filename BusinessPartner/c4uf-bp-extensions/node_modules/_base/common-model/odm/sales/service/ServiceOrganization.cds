namespace sap.odm.sales.service;

using {sap.odm.common.cuid} from '../../common';
// EXCLUDED Dependency to OrgUnit
// using {sap.odm.orgunit.responsibility.Team} from '../../orgunit';

/**
 * An organizational unit where services are prepared and planned.
 */
@odm.doc.alternateTerms : ['Serviceorganisation']
@odm.doc.relatedGDT     : ''
@ODM.root               : true
entity ServiceOrganization : cuid {
    /* 
    * TODO: Once Service Organization has a real implementation in the cloud as well as updated on prem this modeling needs to be revisited 
    */
    /**
     * Identifies for S/4 On Premise the Service Organizational Unit.
     */
    serviceOrganization : String(14);

    /**
     * For cloud solutions the responsible team.
     */
    // MODIFIED from managed association to unmanaged foreign key
    serviceTeam : UUID; // Association to one Team;
}
