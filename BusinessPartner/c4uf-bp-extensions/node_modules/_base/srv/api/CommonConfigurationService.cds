
using {
    sap.odm.common as common
} from '../../db';

service CommonConfigurationService @(path: '/api/config/v1', requires: 'authenticated-user') { 

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity GenderCodes as projection on common.GenderCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity LanguageCodes as projection on common.LanguageCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CountryCodes as projection on common.CountryCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CurrencyCodes as projection on common.CurrencyCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity IncotermsClassificationCodes as projection on common.IncotermsClassificationCodes;
    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write' },
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity AcademicTitleCodes as projection on common.address.AcademicTitleCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity CountrySubdivisionCodes as projection on common.address.CountrySubdivisionCodes;

    @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity StreetCodes as projection on common.address.StreetCodes;

        @(  restrict: [
            { grant: ['WRITE'], to: 'API.Write'},
            { grant: ['READ'], to: 'API.Read' }
        ],
        Capabilities: { DeleteRestrictions.Deletable: false })
    entity TownCodes as projection on common.address.TownCodes;

}
