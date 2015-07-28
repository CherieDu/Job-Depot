//
//  CBSearchObject.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBSearchObject.h"

@implementation CBSearchObject


// core search properties
@synthesize keywords;
@synthesize location;
@synthesize pageNumber;
@synthesize perPage;

@synthesize booleanOperator;
@synthesize category;
@synthesize cobrand;
@synthesize companyDID;
@synthesize companyDIDCSV;
@synthesize companyName;
@synthesize companyNameBoostParams;
@synthesize countryCode;
@synthesize educationCode;
@synthesize empType;
@synthesize excludeCompanyNames;
@synthesize excludeJobTitles;
@synthesize excludeKeywords;
@synthesize excludeNational;
@synthesize excludeNonTraditionalJobs;
@synthesize excludeProductID;
@synthesize hostSite;
@synthesize includeCompanyChildren;
@synthesize industryCodes;
@synthesize jobTitle;
@synthesize normalizedCompanyDID;
@synthesize normalizedCompanyDIDBoostParams;
@synthesize normalizedCompanyName;
@synthesize ONetCode;
@synthesize orderBy;
@synthesize orderDirection;
@synthesize partnerID;
@synthesize payHigh;
@synthesize payInfoOnly;
@synthesize postedWithin;
@synthesize productID;
@synthesize radius;
@synthesize relocateJobs;
@synthesize SOCCode;
@synthesize schoolSiteID;
@synthesize searchAllCountries;
@synthesize searchView;
@synthesize showCategories;
@synthesize showApplyRequirements;
@synthesize applyRequirements;
@synthesize singleONETSearch;
@synthesize siteEntity;
@synthesize siteID;
@synthesize skills;
@synthesize specificEducation;
@synthesize tags;
@synthesize talentNetworkDID;
@synthesize urlCompressionService;
@synthesize strcrit;

@synthesize useFacets;
@synthesize facetCategory;
@synthesize facetCompany;
@synthesize facetCity;
@synthesize facetState;
@synthesize facetPay;
@synthesize facetNormalizedCompanyDID;


// takes all of the parts and makes a querystring for use with job search
- (NSString *) toQueryString
{
    NSString *QS = @"";
    
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.keywords WithName:@"Keywords"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.location WithName:@"Location"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeInteger:self.pageNumber WithName:@"PageNumber"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeInteger:self.perPage WithName:@"PerPage"]];
    
    
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.booleanOperator WithName:@"BooleanOperator"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.category WithName:@"Category"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.cobrand WithName:@"Cobrand"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.companyDID WithName:@"CompanyDID"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.companyDIDCSV WithName:@"CompanyDIDCSV"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.companyName WithName:@"CompanyName"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.companyNameBoostParams WithName:@"CompanyNameBoostParams"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.countryCode WithName:@"CountryCode"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.educationCode WithName:@"EducationCode"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.empType WithName:@"EmpType"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.excludeCompanyNames WithName:@"ExcludeCompanyNames"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.excludeJobTitles WithName:@"ExcludeJobTitles"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.excludeKeywords WithName:@"ExcludeKeywords"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.excludeNational WithName:@"ExcludeNational"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.excludeNonTraditionalJobs WithName:@"ExcludeNonTraditionalJobs"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.excludeProductID WithName:@"ExcludeProductID"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.hostSite WithName:@"HostSite"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.includeCompanyChildren WithName:@"IncludeCompanyChildren"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.industryCodes WithName:@"IndustryCodes"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.jobTitle WithName:@"JobTitle"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.normalizedCompanyDID WithName:@"NormalizedCompanyDID"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.normalizedCompanyDIDBoostParams WithName:@"NormalizedCompanyDIDBoostParams"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.normalizedCompanyName WithName:@"NormalizedCompanyName"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.ONetCode WithName:@"ONetCode"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.orderBy WithName:@"OrderBy"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.orderDirection WithName:@"OrderDirection"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.partnerID WithName:@"PartnerID"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeInteger:self.payHigh WithName:@"PayHigh"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.payInfoOnly WithName:@"PayInfoOnly"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeInteger:self.postedWithin WithName:@"PostedWithin"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.productID WithName:@"ProductID"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeInteger:self.radius WithName:@"Radius"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.relocateJobs WithName:@"RelocateJobs"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.SOCCode WithName:@"SOCCode"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.schoolSiteID WithName:@"SchoolSiteID"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.searchAllCountries WithName:@"SearchAllCountries"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.searchView WithName:@"SearchView"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.showCategories WithName:@"ShowCategories"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.showApplyRequirements WithName:@"ShowApplyRequirements"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.applyRequirements WithName:@"ApplyRequirements"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.singleONETSearch WithName:@"SingleONetSearch"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.siteEntity WithName:@"SiteEntity"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.siteID WithName:@"SiteID"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.skills WithName:@"Skills"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.specificEducation WithName:@"SpecificEducation"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.tags WithName:@"Tags"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.talentNetworkDID WithName:@"TalentNetworkDID"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.urlCompressionService WithName:@"URLCompressionService"]];
    QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.strcrit WithName:@"strcrit"]];

    if(self.useFacets)
    {
        QS = [QS stringByAppendingString:[CBSearchObject queryizeBoolean:self.useFacets WithName:@"UseFacets"]];
        QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.facetCategory WithName:@"FacetCategory"]];
        QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.facetCompany WithName:@"FacetCompany"]];
        QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.facetCity WithName:@"FacetCity"]];
        QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.facetState WithName:@"FacetState"]];
        QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.facetPay WithName:@"FacetPay"]];
        QS = [QS stringByAppendingString:[CBSearchObject queryizeString:self.facetNormalizedCompanyDID WithName:@"FacetNormalizedCompanyDID"]];
    }
        
    return QS;
}


// quickly return back a search object with keywords
+ (CBSearchObject *) searchObjectWithKeywords:(NSString *)keywords {
    CBSearchObject *searchObj = [[CBSearchObject alloc] init];
    searchObj.keywords = keywords;
    return searchObj;
}

// quickly return back a search object with keywords and a page
+ (CBSearchObject *) searchObjectWithKeywords:(NSString *)keywords AndPageNumber:(int)pageNumber {
    CBSearchObject *searchObj = [[CBSearchObject alloc] init];
    searchObj.keywords = keywords;
    searchObj.pageNumber = pageNumber;
    return searchObj;
}

// quickly return back a search object with keywords and a location
+ (CBSearchObject *) searchObjectWithKeywords:(NSString *)keywords AndLocation:(NSString *)location {
    CBSearchObject *searchObj = [[CBSearchObject alloc] init];
    searchObj.keywords = keywords;
    searchObj.location = location;
    return searchObj;
}

// quickly return back a search object with keywords and a location and a page
+ (CBSearchObject *) searchObjectWithKeywords:(NSString *)keywords AndLocation:(NSString *)location AndPageNumber:(int)pageNumber {
    CBSearchObject *searchObj = [[CBSearchObject alloc] init];
    searchObj.keywords = keywords;
    searchObj.location = location;
    searchObj.pageNumber = pageNumber;
    return searchObj;
}


+ (NSString *)queryizeString:(NSString *)val WithName:(NSString *)name {
    NSString *retVal = @"";
    if(val != (id)[NSNull null] && val.length > 0) {
        // url encode the value
        val = [CBAPIHelper URLEncodeString:val];
        retVal = [NSString stringWithFormat:@"&%@=%@", name, val];
    }
    return retVal;
}

+ (NSString *)queryizeBoolean:(BOOL)val WithName:(NSString *)name; {
    NSString *retVal = @"";
    if(val) {
        retVal = [NSString stringWithFormat:@"&%@=true", name];
    }
    return retVal;
}

+ (NSString *)queryizeInteger:(int)val WithName:(NSString *)name; {
    NSString *retVal = @"";
    if(val > 0 && [CBSearchObject validateInt:val WithName:name]) {
        retVal = [NSString stringWithFormat:@"&%@=%i", name, val];        
    }
    
    return retVal;
}

+ (BOOL) validateInt:(int)val WithName:(NSString *)name {
    BOOL valid = true;
    
    // must be positive integer >= 1
    if([name isEqualToString:@"PageNumber"]) {
        if(val <= 0) {
            valid = false;
        }
    }
    
    // must be positive integer >= 1    
    if([name isEqualToString:@"PerPage"]) {
        if(val <= 0) {
            valid = false;
        }
    }

    // must be multiple of 1000
    if([name isEqualToString:@"PayHigh"]) {
        if(val == 0 || val % 1000 != 0) {
            valid = false;
        }
    }
    
    // must be 1, 3, 7 or 30
    if([name isEqualToString:@"PostedWithin"]) {
        if(val != 1 && val != 3 && val != 7 && val != 30) {
            valid = false;
        }
    }
    
    // must be 5, 10, 20, 30, 50, 100, 150
    if([name isEqualToString:@"Radius"]) {
        if(val != 5 && val != 10 && val != 20 && val != 30 && val != 50 && val != 100 && val != 150) {
            valid = false;
        }
    }
    
    return valid;
}

@end
