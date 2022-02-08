using {
    sap.odm.businesspartner as businesspartner
} from '../../db';

/*
 * Expose entities and attributes that have been defined as IsPotentiallyPersonal
 */
service BusinessPartnerPDMService @(path:'/api/businessPartner/v1/pdm', requires:'authenticated-user'){
    @PersonalData.EntitySemantics: 'DataSubject'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartner as select from businesspartner.BusinessPartner {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key id as businessPartnerId
    };


    @PersonalData.EntitySemantics: 'Other'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartnerPerson as select from businesspartner.BusinessPartner.person {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key up_.id as businessPartnerId,

        birthDate,
        @Common.Label: '{i18n>labelNationality}'
        nationality.name as nationality_name,
        nameDetails.firstName as nameDetails_firstName,
        nameDetails.middleName as nameDetails_middleName,
        nameDetails.lastName as nameDetails_lastName,
        nameDetails.secondLastName as nameDetails_secondLastName,
        nameDetails.initials as nameDetails_initials,
        @Common.Label: '{i18n>labelFormOfAddress}'
        nameDetails.formOfAddress.name as nameDetails_formOfAddress_name,
        @Common.Label: '{i18n>labelAcademicTitle}'
        nameDetails.academicTitle.name as nameDetails_academicTitle_name,
        @Common.Label: '{i18n>labelAdditionalAcademicTitle}'
        nameDetails.additionalAcademicTitle.name as nameDetails_additionalAcademicTitle_name,
        @Common.Label: '{i18n>labelNamePrefix}'
        nameDetails.namePrefix.name as nameDetails_namePrefix_name,
        @Common.Label: '{i18n>labelAdditionalNamePrefix}'
        nameDetails.additionalNamePrefix.name as nameDetails_additionalNamePrefix_name,
        @Common.Label: '{i18n>labelNameSuffix}'
        nameDetails.nameSuffix.name as nameDetails_nameSuffix_name,
        nameDetails.formattedPersonName as nameDetails_formattedPersonName,
    };

    @PersonalData.EntitySemantics: 'Other'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartnerOrganizationNameDetails as select from businesspartner.BusinessPartner.organization.nameDetails {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key up_.up_.id as businessPartnerId,

        formattedOrgNameLine1,
        formattedOrgNameLine2,
    };

    @PersonalData.EntitySemantics: 'Other'	
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])	
    @readonly entity BusinessPartnerBankAccounts as select from businesspartner.BusinessPartner.bankAccounts {	
        @PersonalData.FieldSemantics:'DataSubjectID'	
        @Common.Label: '{i18n>labelBusinessPartnerId}'	
        key up_.id as businessPartnerId,	
        id,
    };

    @PersonalData.EntitySemantics: 'Other'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartnerAddressDataEmailAddresses as select from businesspartner.BusinessPartner.addressData.emailAddresses {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key up_.up_.id as businessPartnerId,

        id,
        address,
    };

    @PersonalData.EntitySemantics: 'Other'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartnerAddressDataPhoneNumbers as select from businesspartner.BusinessPartner.addressData.phoneNumbers {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key up_.up_.id as businessPartnerId,

        id,
        @Common.Label: '{i18n>labelCountry}'
        country.name as country_name,
        number,
        numberExtension,
    };

    @PersonalData.EntitySemantics: 'Other'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartnerAddressDataFaxNumbers as select from businesspartner.BusinessPartner.addressData.faxNumbers {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key up_.up_.id as businessPartnerId,

        id,
        @Common.Label: '{i18n>labelCountry}'
        country.name as country_name,
        number,
        numberExtension,
    };
    
    @PersonalData.EntitySemantics: 'Other'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartnerAddressDataWebsites as select from businesspartner.BusinessPartner.addressData.websites {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key up_.up_.id as businessPartnerId,

        id,
        url,
    };

    @PersonalData.EntitySemantics: 'Other'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartnerAddressDataPersonPostalAddress as select from businesspartner.BusinessPartner.addressData.personPostalAddress {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key up_.up_.id as businessPartnerId,

        // person name
        firstName,
        middleName,
        lastName,
        secondLastName,
        initials,
        @Common.Label: '{i18n>labelFormOfAddress}'
        formOfAddress.name as formOfAddress_name,
        @Common.Label: '{i18n>labelAcademicTitle}'
        academicTitle.name as academicTitle_name,
        @Common.Label: '{i18n>labelAdditionalAcademicTitle}'
        additionalAcademicTitle.name as additionalAcademicTitle_name,
        @Common.Label: '{i18n>labelNamePrefix}'
        namePrefix.name as namePrefix_name,
        @Common.Label: '{i18n>labelAdditionalNamePrefix}'
        additionalNamePrefix.name as additionalNamePrefix_name,
        @Common.Label: '{i18n>labelNameSuffix}'
        nameSuffix.name as nameSuffix_name,
        formattedPersonName,

        // address
        streetPrefix1,
        streetPrefix2,
        streetSuffix1,
        streetSuffix2,
        houseNumber,
        houseNumberSupplement,
        floor,
        door,
        careOf,
        postCode,
        @Common.Label: '{i18n>labelStreet}'
        street.name as street_name,
        @Common.Label: '{i18n>labelTown}'
        town.name as town_name,
        @Common.Label: '{i18n>labelDistrict}'
        district.name as district_name,
        @Common.Label: '{i18n>labelPrimaryRegion}'
        primaryRegion.name as primaryRegion_name,
        @Common.Label: '{i18n>labelSecondaryRegion}'
        secondaryRegion.name as secondaryRegion_name,
        @Common.Label: '{i18n>labelTertiaryRegion}'
        tertiaryRegion.name as tertiaryRegion_name,
        @Common.Label: '{i18n>labelCountry}'
        country.name as country_name,

        // alternative
        alternative.deliveryServiceType as alternative_deliveryServiceType,
        alternative.deliveryServiceQualifier as alternative_deliveryServiceQualifier,
        alternative.deliveryServiceIdentifier as alternative_deliveryServiceIdentifier,
        @Common.Label: '{i18n>labelCountry}'
        alternative.country.name as alternative_country_name,
        alternative.postCode as alternative_postCode,
        @Common.Label: '{i18n>labelTown}'
        alternative.town.name as alternative_town_name,
        @Common.Label: '{i18n>labelDistrict}'
        alternative.district.name as alternative_district_name,
        @Common.Label: '{i18n>labelPrimaryRegion}'
        alternative.primaryRegion.name as alternative_primaryRegion_name,
        @Common.Label: '{i18n>labelSecondaryRegion}'
        alternative.secondaryRegion.name as alternative_secondaryRegion_name,
        @Common.Label: '{i18n>labelTertiaryRegion}'
        alternative.tertiaryRegion.name as alternative_tertiaryRegion_name,

        // coordinates
        coordinates.latitude as coordinates_latitude,
        coordinates.longitude as coordinates_longitude,
        coordinates.altitude as coordinates_altitude,

        // timezone
        @Common.Label: '{i18n>labelTimeZone}'
        timeZone.name as timeZone_name,
    };

    @PersonalData.EntitySemantics: 'Other'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartnerAddressDataOrganizationPostalAddress as select from businesspartner.BusinessPartner.addressData.organizationPostalAddress {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key up_.up_.id as businessPartnerId,
        
        // organization name
        formattedOrgNameLine1,
        formattedOrgNameLine2,
        formattedOrgNameLine3,
        formattedOrgNameLine4,
        formattedOrgName,

        // address
        streetPrefix1,
        streetPrefix2,
        streetSuffix1,
        streetSuffix2,
        houseNumber,
        houseNumberSupplement,
        floor,
        door,
        careOf,
        postCode,
        @Common.Label: '{i18n>labelStreet}'
        street.name as street_name,
        @Common.Label: '{i18n>labelTown}'
        town.name as town_name,
        @Common.Label: '{i18n>labelDistrict}'
        district.name as district_name,
        @Common.Label: '{i18n>labelPrimaryRegion}'
        primaryRegion.name as primaryRegion_name,
        @Common.Label: '{i18n>labelSecondaryRegion}'
        secondaryRegion.name as secondaryRegion_name,
        @Common.Label: '{i18n>labelTertiaryRegion}'
        tertiaryRegion.name as tertiaryRegion_name,
        @Common.Label: '{i18n>labelCountry}'
        country.name as country_name,

        // alternative
        alternative.deliveryServiceType as alternative_deliveryServiceType,
        alternative.deliveryServiceQualifier as alternative_deliveryServiceQualifier,
        alternative.deliveryServiceIdentifier as alternative_deliveryServiceIdentifier,
        @Common.Label: '{i18n>labelCountry}'
        alternative.country.name as alternative_country_name,
        alternative.postCode as alternative_postCode,
        @Common.Label: '{i18n>labelTown}'
        alternative.town.name as alternative_town_name,
        @Common.Label: '{i18n>labelDistrict}'
        alternative.district.name as alternative_district_name,
        @Common.Label: '{i18n>labelPrimaryRegion}'
        alternative.primaryRegion.name as alternative_primaryRegion_name,
        @Common.Label: '{i18n>labelSecondaryRegion}'
        alternative.secondaryRegion.name as alternative_secondaryRegion_name,
        @Common.Label: '{i18n>labelTertiaryRegion}'
        alternative.tertiaryRegion.name as alternative_tertiaryRegion_name,

        // coordinates
        coordinates.latitude as coordinates_latitude,
        coordinates.longitude as coordinates_longitude,
        coordinates.altitude as coordinates_altitude,

        // timezone
        @Common.Label: '{i18n>labelTimeZone}'
        timeZone.name as timeZone_name,
    };

    @PersonalData.EntitySemantics: 'Other'
    @(restrict: [{ grant: ['READ'], to: 'PersonalDataManagerUser' }])
    @readonly entity BusinessPartnerCustomerInformationTaxClassifications as select from businesspartner.BusinessPartner.customerInformation.taxClassifications {
        @PersonalData.FieldSemantics:'DataSubjectID'
        @Common.Label: '{i18n>labelBusinessPartnerId}'
        key up_.up_.id as businessPartnerId,

        @Common.Label: '{i18n>labelCountry}'
        country.name as country_name,
        taxCategory.name as taxCategory_name,
        @Common.Label: '{i18n>labelTaxClassification}'
        taxClassification.name as taxClassification_name,
    };
    
}