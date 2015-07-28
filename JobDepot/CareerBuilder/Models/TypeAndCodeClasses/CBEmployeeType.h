//
//  CBEmployeeType.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 3/3/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBGlobalCredentials.h"

@interface CBEmployeeType : NSObject

@property NSString *code;
@property NSString *name;
@property NSString *language;

// country code is optional, default is US
+ (NSArray *) getEmploymentTypes:(NSString *)countryCode;

@end
