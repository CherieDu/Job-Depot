//
//  CBTestimonial.h
//  CareerBuilder
//
//  Created by Adam Parker on 3/5/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBTestimonial : NSObject

@property NSString *employeePhoto;
@property NSString *name;
@property NSString *title;
@property NSNumber *since;
@property NSString *content;

- (id) initWithJSONDict:(NSDictionary *)jsonDict;

@end
