//
//  CBMoney.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBMoney.h"

@implementation CBMoney

@synthesize amount;
@synthesize currencyCode;
@synthesize formattedAmount;

- (id) initWithJSONDict:(NSDictionary *)jsonDict
{
    self = [super init];
    
    if(self) {
        if(jsonDict && [jsonDict isKindOfClass:[NSDictionary class]])
        {
            if(jsonDict[@"Money"])
            {
                self.amount = [jsonDict[@"Amount"] floatValue];
                self.currencyCode = jsonDict[@"CurrencyCode"];
                self.formattedAmount = jsonDict[@"FormattedAmount"];
            }
        }
    }
    
    return self;
}

@end
