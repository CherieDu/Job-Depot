//
//  CBMoney.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBMoney : NSObject

@property float amount;
@property NSString *currencyCode;
@property NSString *formattedAmount;

- (id) initWithJSONDict:(NSDictionary *)jsonDict;

@end
