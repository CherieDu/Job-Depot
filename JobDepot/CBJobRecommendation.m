//
//  CBJobRecommendation.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 3/4/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import "CBJobRecommendation.h"

@implementation CBJobRecommendation


+ (NSArray *) recommendationsForJob:(CBJob *)aJob ANDCobrand:(NSString *)sCobrand ANDSiteID:(NSString *)sSiteID {
    return [CBJobRecommendation recommendationsForJobDID:aJob.DID ANDCobrand:sCobrand ANDSiteID:sSiteID];
}

+ (NSArray *) recommendationsForJobDID:(NSString *)jobDID ANDCobrand:(NSString *)sCobrand ANDSiteID:(NSString *)sSiteID {
    NSMutableArray *retRecommendedJobs = [[NSMutableArray alloc] initWithCapacity:10];
    
    // verify that we have a good job DID
    if(!jobDID || jobDID.length < 18)
    {
        NSLog(@"Call Aborted: jobDID was either empty or was not of correct length (>18 chars)");
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
            NSString *urlString = [NSString stringWithFormat:@"https://api.careerbuilder.com/v1/recommendations/forjob?DeveloperKey=%@&OutputJSON=true&JobDID=%@", [CBGlobalCredentials globalInstance].developerKey, jobDID];
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
                    NSArray *recommendationresults = (NSArray *)resultDict[@"ResponseRecommendJob"][@"RecommendJobResults"];
                    
                    NSDictionary *recommendationDict;
                    for(recommendationDict in recommendationresults)
                    {
                        CBJob *aJob = [[CBJob alloc] initWithRecommendedJobResultJSONDict:recommendationDict];
                        [retRecommendedJobs addObject:aJob];
                    }
                }
            }
        }
    }
    
    // return the array of CBRecommendation objects
    return retRecommendedJobs;
}
@end
