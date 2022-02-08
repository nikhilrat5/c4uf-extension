using {
  sap.odm.sales.CustomerInformation,
  sap.odm.sales.CustomerTaxClassification
} from './';

annotate CustomerInformation with @PersonalData.EntitySemantics : 'DataSubjectDetails';

annotate CustomerTaxClassification with @PersonalData.EntitySemantics : 'DataSubjectDetails';

annotate CustomerTaxClassification with {
  country           @PersonalData.IsPotentiallyPersonal;
  taxCategory       @PersonalData.IsPotentiallyPersonal;
  taxClassification @PersonalData.IsPotentiallyPersonal;
}
