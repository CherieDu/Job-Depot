//
//  CBJobSearch.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//
//  See header info for CBSearchObject and CBJobSearchResult
//

#import <Foundation/Foundation.h>
#import "CBSearchObject.h"
#import "CBGlobalCredentials.h"
#import "CBJob.h"
#import "CBJobSearchResult.h"

@interface CBJobSearch : NSObject

+ (CBJobSearchResult *) jobsFromAPIWithSearchObject:(CBSearchObject *)searchObj;

@end
