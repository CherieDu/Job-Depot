//
//  CBJob.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//
//  learn more at: http://api.careerbuilder.com/JobInfo.aspx
//

#import <Foundation/Foundation.h>
#import "CBGlobalCredentials.h"
#import "CBLocation.h"
#import "CBMoney.h"


typedef NS_ENUM(NSInteger, CBJobSource) {
    CBJobSourceJobDetail = 0,
    CBJobSourceJobSearch = 1,
    CBJobSourceRecommendations = 2
};

@interface CBJob : NSObject

@property CBJobSource jobSource;

@property NSURL *applyURL;
@property BOOL bExternalApplication;
@property NSURL *applicationSubmitServiceURL;
@property NSDate *beginDate;
@property NSURL *blankApplicationServiceURL;
@property NSArray *categories;
@property NSString *company;
@property NSURL *companyDetailsURL;
@property NSString *companyDID;
@property NSURL *companyJobSearchURL;
@property NSURL *companyImageURL;
@property NSURL *contactInfoEmailURL;
@property NSString *contactInfoFax;
@property NSString *contactInfoName;
@property NSString *contactInfoPhone;
@property NSString *degreeRequired;
@property NSString *DID;
@property NSString *displayJobID;
@property NSString *division;
@property NSString *employmentType;
@property NSDate *endDate;
@property NSString *experienceRequired;
@property NSString *jobDescription;
@property NSString *jobRequirements;
@property NSString *jobTitle;
@property CBLocation *location;
@property BOOL bManagesOthers;
@property NSDate *modifiedDate;
@property CBMoney *payHigh;
@property CBMoney *payLow;
@property NSString *payPer;
@property NSString *payHighLowFormatted;
@property CBMoney *payCommission;
@property CBMoney *payBonus;
@property CBMoney *payOther;
@property NSURL *printerFriendlyURL;
@property BOOL bRelocationCovered;
@property BOOL bTravelRequired;

// search/recommendation results exclusive parameters
@property NSURL *jobDetailsURL;
@property NSURL *jobServiceURL;
@property NSDate *postedDate;
@property NSURL *similarJobsURL;

// recommended Jobs exclusive parameters
@property float relevancy;

- (id) initWithJSONDict:(NSDictionary *)jsonDict;
- (id) initWithSearchResultJSONDict:(NSDictionary *)jsonDict; // job search returns data slightly differently
- (id) initWithRecommendedJobResultJSONDict:(NSDictionary *)jsonDict; // job recommendations returns data slightly differently (very light data)
                                          
+ (CBJob *) jobFromAPIWithDID:(NSString *)sDID ANDCobrand:(NSString *)sCobrand ANDSiteID:(NSString *)sSiteID;

@end
