//
//  CBJobSearchResult.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//
//  learn more at: http://api.careerbuilder.com/JobSearchInfo.aspx
//

#import <Foundation/Foundation.h>

@interface CBJobSearchResult : NSObject

@property NSInteger totalPages;
@property NSInteger totalCount;
@property NSInteger firstItemIndex;
@property NSInteger lastItemIndex;
@property NSArray *results;

// convenience method: the number of results that we actually have in our object
- (int) countOfResults;

@end
