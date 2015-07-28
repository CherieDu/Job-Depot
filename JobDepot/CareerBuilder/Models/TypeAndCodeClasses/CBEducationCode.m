//
//  CBEducationCode.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 3/3/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import "CBEducationCode.h"

@implementation CBEducationCode

@synthesize code;
@synthesize name;
@synthesize language;

+ (NSArray *) getEducationCodes:(NSString *)countryCode {
    NSMutableArray *retEducationCodes = [[NSMutableArray alloc] initWithCapacity:10];
    
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
            NSString *urlString = [NSString stringWithFormat:@"https://api.careerbuilder.com/v1/educationcodes?DeveloperKey=%@&OutputJSON=true", [CBGlobalCredentials globalInstance].developerKey];
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
                        NSArray *educationCodes = (NSArray *)resultDict[@"ResponseEducationCodes"][@"EducationCodes"][@"Education"];
                        
                        NSDictionary *educationDict;
                        for(educationDict in educationCodes)
                        {
                            CBEducationCode *anEducationCode = [[CBEducationCode alloc] init];
                            anEducationCode.code = educationDict[@"Code"];
                            anEducationCode.name = educationDict[@"Name"][@"#text"];
                            anEducationCode.language = educationDict[@"Name"][@"@language"];
                            
                            [retEducationCodes addObject:anEducationCode];
                        }
                    }
                }
            }
        }
    }
    
    return retEducationCodes;
}


@end
