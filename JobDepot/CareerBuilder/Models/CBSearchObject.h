//
//  CBSearchObject.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//
//  detailed reference can be found here:
//  http://api.careerbuilder.com/JobSearchInfo.aspx
//
//  learn more at: http://api.careerbuilder.com/JobSearchInfo.aspx
//

#import <Foundation/Foundation.h>
#import "CBAPIHelper.h"

@interface CBSearchObject : NSObject

// core search properties
@property NSString *keywords; //
@property NSString *location; //
@property int pageNumber; // defauit is 0
@property int perPage; // default is 25


@property NSString *booleanOperator;    // valid params are AND, OR
@property NSString *category;           // CSV or categories (SEE category codes API)
@property NSString *cobrand;
@property NSString *companyDID;
@property NSString *companyDIDCSV;
@property NSString *companyName;
@property NSString *companyNameBoostParams;     // weight 0-1000 i.e. companyname1^600~companyname2^400~companyname3^1000
@property NSString *countryCode;        // two character country code
@property NSString *educationCode;      // one value (SEE education codes API)
@property NSString *empType;            // csv of employment tyeps (SEE employment types API)
@property NSString *excludeCompanyNames; // CSV
@property NSString *excludeJobTitles;   // CSV
@property NSString *excludeKeywords;    // CSV
@property BOOL excludeNational;
@property BOOL excludeNonTraditionalJobs;
@property NSString *excludeProductID;   // single
@property NSString *hostSite;           // single two character value
@property BOOL includeCompanyChildren;  // child companies included for the CompanyName, CompanyNameCSV, or CompanyDID params
@property NSString *industryCodes;      // CSV (SEE industry codes API)
@property NSString *jobTitle;
@property NSString *normalizedCompanyDID;
@property NSString *normalizedCompanyDIDBoostParams; // number 0-1000 i.e. normalizedcompanyDID1^600~normalizedcompanyDID2^4000
@property NSString *normalizedCompanyName;
@property NSString *ONetCode;           // CSV  learn more here: http://www.onetonline.org/
@property NSString *orderBy;            // Valid values are: Date, Pay, Title, Company, Distance, Location, and Relevance
@property NSString *orderDirection;     // ASC, DESC
@property NSString *partnerID;
@property int payHigh;                  // multiple of 1000
@property BOOL payInfoOnly;             // only jobs with pay info
@property int postedWithin;             // in days, default 30, valid values 1, 3, 7, or 30
@property NSString *productID;
@property int radius;                   // in miles, default 30, valid values 5, 10, 20, 30, 50, 100, 150
@property BOOL relocateJobs;
@property NSString *SOCCode;            // (SEE soc code API)
@property NSString *schoolSiteID;
@property BOOL searchAllCountries;
@property NSString *searchView;         // ADVANCED: solr view
@property BOOL showCategories;
@property BOOL showApplyRequirements;
@property NSString *applyRequirements;            // CSV
@property BOOL singleONETSearch;        // supress onet heirarchy
@property NSString *siteEntity;
@property NSString *siteID;
@property NSString *skills;             // CSV
@property BOOL specificEducation;       // educationCode must be set
@property NSString *tags;
@property NSString *talentNetworkDID;
@property NSString *urlCompressionService; // bitly or tinyurl
@property NSString *strcrit;                      // ADVANCED: overrieds all other params

@property BOOL useFacets;
@property NSString *facetCategory;      // (SEE category codes API) useFacets must be TRUE
@property NSString *facetCompany;       // useFacets must be TRUE
@property NSString *facetCity;          // useFacets must be TRUE
@property NSString *facetState;         // two letter state useFacets must be TRUE
@property NSString *facetPay;           // [*****0](Unspecified), [1*****14999]($1-<$15k), [15000*****29999]($15k-<$30k), [30000*****49999]($30k-<$50k), [50000*****74999]($50k-<$75k), [75000*****99999]($75k-<$100k), [100000*****](Over $100k) useFacets must be TRUE
@property NSString *facetNormalizedCompanyDID; // useFacets must be TRUE

//NOT SUPPORTED in V1.0//@property BOOL advancedGroupingMode; // only valid if enableCompanyCollapse is true
//NOT SUPPORTED in V1.0//@property BOOL enableCompanyCollapse; // results grouped by company
//NOT SUPPORTED in V1.0//@property int recordsPerGroup;


- (NSString *) toQueryString;

// convenience methods
+ (CBSearchObject *) searchObjectWithKeywords:(NSString *)keywords;
+ (CBSearchObject *) searchObjectWithKeywords:(NSString *)keywords AndPageNumber:(int)pageNumber;
+ (CBSearchObject *) searchObjectWithKeywords:(NSString *)keywords AndLocation:(NSString *)location;
+ (CBSearchObject *) searchObjectWithKeywords:(NSString *)keywords AndLocation:(NSString *)location AndPageNumber:(int)pageNumber;

// helper functions to build the query string
+ (NSString *)queryizeString:(NSString *)val WithName:(NSString *)name;
+ (NSString *)queryizeBoolean:(BOOL)val WithName:(NSString *)name;
+ (NSString *)queryizeInteger:(int)val WithName:(NSString *)name;
+ (BOOL) validateInt:(int)val WithName:(NSString *)name; // helps with all the rules

@end
