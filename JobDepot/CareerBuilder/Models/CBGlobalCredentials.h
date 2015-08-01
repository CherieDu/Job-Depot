//
//  CBGlobalCredentials.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBGlobalCredentials : NSObject

@property NSString *developerKey;
@property NSString *siteID;
@property NSString *cobrandCode;

- (BOOL) valid;

+ (CBGlobalCredentials *)globalInstance;
@end
