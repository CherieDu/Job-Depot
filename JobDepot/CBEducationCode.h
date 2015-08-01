//
//  CBEducationCode.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 3/3/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBGlobalCredentials.h"

@interface CBEducationCode : NSObject

@property NSString *code;
@property NSString *name;
@property NSString *language;

// country code is optional, default is US
+ (NSArray *) getEducationCodes:(NSString *)countryCode;

@end
