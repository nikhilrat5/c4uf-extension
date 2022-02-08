using {
    sap.odm.sales as sales
} from '../../db';

using API_BUSINESS_PARTNER as bp from '../external/API_BUSINESS_PARTNER';

/*
 * Expose entities and attributes that have been defined as IsPotentiallyPersonal. Entity naming must match naming of API_EDOM_RETAILER
 */
service PersonalDataManagerService @(path:'/api/v1/dpp/pdm', requires:'authenticated-user'){
    @PersonalData.EntitySemantics: 'DataSubject'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @Common.Label: '{i18n>labelBusinessPartner}'
    @readonly entity BusinessPartner as select from sales.CustomerOrder.partners {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key businessPartnerId
    };

    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @Common.Label: '{i18n>labelCustomerOrderEntity}'
    @readonly entity CustomerOrder as select from sales.CustomerOrder {
        @Common.Label: '{i18n>labelCustomerOrderId}'
        key id,
        @Common.Label: '{i18n>labelCustomerReferenceId}'
        customerReferenceId,
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        partners.businessPartnerId
    };

    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @Common.Label: '{i18n>labelCustomerOrderItemsEntity}'
    @readonly entity CustomerOrderItems as select from sales.CustomerOrder.items {
        @Common.Label: '{i18n>labelCustomerOrderItemId}'
        key id,
        @Common.Label: '{i18n>labelOptionalAlternativeId}'
        alternativeId,
        @Common.Label: '{i18n>labelConfigurationId}'
        configurationId,
        @Common.Label: '{i18n>labelCustomerReferenceId}'
        customerReferenceId,
        @Common.Label: '{i18n>labelParentItemId}'        
        parentItemId,
        // CustomerOrderItemUtilitiesReferenceObjectAspect
        @Common.Label: '{i18n>labelUtilitiesAspectReferenceObjectMeter}'
        utilitiesAspect.referenceObject.meter as utilitiesAspect_referenceObject_meter,
        // CustomerOrderItemUtilitiesSubsequentDocumentAspect
        @Common.Label: '{i18n>labelUtilitiesAspectSubsequentDocumentId}'
        utilitiesAspect.subsequentDocument.id as utilitiesAspect_subsequentDocument_id,
        @Common.Label: '{i18n>labelUtilitiesAspectSubsequentDocumentDisplayId}'
        utilitiesAspect.subsequentDocument.displayId as utilitiesAspect_subsequentDocument_displayId,
        // CustomerOrderItemUtilitiesSubscriptionAspect
        @Common.Label: '{i18n>labelSubscriptionAspectValidFrom}'
        subscriptionAspect.validFrom as subscriptionAspect_validFrom,
        @Common.Label: '{i18n>labelSubscriptionAspectValidTo}'
        subscriptionAspect.validTo as subscriptionAspect_validTo,
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        up_.partners.businessPartnerId
    };

    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @Common.Label: '{i18n>labelCustomerOrderNotesEntity}'
    @readonly entity CustomerOrderNotes as select from sales.CustomerOrder.notes {
        @Common.Label: '{i18n>labelCustomerOrderNotesId}'
        key id, 
        @Common.Label: '{i18n>labelNoteText}'    
        text, 
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        up_.partners.businessPartnerId
    };

    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @Common.Label: '{i18n>labelCustomerOrderItemNotesEntity}'
    @readonly entity CustomerOrderItemNotes as select from sales.CustomerOrder.items.notes {
        @Common.Label: '{i18n>labelCustomerOrderItemNotesId}'
        key id,  
        @Common.Label: '{i18n>labelNoteText}'      
        text,
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        up_.up_.partners.businessPartnerId
    };

    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @Common.Label: '{i18n>labelCustomerOrderPartnersEntity}'
    @readonly entity CustomerOrderPartners as select from sales.CustomerOrder.partners {
        @Common.Label: '{i18n>labelCustomerOrderPartnersId}'
        key id,
        @Common.Label: '{i18n>labelContractAccountId}'        
        contractAccountId,
        // address
        @Common.Label: '{i18n>labelAddressPhoneNumber}'
        address.phoneNumber as address_phoneNumber,
        @Common.Label: '{i18n>labelAddressFaxNumber}'
        address.faxNumber as address_faxNumber,
        @Common.Label: '{i18n>labelAddressEmailAddress}'
        address.emailAddress as address_emailAddress,
        @Common.Label: '{i18n>labelAddressStreetPrefix1}'
        address.streetPrefix1 as address_streetPrefix1,
        @Common.Label: '{i18n>labelAddressStreetPrefix2}'
        address.streetPrefix2 as address_streetPrefix2,
        @Common.Label: '{i18n>labelAddressStreetSuffix1}'
        address.streetSuffix1 as address_streetSuffix1,
        @Common.Label: '{i18n>labelAddressStreetSuffix2}'
        address.streetSuffix2 as address_streetSuffix2,
        @Common.Label: '{i18n>labelAddressHouseNumber}'
        address.houseNumber as address_houseNumber,
        @Common.Label: '{i18n>labelAddressHouseNumberSupplement}'
        address.houseNumberSupplement as address_houseNumberSupplement,
        @Common.Label: '{i18n>labelAddressFloor}'
        address.floor as address_floor,
        @Common.Label: '{i18n>labelAddressDoor}'
        address.door as address_door,
        @Common.Label: '{i18n>labelAddressCareOf}'
        address.careOf as address_careOf,
        @Common.Label: '{i18n>labelAddressPostCode}'
        address.postCode as address_postCode,
        @Common.Label: '{i18n>labelAddressStreetName}'
        address.street.name as address_street_name, 
        @Common.Label: '{i18n>labelAddressTownName}'
        address.town.name as address_town_name,
        @Common.Label: '{i18n>labelAddressDistrictName}'
        address.district.name as address_district_name,
        @Common.Label: '{i18n>labelAddressSecondaryRegionName}'        
        address.secondaryRegion.name as address_secondaryRegion_name,
        @Common.Label: '{i18n>labelAddressTertiaryRegionName}'
        address.tertiaryRegion.name as  address_tertiaryRegion_name,
        @Common.Label: '{i18n>labelAddressAlternativePostCode}'
        address.alternative.postCode as  address_alternative_postCode,
        @Common.Label: '{i18n>labelAddressAlternativeTownName}'
        address.alternative.town.name as  address_alternative_town_name,
        @Common.Label: '{i18n>labelAddressAlternativeDestrictName}'
        address.alternative.district.name as address_alternative_destrict_name, 
        @Common.Label: '{i18n>labelAddressAlternativeSecondaryRegionName}'       
        address.alternative.secondaryRegion.name as address_alternative_secondaryRegion_name,
        @Common.Label: '{i18n>labelAddressAlternativeTertiaryRegionName}' 
        address.alternative.tertiaryRegion.name as address_alternative_tertiaryRegion_name,
        @Common.Label: '{i18n>labelAddressAlternativeDeliveryServiceType}' 
        address.alternative.deliveryServiceType as address_alternative_deliveryServiceType,
        @Common.Label: '{i18n>labelAddressAlternativeDeliveryServiceQualifier}' 
        address.alternative.deliveryServiceQualifier as address_alternative_deliveryServiceQualifier,
        @Common.Label: '{i18n>labelAddressAlternativeDeliveryServiceIdentifier}' 
        address.alternative.deliveryServiceIdentifier as address_alternative_deliveryServiceIdentifier,
        @Common.Label: '{i18n>labelAddressCoordinatesLatitute}' 
        address.coordinates.latitude as address_coordinates_latitute,
        @Common.Label: '{i18n>labelAddressCoordinatesLongitude}' 
        address.coordinates.longitude as address_coordinates_longitude,
        @Common.Label: '{i18n>labelAddressCoordinatesAltitude}' 
        address.coordinates.altitude as address_coordinates_altitude,
        // personAddressDetails
        @Common.Label: '{i18n>labelPersonAddressDetailsFirstName}' 
        personAddressDetails.firstName as personAddressDetails_firstName,
        @Common.Label: '{i18n>labelPersonAddressDetailsMiddleName}' 
        personAddressDetails.middleName as personAddressDetails_middleName,
        @Common.Label: '{i18n>labelPersonAddressDetailsLastName}' 
        personAddressDetails.lastName  as personAddressDetails_lastName,
        @Common.Label: '{i18n>labelPersonAddressDetailsSecondLastName}' 
        personAddressDetails.secondLastName as personAddressDetails_secondLastName,
        @Common.Label: '{i18n>labelPersonAddressDetailsInitials}' 
        personAddressDetails.initials as personAddressDetails_initials,
        @Common.Label: '{i18n>labelPersonAddressDetailsFormattedPersonName}' 
        personAddressDetails.formattedPersonName as personAddressDetails_formattedPersonName,
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        businessPartnerId
    };

    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @Common.Label: '{i18n>labelCustomerOrderItemPartnersEntity}'
    @readonly entity CustomerOrderItemPartners as select from sales.CustomerOrder.items.partners {
        @Common.Label: '{i18n>labelCustomerOrderItemPartnersId}'
        key id,
        @Common.Label: '{i18n>labelContractAccountId}'      
        contractAccountId,
        // address
        @Common.Label: '{i18n>labelAddressPhoneNumber}'
        address.phoneNumber as address_phoneNumber,
        @Common.Label: '{i18n>labelAddressFaxNumber}'
        address.faxNumber as address_faxNumber,
        @Common.Label: '{i18n>labelAddressEmailAddress}'
        address.emailAddress as address_emailAddress,
        @Common.Label: '{i18n>labelAddressStreetPrefix1}'
        address.streetPrefix1 as address_streetPrefix1,
        @Common.Label: '{i18n>labelAddressStreetPrefix2}'
        address.streetPrefix2 as address_streetPrefix2,
        @Common.Label: '{i18n>labelAddressStreetSuffix1}'
        address.streetSuffix1 as address_streetSuffix1,
        @Common.Label: '{i18n>labelAddressStreetSuffix2}'
        address.streetSuffix2 as address_streetSuffix2,
        @Common.Label: '{i18n>labelAddressHouseNumber}'
        address.houseNumber as address_houseNumber,
        @Common.Label: '{i18n>labelAddressHouseNumberSupplement}'
        address.houseNumberSupplement as address_houseNumberSupplement,
        @Common.Label: '{i18n>labelAddressFloor}'
        address.floor as address_floor,
        @Common.Label: '{i18n>labelAddressDoor}'
        address.door as address_door,
        @Common.Label: '{i18n>labelAddressCareOf}'
        address.careOf as address_careOf,
        @Common.Label: '{i18n>labelAddressPostCode}'
        address.postCode as address_postCode,
        @Common.Label: '{i18n>labelAddressStreetName}'
        address.street.name as address_street_name, 
        @Common.Label: '{i18n>labelAddressTownName}'
        address.town.name as address_town_name,
        @Common.Label: '{i18n>labelAddressDistrictName}'
        address.district.name as address_district_name,
        @Common.Label: '{i18n>labelAddressSecondaryRegionName}'        
        address.secondaryRegion.name as address_secondaryRegion_name,
        @Common.Label: '{i18n>labelAddressTertiaryRegionName}'
        address.tertiaryRegion.name as  address_tertiaryRegion_name,
        @Common.Label: '{i18n>labelAddressAlternativePostCode}'
        address.alternative.postCode as  address_alternative_postCode,
        @Common.Label: '{i18n>labelAddressAlternativeTownName}'
        address.alternative.town.name as  address_alternative_town_name,
        @Common.Label: '{i18n>labelAddressAlternativeDestrictName}'
        address.alternative.district.name as address_alternative_destrict_name, 
        @Common.Label: '{i18n>labelAddressAlternativeSecondaryRegionName}'       
        address.alternative.secondaryRegion.name as address_alternative_secondaryRegion_name,
        @Common.Label: '{i18n>labelAddressAlternativeTertiaryRegionName}' 
        address.alternative.tertiaryRegion.name as address_alternative_tertiaryRegion_name,
        @Common.Label: '{i18n>labelAddressAlternativeDeliveryServiceType}' 
        address.alternative.deliveryServiceType as address_alternative_deliveryServiceType,
        @Common.Label: '{i18n>labelAddressAlternativeDeliveryServiceQualifier}' 
        address.alternative.deliveryServiceQualifier as address_alternative_deliveryServiceQualifier,
        @Common.Label: '{i18n>labelAddressAlternativeDeliveryServiceIdentifier}' 
        address.alternative.deliveryServiceIdentifier as address_alternative_deliveryServiceIdentifier,
        @Common.Label: '{i18n>labelAddressCoordinatesLatitute}' 
        address.coordinates.latitude as address_coordinates_latitute,
        @Common.Label: '{i18n>labelAddressCoordinatesLongitude}' 
        address.coordinates.longitude as address_coordinates_longitude,
        @Common.Label: '{i18n>labelAddressCoordinatesAltitude}' 
        address.coordinates.altitude as address_coordinates_altitude,
        // personAddressDetails
        @Common.Label: '{i18n>labelPersonAddressDetailsFirstName}' 
        personAddressDetails.firstName as personAddressDetails_firstName,
        @Common.Label: '{i18n>labelPersonAddressDetailsMiddleName}' 
        personAddressDetails.middleName as personAddressDetails_middleName,
        @Common.Label: '{i18n>labelPersonAddressDetailsLastName}' 
        personAddressDetails.lastName  as personAddressDetails_lastName,
        @Common.Label: '{i18n>labelPersonAddressDetailsSecondLastName}' 
        personAddressDetails.secondLastName as personAddressDetails_secondLastName,
        @Common.Label: '{i18n>labelPersonAddressDetailsInitials}' 
        personAddressDetails.initials as personAddressDetails_initials,
        @Common.Label: '{i18n>labelPersonAddressDetailsFormattedPersonName}' 
        personAddressDetails.formattedPersonName as personAddressDetails_formattedPersonName,
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        up_.up_.partners.businessPartnerId
    };
};