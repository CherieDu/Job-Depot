//
//  CBCompany.h
//  CareerBuilder Company Object
//
//  Created by Adam Parker on 3/3/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBGlobalCredentials.h"
#import "CBLocation.h"
#import "CBBulletinBoard.h"
#import "CBTestimonial.h"

typedef NS_ENUM(NSInteger, CBCompanyType) {
    CBCompanyTypeBasic = 0,
    CBCompanyTypeFull = 1
};

@interface CBCompany : NSObject

@property CBCompanyType companyDetailType;

@property NSString *companyName;
@property NSString *companyDID;
@property NSString *HHName;
@property NSURL *URL;
@property NSString *imageFile;
@property NSNumber *yearFounded;
@property NSURL *FBPageURL;
@property NSString *companySize;
@property NSString *companyType;
@property NSString *historyBody;
@property NSString *peopleBody;
@property NSString *contactBody;
@property NSURL *facebookURL;
@property NSURL *twitterURL;
@property NSURL *linkedinURL;
@property NSString *benefitsBody;
@property NSString *companyLogo;
@property NSString *visionBody;
@property NSString *productsBody;
@property NSString *careerOpportunitiesBody;
@property NSString *newsFeed;
@property NSString *overview;
@property NSString *cultureBody;
@property NSNumber *totalNumberJobs;
@property NSString *headquarter;
@property NSArray *hostSites; // CSV
@property NSArray *companyPhotos; // array of NSStrings of the photo file
@property NSArray *companyAddresses; // array of CBLocations
@property NSArray *companyBulletinBoards; // array of CBBulletinBoard Objects
@property NSArray *testimonials; // array of CBTestimonial ojects
@property NSArray *companyLinks; // array of NSStrngs
@property NSString *collegeBody;
@property NSString *diversityBody;
@property Boolean veteranHiringProgram;//MilitaryIcon;
@property NSArray *industryTypes; // array of strings

- (id) initWithCompanyJSONDict:(NSDictionary *)jsonDict;
- (id) initWithCompanyDetailJSONDict:(NSDictionary *)jsonDict;
- (void) logObject;

+ (CBCompany *) fullCompany:(NSString *)sCompanyDID; // calls the CompanyDetail API
+ (CBCompany *) basicCompany:(NSString *)sCompanyDID; // calls the Company API

+ (NSArray *) companyPhotosArrayFromJSON:(NSDictionary *)jsonDict;
+ (NSArray *) addressArrayFromJSON:(NSDictionary *)jsonDict;
+ (NSArray *) bulletinBoardsArrayFromJSON:(NSDictionary *)jsonDict;
+ (NSArray *) testimonialsArrayFromJSON:(NSDictionary *)jsonDict;
+ (NSArray *) companyLinksArrayFromJSON:(NSDictionary *)jsonDict;
+ (NSArray *) industryTypesArrayFromJSON:(NSDictionary *)jsonDict;


@end
