namespace sap.odm.sales;

using {sap.odm.common.codeList} from '../common';

/**
 * Sales text type.
 */
@odm.doc.alternateTerms : ['Text ID']
@odm.doc.SAPDelivered   : true
@odm.doc.extensible     : true
@odm.doc.relatedGDT     : 'TextCollectionTextTypeCode'
entity SalesTextTypeCodes : codeList {
      /**
       * Code list entry.
       */
  key code : String(5);
}

/**
 * Sales text type.
 */
type SalesTextTypeCode : Association to one SalesTextTypeCodes;
