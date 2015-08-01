//
//  CBJobCategory.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/14/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//
//  learn more at: http://api.careerbuilder.com/CategoryCodes.aspx
//

#import <Foundation/Foundation.h>
#import "CBGlobalCredentials.h"

@interface CBJobCategory : NSObject

@property NSString *code;
@property NSString *name;
@property NSString *language;

// country code is optional, default is US
+ (NSArray *) getJobCategories:(NSString *)countryCode;

@end
