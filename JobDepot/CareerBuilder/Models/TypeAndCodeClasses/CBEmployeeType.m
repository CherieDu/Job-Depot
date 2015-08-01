//
//  CBEmployeeType.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 3/3/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import "CBEmployeeType.h"

@implementation CBEmployeeType

@synthesize code;
@synthesize name;
@synthesize language;

+ (NSArray *) getEmploymentTypes:(NSString *)countryCode {
    NSMutableArray *retEmploymentTypes = [[NSMutableArray alloc] initWithCapacity:10];
    
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
            NSString *urlString = [NSString stringWithFormat:@"https://api.careerbuilder.com/v1/employeetypes?DeveloperKey=%@&OutputJSON=true", [CBGlobalCredentials globalInstance].developerKey];
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
                        NSArray *employeeTypes = (NSArray *)resultDict[@"ResponseEmployeeTypes"][@"EmployeeTypes"][@"EmployeeType"];
                        
                        NSDictionary *employeeTypeDict;
                        for(employeeTypeDict in employeeTypes)
                        {
                            CBEmployeeType *anEmployeeType = [[CBEmployeeType alloc] init];
                            anEmployeeType.code = employeeTypeDict[@"Code"];
                            anEmployeeType.name = employeeTypeDict[@"Name"][@"#text"];
                            anEmployeeType.language = employeeTypeDict[@"Name"][@"@language"];
                            
                            [retEmploymentTypes addObject:anEmployeeType];
                        }
                    }
                }
            }
        }
    }
    
    return retEmploymentTypes;
}


@end
