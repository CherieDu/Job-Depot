//
//  CBJob.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBJob.h"

@implementation CBJob

@synthesize jobSource;
@synthesize applyURL;
@synthesize bExternalApplication;
@synthesize applicationSubmitServiceURL;
@synthesize beginDate;
@synthesize blankApplicationServiceURL;
@synthesize categories;
@synthesize company;
@synthesize companyDetailsURL;
@synthesize companyDID;
@synthesize companyJobSearchURL;
@synthesize companyImageURL;
@synthesize contactInfoEmailURL;
@synthesize contactInfoFax;
@synthesize contactInfoName;
@synthesize contactInfoPhone;
@synthesize degreeRequired;
@synthesize DID;
@synthesize displayJobID;
@synthesize division;
@synthesize employmentType;
@synthesize endDate;
@synthesize experienceRequired;
@synthesize jobDescription;
@synthesize jobRequirements;
@synthesize jobTitle;
@synthesize location;
@synthesize bManagesOthers;
@synthesize modifiedDate;
@synthesize payHigh;
@synthesize payLow;
@synthesize payPer;
@synthesize payHighLowFormatted;
@synthesize payCommission;
@synthesize payBonus;
@synthesize payOther;
@synthesize printerFriendlyURL;
@synthesize bRelocationCovered;
@synthesize bTravelRequired;

@synthesize jobDetailsURL;
@synthesize jobServiceURL;
@synthesize postedDate;
@synthesize similarJobsURL;

@synthesize relevancy;


/*
 * function that takes an NSDictionary that has been sourced from
 * a JSON responce provided by CB
 * the dictionary is walked and the CBJob object is populated and returned
 */
- (id) initWithJSONDict:(NSDictionary *)jsonDict {
    
    self = [super init];

    if(self)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"M/D/YYYY"];
        
        self.jobSource = CBJobSourceJobDetail;
        
        self.applyURL = [NSURL URLWithString:jsonDict[@"ApplyURL"]];
        self.bExternalApplication = [jsonDict[@"ExternalApplication"] boolValue];
        self.applicationSubmitServiceURL = [NSURL URLWithString:jsonDict[@"ApplicationSubmitServiceURL"]];
        self.beginDate = [dateFormatter dateFromString:jsonDict[@"BeginDate"]];
        self.BlankApplicationServiceURL = [NSURL URLWithString:jsonDict[@"BlankApplicationServiceURL"]];
        self.categories = [jsonDict[@"Categories"] componentsSeparatedByString:@", "];
        self.company = jsonDict[@"Company"];
        self.companyDetailsURL = [NSURL URLWithString:jsonDict[@"CompanyDetailsURL"]];
        self.companyDID = jsonDict[@"CompanyDID"];
        self.companyJobSearchURL = [NSURL URLWithString:jsonDict[@"CompanyJobSearchURL"]];
        self.companyImageURL = [NSURL URLWithString:jsonDict[@"CompanyImageURL"]];
        self.contactInfoEmailURL = [NSURL URLWithString:jsonDict[@"ContactInfoEmailURL"]];
        self.contactInfoFax = jsonDict[@"ContactInfoFax"];
        self.contactInfoName = jsonDict[@"ContactInfoName"];
        self.contactInfoPhone = jsonDict[@"ContactInfoPhone"];
        self.degreeRequired = jsonDict[@"DegreeRequired"];
        self.DID = jsonDict[@"DID"];
        self.displayJobID = jsonDict[@"DisplayJobID"];
        self.division = jsonDict[@"Division"];
        self.employmentType = jsonDict[@"EmploymentType"];
        self.endDate = [dateFormatter dateFromString:jsonDict[@"EndDate"]];
        self.experienceRequired = jsonDict[@"ExperienceRequired"];
        self.jobDescription = jsonDict[@"JobDescription"];
        self.jobRequirements = jsonDict[@"JobRequirements"];
        self.jobTitle = jsonDict[@"JobTitle"];
        self.location = [[CBLocation alloc] init];
        self.location.street1 = jsonDict[@"LocationStreet1"];
        self.location.street2 = jsonDict[@"LocationStreet2"];
        self.location.city = jsonDict[@"LocationCity"];
        self.location.country = jsonDict[@"LocationCountry"];
        self.location.locationFormatted = jsonDict[@"LocationFormatted"];
        self.location.latitude = [jsonDict[@"LocationLatitude"] floatValue];
        self.location.longitude = [jsonDict[@"LocationLongitude"] floatValue];
        self.location.metroCity = jsonDict[@"LocationMetroCity"];
        self.location.postalCode = jsonDict[@"LocationPostalCode"];
        self.location.state = jsonDict[@"LocationState"];
        self.bManagesOthers = [jsonDict[@"ManagesOthers"] boolValue];
        self.modifiedDate = [dateFormatter dateFromString:jsonDict[@"ModifiedDate"]];
        self.payHigh = [[CBMoney alloc] initWithJSONDict:jsonDict[@"PayHigh"]];
        self.payLow = [[CBMoney alloc] initWithJSONDict:jsonDict[@"PayLow"]];
        self.payPer = jsonDict[@"PayPer"];
        self.payHighLowFormatted = jsonDict[@"PayHighLowFormatted"];
        self.payCommission = [[CBMoney alloc] initWithJSONDict:jsonDict[@"PayCommission"]];
        self.payBonus = [[CBMoney alloc] initWithJSONDict:jsonDict[@"PayBonus"]];
        self.payOther = [[CBMoney alloc] initWithJSONDict:jsonDict[@"PayOther"]];
        self.printerFriendlyURL = [NSURL URLWithString:jsonDict[@"PrinterFriendlyURL"]];
        self.bRelocationCovered = [jsonDict[@"RelocationCovered"] boolValue];
        self.bTravelRequired = [jsonDict[@"TravelRequired"] boolValue];

    }
    
    return self;
}


/*
 * function that takes an NSDictionary that has been sourced from
 * a JSON responce provided by CB job search results (different than details
 * the dictionary is walked and the CBJob object is populated and returned
 */
- (id) initWithSearchResultJSONDict:(NSDictionary *)jsonDict {
    
    self = [super init];
    
    if(self)
    {
        
        if(jsonDict && [jsonDict isKindOfClass:[NSDictionary class]])
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"M/D/YYYY"];
            
            self.jobSource = CBJobSourceJobSearch;
            
            self.company = jsonDict[@"Company"];
            if(![jsonDict[@"CompanyDetailsURL"] isKindOfClass:[NSNull class]]) {
                self.companyDetailsURL = [NSURL URLWithString:jsonDict[@"CompanyDetailsURL"]];
            }
            if(![jsonDict[@"CompanyImageURL"] isKindOfClass:[NSNull class]]) {
                self.companyImageURL = [NSURL URLWithString:jsonDict[@"CompanyImageURL"]];
            }
            self.DID = jsonDict[@"DID"];
            self.employmentType = jsonDict[@"EmploymentType"];
            self.location = [[CBLocation alloc] init];
            self.location.distanceSummary = jsonDict[@"Dicatance"];
            self.location.latitude = [jsonDict[@"LocationLatitude"] floatValue];
            self.location.longitude = [jsonDict[@"LocationLongitude"] floatValue];
            self.location.locationFormatted = jsonDict[@"Location"];
            self.jobTitle = jsonDict[@"JobTitle"];
            
            self.jobDetailsURL = [NSURL URLWithString:jsonDict[@"JobDetailsURL"]];
            self.jobServiceURL = [NSURL URLWithString:jsonDict[@"JobServiceURL"]];
            self.postedDate = [dateFormatter dateFromString:jsonDict[@"PostedDate"]];
            self.payHigh = [[CBMoney alloc] initWithJSONDict:jsonDict[@"Pay"]];
            self.similarJobsURL = [NSURL URLWithString:jsonDict[@"SimilarJobsURL"]];
        }

    }
    
    return self;
}


/*
 * function that takes an NSDictionary that has been sourced from
 * a JSON responce provided by CB job search results (different than details
 * the dictionary is walked and the CBJob object is populated and returned)
 */
- (id) initWithRecommendedJobResultJSONDict:(NSDictionary *)jsonDict {
    
    self = [super init];
    
    if(self)
    {
        
        if(jsonDict && [jsonDict isKindOfClass:[NSDictionary class]])
        {
            
            self.jobSource = CBJobSourceRecommendations;
            
            self.company = jsonDict[@"Company"][@"CompanyName"];
            if(![jsonDict[@"Company"][@"CompanyDetailsURL"] isKindOfClass:[NSNull class]]) {
                self.companyDetailsURL = [NSURL URLWithString:jsonDict[@"Company"][@"CompanyDetailsURL"]];
            }
            self.DID = jsonDict[@"JobDID"];
            self.jobTitle = jsonDict[@"Title"];
            self.location = [[CBLocation alloc] init];
            self.location.state = jsonDict[@"State"];
            self.location.city = jsonDict[@"City"];
            
            self.jobDetailsURL = [NSURL URLWithString:jsonDict[@"JobDetailsURL"]];
            self.jobServiceURL = [NSURL URLWithString:jsonDict[@"JobServiceURL"]];
            self.similarJobsURL = [NSURL URLWithString:jsonDict[@"SimilarJobsURL"]];
            
            self.relevancy = [jsonDict[@"Relevancy"] floatValue];
        }
        
    }
    
    return self;
}




/*
 * Function to query the careerbuilder API for one job.
 * Requires: sDID to be set, this is the job's identifier
 * Optional: sCobrand - partner tracking code (defaults to global if nil)
 * Optional: sSiteId - tracking code, if you want traffid from your app to be 
 *                     independantly tracked, set this to a unique string for your app.
 *                     (defaults to global if nil)
 */
+ (CBJob *) jobFromAPIWithDID:(NSString *)sDID ANDCobrand:(NSString *)sCobrand ANDSiteID:(NSString *)sSiteID
{
    
    CBJob *returnJob = Nil;
    
    // verify that we have a good job DID
    if(!sDID || sDID.length < 18)
    {
        NSLog(@"Call Aborted: sDID was either empty or was not of correct length (>18 chars)");
    }else{
    
        // make sure we try to use the global parameters should the passed in params be nil
        if(!sCobrand) {
            sCobrand = [CBGlobalCredentials globalInstance].cobrandCode;
        }
        if(!sSiteID) {
            sSiteID = [CBGlobalCredentials globalInstance].siteID;
        }
        
        // validate that we can make our call (means we have a dev key)
        if(![[CBGlobalCredentials globalInstance] valid])
        {
            NSLog(@"Call Aborted: CBGlobalCredentials is invalid, be sure you've initialized with your DeveloperKey.");
        }else{
            NSString *urlString = [NSString stringWithFormat:@"https://api.careerbuilder.com/v1/job?DeveloperKey=%@&OutputJSON=true&DID=%@", [CBGlobalCredentials globalInstance].developerKey, sDID];
            NSURL *url = [NSURL URLWithString:urlString];
            NSLog(@"url = %@", url);
            NSData *jsonData = [NSData dataWithContentsOfURL:url];
            
            if(jsonData != nil)
            {
                NSError *error = nil;
                
                id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                
                if(error == nil)
                {
                    NSDictionary *resultDict = (NSDictionary *)result;
                    returnJob = [[CBJob alloc] initWithJSONDict:resultDict[@"ResponseJob"][@"Job"]];
                }
            }
        }
    }
    
    // return the job to the caller
    return returnJob;
}

@end
