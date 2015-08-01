//
//  CBAPIError.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBAPIError : NSObject

@property NSString *errorMessage;

- (id) initWithJSONDict:(NSDictionary *)jsonDict;

@end
