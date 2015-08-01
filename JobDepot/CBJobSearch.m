//
//  CBJobSearch.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBJobSearch.h"

@implementation CBJobSearch

+ (CBJobSearchResult *) jobsFromAPIWithSearchObject:(CBSearchObject *)searchObj
{
    CBJobSearchResult *returnResults = [[CBJobSearchResult alloc] init];
    
    
    // verify that we have a valid search object
    if(!searchObj)
    {
        NSLog(@"Call Aborted: Search object was not valid.");
    }else{
        
        // validate that we can make our call (means we have a dev key)
        if(![[CBGlobalCredentials globalInstance] valid])
        {
            NSLog(@"Call Aborted: CBGlobalCredentials is invalid, be sure you've initialized with your DeveloperKey.");
        }else{
            NSString *urlString = [NSString stringWithFormat:@"https://api.careerbuilder.com/v1/jobsearch?DeveloperKey=%@&OutputJSON=true%@", [CBGlobalCredentials globalInstance].developerKey, [searchObj toQueryString]];
            NSURL *url = [NSURL URLWithString:urlString];

            NSData *jsonData = [NSData dataWithContentsOfURL:url];
            
            if(jsonData != nil)
            {
                NSError *error = nil;
                
                id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                
                if(error == nil)
                {
                    if([result isKindOfClass:[NSDictionary class]])
                    {
                        NSDictionary *resultDict = (NSDictionary *)result;
                        returnResults.totalPages = [resultDict[@"ResponseJobSearch"][@"TotalPages"] integerValue];
                        returnResults.totalCount = [resultDict[@"ResponseJobSearch"][@"TotalCount"] integerValue];
                        returnResults.firstItemIndex = [resultDict[@"ResponseJobSearch"][@"FirstItemIndex"] integerValue];
                        returnResults.lastItemIndex = [resultDict[@"ResponseJobSearch"][@"LastItemIndex"] integerValue];
                        
                        NSArray *jobResults = resultDict[@"ResponseJobSearch"][@"Results"][@"JobSearchResult"];

                        NSDictionary *searchResultDict;
                        NSMutableArray *resultsArray =  [[NSMutableArray alloc] initWithCapacity:25];
                        for(searchResultDict in jobResults)
                        {
                            CBJob *aJob = [[CBJob alloc] initWithSearchResultJSONDict:searchResultDict];
                            [resultsArray addObject:aJob];
                        }
                        
                        returnResults.results = resultsArray;
                    }
                }
            }
        }
    }

    return returnResults;
}

@end
