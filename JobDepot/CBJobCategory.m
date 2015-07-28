//
//  CBJobCategory.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/14/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBJobCategory.h"

@implementation CBJobCategory

@synthesize code;
@synthesize name;
@synthesize language;

+ (NSArray *) getJobCategories:(NSString *)countryCode {
    NSMutableArray *retCategories = [[NSMutableArray alloc] initWithCapacity:10];
    
    // verify that we have a valid search object
    if(countryCode && countryCode.length != 2)
    {
        NSLog(@"Call Aborted: Country code not a valid format.  Must be 2 character country code;");
    }else{
        
        // validate that we can make our call (means we have a dev key)
        if(![[CBGlobalCredentials globalInstance] valid])
        {
            NSLog(@"Call Aborted: CBGlobalCredentials is invalid, be sure you've initialized with your DeveloperKey.");
        }else{
            NSString *urlString = [NSString stringWithFormat:@"https://api.careerbuilder.com/v1/categories?DeveloperKey=%@&OutputJSON=true", [CBGlobalCredentials globalInstance].developerKey];
            if(countryCode != nil) {
                urlString = [urlString stringByAppendingFormat:@"&CountryCode=%@", countryCode];
            }

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
                        NSArray *categories = (NSArray *)resultDict[@"ResponseCategories"][@"Categories"][@"Category"];
                        
                        NSDictionary *categoryDict;
                        for(categoryDict in categories)
                        {
                            CBJobCategory *aCategory = [[CBJobCategory alloc] init];
                            aCategory.code = categoryDict[@"Code"];
                            aCategory.name = categoryDict[@"Name"][@"#text"];
                            aCategory.language = categoryDict[@"Name"][@"@language"];
                            
                            [retCategories addObject:aCategory];
                        }
                    }
                }
            }
        }
    }
    
    return retCategories;
}

@end
