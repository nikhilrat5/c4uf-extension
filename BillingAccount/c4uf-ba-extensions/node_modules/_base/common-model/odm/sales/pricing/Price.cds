namespace sap.odm.sales.pricing;

using {
  sap.odm.common.cuid,
  sap.odm.common.Measure,
  sap.odm.common.CurrencyCode,
  sap.odm.common.CountryCode,
  sap.odm.common.UnitOfMeasureCode,
  sap.odm.common.address.CountrySubdivisionCode
} from '../../common';
// EXCLUDED Dependency to Product
// using {sap.odm.product.Product} from '../../product';
// EXCLUDED Dependency to BusinessPartner
// using {sap.odm.sales.Customer} from './..';
using {
  sap.odm.sales.Amount,
  sap.odm.sales.PriceValue
} from '../types';
using {
  sap.odm.sales.orgunit.DistributionChannelCode,
  sap.odm.sales.orgunit.SalesOrganization
} from '../orgunit';
using {sap.odm.finance.TaxCategoryCode} from '../../finance';

/**
 * Price or costs for purchasing a product or an asset in a
 * particular currency.
 */
@ODM.root : true
entity Price : cuid {
  /**
   * Base price of the product or asset.
   */
  basePrice           :      PriceValue not null;
  /**
   * The absolute value(s) of given discount(s), also cash
   * discount, for the specific customer, country, or amount.
   */
  discount            : many PriceIncludedDiscount;
  /** The absolute value(s) of included tax(es) in the gross price. */ // e.g. in the USA several taxes can be needed.
  tax                 : many PriceIncludedTax;
  /**
   * This field is true if all taxes are listed in "tax" - if you
   * have e.g. only net prices without tax it should be false.
   */
  isTaxIncluded       :      Boolean;
  /**
   * Gross price of the product or asset, if taxes are not
   * included - additional taxes can be effective.
   */
  grossPrice          :      PriceValue not null;
  /**
   * Start date from which the price is valid, optional.
   */
  validFrom           :      Date;
  /**
   * End date to that the price is valid, optional.
   */
  validTo             :      Date;
  /**
   * An optional description explaining what this price means, or
   * how it is named.
   */
  description         :      String(40);
  /*
   * all following fields define a matrix which decribes in which circumstances the price is effective
   * e.g. prices can be valid:
   *       -for a specific product in a defined country
   *       -for specific customers and only in specific amounts (bulk prices can be modeled)
   *       -for specific package-sizes of a product -> use field "productUom"
   *       ...
   */
  /**
   * Measure used for calculating the price, e.g. 1000 Kg,
   * optional.
   */
  measure             :      Measure;
  /**
   * Minimum amount of the product, for which the price is valid,
   * optional (bulk price).
   */
  amount              :      Amount;
  /**
   * Product for which the price is valid.
   */
  // MODIFIED from managed association to unmanaged foreign key
  product             :      UUID not null; // Association to one Product not null;
  /**
   * Unit of measure of the product for which the price is valid,
   * optional.
   */
  productUom          :      ProductUnitOfMeasureRef;
  /**
   * Customer for whom the price is valid, optional.
   */
  // MODIFIED from managed association to unmanaged foreign key
  customer            :      UUID; // Association to one Customer; // probably customer groups are also needed
  /**
   * Sales organization for which the price is valid, optional.
   */
  salesOrganization   :      Association to one SalesOrganization;
  /**
   * Distribution channel for which the price is valid, optional.
   */
  distributionChannel :      DistributionChannelCode;
  /**
   * Country for which the price is valid, optional.
   */
  country             :      CountryCode;
  /**
   * Region, province or subdivision for which the price is
   * valid, optional.
   */
  region              :      CountrySubdivisionCode;
  /**
   * Currency that qualifies for the price property.
   */
  currency            :      CurrencyCode;
  /* some optional retail flags */
  /**
   * Indicates if weighting is required to get the final overall
   * price.
   */
  isWeightingRequired :      Boolean;
  /**
   * Indicates if additional discounts are allowed, e.g. in food
   * retail scenarios.
   */
  isDiscountAllowed   :      Boolean;
}

/**
 * Taxes included in a price.
 */
type PriceIncludedTax {
  /**
   * Name of the tax, e.g. for listing in bills.
   */
  name       : String(40);
  /**
   * Absolute value of included tax in the gross price.
   */
  value      : PriceValue not null;
  /**
   * Code of the tax type if applicable.
   */
  typeCode   : TaxCategoryCode;
  /**
   * Percentage used as a base for the tax calculation, optional.
   */
  percentage : Decimal(5, 2);
}

/**
 * Discounts included in a price, e.g. customer, country, or
 * amount specific or cash discounts.
 */
type PriceIncludedDiscount {
  /**
   * Name of the discount, e.g. for listing in bills.
   */
  name       : String(40);
  /**
   * Absolute value of the discount in the gross price.
   */
  value      : PriceValue not null;
  /**
   * Percentage used as a base for discount calculation,
   * optional.
   */
  percentage : Decimal(5, 2);
}

/* This type allows to reference special product-packages e.g. crates, sixpacks, mass-packages etc.
 * these packages also have their own GTIN/EAN sometimes
 * it references the sub-entity ProductUnitOfMeasure in domain /product
 */
/**
 * References the unit of measure of a product.
 */
type ProductUnitOfMeasureRef {
  /**
   * Parent link to Product.
   */
  // MODIFIED from managed association to unmanaged foreign key
  product         : UUID; // Association to one Product;
  /**
   * Describes the unit of measure of a product.
   */
  measurementUnit : UnitOfMeasureCode;
}
