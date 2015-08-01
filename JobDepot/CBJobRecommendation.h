//
//  CBJobRecommendation.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 3/4/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBGlobalCredentials.h"
#import "CBJob.h"
#import "CBLocation.h"

@interface CBJobRecommendation : NSObject

// function to get an array of CBJob objects that match the recommendations for a job
+ (NSArray *) recommendationsForJob:(CBJob *)aJob ANDCobrand:(NSString *)sCobrand ANDSiteID:(NSString *)sSiteID;

// function to get an array of CBJob objects that match the recommendations for a job
+ (NSArray *) recommendationsForJobDID:(NSString *)jobDID ANDCobrand:(NSString *)sCobrand ANDSiteID:(NSString *)sSiteID;

@end