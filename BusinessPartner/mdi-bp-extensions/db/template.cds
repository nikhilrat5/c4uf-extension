//Put your extension here
namespace sap.odm.businesspartner;

using com.sap.mdm.bp from '_base/model/BusinessPartner';

//Use following section to extend 'Product' entity, value of @mdm.xsd.namespace denotes namespace prefix ie. n1 or n2 and corrosponding url of new schema on leading system ie. http://SAPCustomFields.com/YY1_ or http://SAPCustomFields.com/YY2_
extend entity bp.BusinessPartnerModel.BusinessPartner with @mdm.xsd.namespace : ['zns1=http://SAPCustomFields.com/YY1_', ]{
  //Add new fields here e.g. given below

  //Value of @mdm.soap.target is used to map CDS attribute name to a corresponding name in SOAP
  @mdm.soap.target          :                                                   'z_CHECK_EXT_BP_1'
  //Value of @mdm.xsd.namespace.prefix indicates the namespace prefix for the SOAP attribute
  @mdm.xsd.namespace.prefix :                                                   'zns1'
  //Value of @mdm.soap.type indicates data dype in wsdl for the field
  @mdm.soap.type            :                                                   'xs:token'
  /* Denotes the extended ODM field name in the ODM payload.Path need to be separated by '.'.
  Also, if element needs to present on root node(at BP) then only provide '.'. */
  @mdi.extension.odm.path   :                                                   '.'
  //Denotes the extended ODM field name in the ODM payload.//
  @mdi.odm.name             :                                                   'ext__CHECK_EXT_BP_1'
  z_CHECK_EXT_BP_1 : String(20);
}
