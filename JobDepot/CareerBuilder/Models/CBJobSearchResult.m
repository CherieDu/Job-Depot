//
//  CBJobSearchResult.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBJobSearchResult.h"

@implementation CBJobSearchResult

@synthesize totalPages;
@synthesize totalCount;
@synthesize firstItemIndex;
@synthesize lastItemIndex;
@synthesize results;

- (int) countOfResults {
    int count = 0;
    if(self.results != nil) {
        count = self.results.count;
    }
    return count;
        
}

@end
