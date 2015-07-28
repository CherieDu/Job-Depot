//
//  CBCompany.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 3/3/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import "CBCompany.h"

@implementation CBCompany

@synthesize companyDetailType;

@synthesize companyName;
@synthesize companyDID;
@synthesize HHName;
@synthesize URL;
@synthesize imageFile;
@synthesize yearFounded;
@synthesize FBPageURL;
@synthesize companySize;
@synthesize companyType;
@synthesize historyBody;
@synthesize peopleBody;
@synthesize contactBody;
@synthesize facebookURL;
@synthesize twitterURL;
@synthesize linkedinURL;
@synthesize benefitsBody;
@synthesize companyLogo;
@synthesize visionBody;
@synthesize productsBody;
@synthesize careerOpportunitiesBody;
@synthesize newsFeed;
@synthesize overview;
@synthesize cultureBody;
@synthesize totalNumberJobs;
@synthesize headquarter;
@synthesize hostSites; // CSV
@synthesize companyPhotos; // array of NSStrings of the photo file
@synthesize companyAddresses; // array of CBLocations
@synthesize companyBulletinBoards; // array of CBBulletinBoard Objects
@synthesize testimonials; // array of CBTestimonial ojects
@synthesize companyLinks; // array of NSStrngs
@synthesize collegeBody;
@synthesize diversityBody;
@synthesize veteranHiringProgram;//MilitaryIcon;
@synthesize industryTypes; // array of strings



/*
 * function that takes an NSDictionary that has been sourced from
 * a JSON responce provided by CB's Company API call
 * the dictionary is walked and the CBCompany object is populated and returned
 */
- (id) initWithCompanyJSONDict:(NSDictionary *)jsonDict {
    self = [super init];
    
    if(self)
    {
        self.companyDID = jsonDict[@"Id"];
        self.imageFile = jsonDict[@"Logo"];
        self.companyName = jsonDict[@"Name"];
        self.companyType = jsonDict[@"Type"];
        if(jsonDict[@"Types"] != [NSNull null]){
            self.industryTypes = [jsonDict[@"Types"] componentsSeparatedByString:@","];
        }
        
        CBLocation *hqLocation = [[CBLocation alloc] init];
        hqLocation.city = jsonDict[@"HQCity"];
        hqLocation.state = jsonDict[@"HQState"];
        hqLocation.postalCode = jsonDict[@"HQZip"];
        self.headquarter = [hqLocation toHeadquartersString];
        
        self.companySize = jsonDict[@"NumberOfEmployees"];
        if(jsonDict[@"Website"] != [NSNull null]){
            self.URL = [NSURL URLWithString:jsonDict[@"Website"]];
        }
        self.overview = jsonDict[@"Overview"];
        self.benefitsBody = jsonDict[@"Benefits"];
        self.cultureBody = jsonDict[@"Culture"];
        self.careerOpportunitiesBody = jsonDict[@"Opportunities"];
        if(jsonDict[@"Facebook"] != [NSNull null]){
            self.facebookURL = [NSURL URLWithString:jsonDict[@"Facebook"]];
        }
        if(jsonDict[@"Twitter"] != [NSNull null]){
            self.twitterURL = [NSURL URLWithString:jsonDict[@"Twitter"]];
        }
        if(jsonDict[@"LinkedIn"] != [NSNull null]){
            self.linkedinURL = [NSURL URLWithString:jsonDict[@"LinkedIn"]];
        }
        self.veteranHiringProgram = [jsonDict[@"HasVeteranHiringInitiatives"] boolValue];
    }

    return self;
}


/*
 * function that takes an NSDictionary that has been sourced from
 * a JSON responce provided by CB's CompanyDetail API call
 * the dictionary is walked and the CBCompany object is populated and returned
 */
- (id) initWithCompanyDetailJSONDict:(NSDictionary *)jsonDict {
    
    self = [super init];
    
    if(self)
    {
        self.companyName = jsonDict[@"CompanyName"];
        self.companyDID = jsonDict[@"CompanyDID"];
        self.HHName = jsonDict[@"HHName"];
        if(jsonDict[@"URL"] != [NSNull null]){
            self.URL = [NSURL URLWithString:jsonDict[@"URL"]];
        }
        self.imageFile = jsonDict[@"ImageFile"];
        if(jsonDict[@"YearFounded"] != [NSNull null]){
            self.yearFounded = [NSNumber numberWithInteger:[jsonDict[@"YearFounded"] integerValue]];
        }
        if(jsonDict[@"FBPageURL"] != [NSNull null]){
            self.FBPageURL = [NSURL URLWithString:jsonDict[@"FBPageURL"]];
        }
        self.companySize = jsonDict[@"CompanySize"];
        self.companyType = jsonDict[@"CompanyType"];
        self.historyBody = jsonDict[@"HistoryBody"];
        self.peopleBody = jsonDict[@"PeopleBody"];
        self.contactBody = jsonDict[@"ContactBody"];
        if(jsonDict[@"FacebookURL"] != [NSNull null]){
            self.facebookURL = [NSURL URLWithString:jsonDict[@"FacebookURL"]];
        }
        if(jsonDict[@"TwitterURL"] != [NSNull null]){
            self.twitterURL = [NSURL URLWithString:jsonDict[@"TwitterURL"]];
        }
        if(jsonDict[@"LinkedURL"] != [NSNull null]){
            self.linkedinURL = [NSURL URLWithString:jsonDict[@"LinkedURL"]];
        }
        self.benefitsBody = jsonDict[@"BenefitsBody"];
        self.companyLogo = jsonDict[@"CompanyLogo"];
        self.visionBody = jsonDict[@"VisionBody"];
        self.productsBody = jsonDict[@"ProductsBody"];
        self.careerOpportunitiesBody = jsonDict[@"CareerOpportunitiesBody"];
        self.newsFeed = jsonDict[@"NewsFeed"];
        self.overview = jsonDict[@"Overview"];
        self.cultureBody = jsonDict[@"CultureBody"];
        if(jsonDict[@"TotalNumberJobs"] != [NSNull null]){
            NSInteger i = [jsonDict[@"TotalNumberJobs"] integerValue];
            self.totalNumberJobs = [NSNumber numberWithInteger:i];
        }
        self.headquarter = jsonDict[@"Headquarter"];
        if(jsonDict[@"HostSites"] != [NSNull null]){
            self.hostSites = [jsonDict[@"HostSites"] componentsSeparatedByString:@","];
        }
        self.companyPhotos = [CBCompany companyPhotosArrayFromJSON:jsonDict[@"CompanyPhotos"]];
        self.companyAddresses = [CBCompany addressArrayFromJSON:jsonDict[@"CompanyAddress"]];
        self.companyBulletinBoards = [CBCompany bulletinBoardsArrayFromJSON:jsonDict[@"CompanyBulletinBoard"]];
        self.testimonials = [CBCompany testimonialsArrayFromJSON:jsonDict[@"Testimonials"]];
        self.companyLinks = [CBCompany companyLinksArrayFromJSON:jsonDict[@"CompanyLinksCollection"]];
        self.collegeBody = jsonDict[@"CollegeBody"];
        self.diversityBody = jsonDict[@"DiversityBody"];
        self.veteranHiringProgram = [jsonDict[@"MilitaryIcon"] boolValue];
        self.industryTypes = [CBCompany industryTypesArrayFromJSON:jsonDict[@"IndustryType"]];
    }
    
    return self;
}


- (void) logObject {
    NSLog(@"Company Detail Output");
    NSLog(@"---------------------");
    NSLog(@"Company Name: %@", self.companyName);
    NSLog(@"Company DID: %@", self.companyDID);
    NSLog(@"URL: %@", self.URL);
    NSLog(@"Image File: %@", self.imageFile);
    NSLog(@"Year Founded: %@", self.yearFounded);
    NSLog(@"FB Page URL: %@", self.FBPageURL);
    NSLog(@"Company Size: %@", self.companySize);
    NSLog(@"Company Type: %@", self.companyType);
    NSLog(@"History Body: %@", self.historyBody);
    NSLog(@"People Body: %@", self.peopleBody);
    NSLog(@"Contact Body: %@", self.contactBody);
    NSLog(@"Facebook URL: %@", self.facebookURL);
    NSLog(@"Twitter URL: %@", self.twitterURL);
    NSLog(@"Linkedin URL: %@", self.linkedinURL);
    NSLog(@"Benefits Body: %@", self.benefitsBody);
    NSLog(@"Company Logo: %@", self.companyLogo);
    NSLog(@"Vision Body: %@", self.visionBody);
    NSLog(@"Products Body: %@", self.productsBody);
    NSLog(@"Career Opp Body: %@", self.careerOpportunitiesBody);
    NSLog(@"News Feed: %@", self.newsFeed);
    NSLog(@"Overview: %@", self.overview);
    NSLog(@"Culture Body: %@", self.cultureBody);
    NSLog(@"Total Number Jobs: %@", self.totalNumberJobs);
    NSLog(@"Headquarter: %@", self.headquarter);
    NSLog(@"Host Sites: %@", self.hostSites);
    NSLog(@"Company Photos: %@", self.companyPhotos);
    NSLog(@"Company Addresses: %@", self.companyAddresses);
    NSLog(@"Company Bulletin Boards: %@", self.companyBulletinBoards);
    NSLog(@"Testimonials: %@", self.testimonials);
    NSLog(@"Company Links: %@", self.companyLinks);
    NSLog(@"College Body: %@", self.collegeBody);
    NSLog(@"Diversity Body: %@", self.diversityBody);
    if(self.veteranHiringProgram) {
        NSLog(@"Veteran Hiring: YES");
    }else{
        NSLog(@"Veteran Hiring: NO");
    }
    NSLog(@"Industry Types: %@", self.industryTypes);
    
}


/*
 * Function to query the careerbuilder API for full company details.
 * Requires: sCompanyDID to be set, this is the company identifier
 * Desc: Calls the api.careerbuilder.com/employer/companydetails URL
 */
+ (CBCompany *) fullCompany:(NSString *)sCompanyDID
{
    
    CBCompany *returnCompany = Nil;
    
    // verify that we have a good job DID
    if(!sCompanyDID || sCompanyDID.length < 18)
    {
        NSLog(@"Call Aborted: sCompanyDID was either empty or was not of correct length (>18 chars)");
    }else{
        
        // validate that we can make our call (means we have a dev key)
        if(![[CBGlobalCredentials globalInstance] valid])
        {
            NSLog(@"Call Aborted: CBGlobalCredentials is invalid, be sure you've initialized with your DeveloperKey.");
        }else{
            NSString *urlString = [NSString stringWithFormat:@"https://api.careerbuilder.com/employer/companydetails?DeveloperKey=%@&OutputJSON=true&CompanyDID=%@", [CBGlobalCredentials globalInstance].developerKey, sCompanyDID];
            NSURL *url = [NSURL URLWithString:urlString];
            NSLog(@"url = %@", url);
            NSData *jsonData = [NSData dataWithContentsOfURL:url];
            
            if(jsonData != nil)
            {
                NSError *error = nil;
                
                id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                
                if(error == nil)
                {
                    NSDictionary *resultDict = (NSDictionary *)result;
                    returnCompany = [[CBCompany alloc] initWithCompanyDetailJSONDict:resultDict[@"Results"][@"CompanyProfileDetail"]];
                    returnCompany.companyDetailType = CBCompanyTypeFull;
                }
            }
        }
    }
    
    // return the companydetail to the caller
    return returnCompany;
}



/*
 * Function to query the careerbuilder API for full company details.
 * Requires: sCompanyDID to be set, this is the company identifier
 * Desc: Calls the api.careerbuilder.com/employer/companydetails URL
 */
+ (CBCompany *) basicCompany:(NSString *)sCompanyDID
{
    
    CBCompany *returnCompany = Nil;
    
    // verify that we have a good job DID
    if(!sCompanyDID || sCompanyDID.length < 18)
    {
        NSLog(@"Call Aborted: sCompanyDID was either empty or was not of correct length (>18 chars)");
    }else{
        
        // validate that we can make our call (means we have a dev key)
        if(![[CBGlobalCredentials globalInstance] valid])
        {
            NSLog(@"Call Aborted: CBGlobalCredentials is invalid, be sure you've initialized with your DeveloperKey.");
        }else{
            NSString *urlString = [NSString stringWithFormat:@"https://api.careerbuilder.com/company?DeveloperKey=%@&ResponseFormat=json&id=%@", [CBGlobalCredentials globalInstance].developerKey, sCompanyDID];
            NSURL *url = [NSURL URLWithString:urlString];
            NSLog(@"url = %@", url);
            NSData *jsonData = [NSData dataWithContentsOfURL:url];
            
            if(jsonData != nil)
            {
                NSError *error = nil;
                
                id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
                
                if(error == nil)
                {
                    NSDictionary *resultDict = (NSDictionary *)result;
                    returnCompany = [[CBCompany alloc] initWithCompanyJSONDict:resultDict];
                    returnCompany.companyDetailType = CBCompanyTypeBasic;
                }
            }
        }
    }
    
    // return the companydetail to the caller
    return returnCompany;
}



+ (NSArray *) companyPhotosArrayFromJSON:(NSDictionary *)jsonDict {
    NSMutableArray *retArr = [[NSMutableArray alloc] initWithCapacity:3];
    
    if(jsonDict) {
        // pull out what we can, it can be null or an array or a single address
        id photoCollection = jsonDict[@"PhotoList"][@"Photo"];
        if(photoCollection && [photoCollection isKindOfClass:[NSArray class]]){
            NSDictionary *rawPhoto = nil;
            for(rawPhoto in photoCollection) {
                [retArr addObject:rawPhoto[@"PhotoName"]];
            }
        }else if(photoCollection && [photoCollection isKindOfClass:[NSDictionary class]]){
            [retArr addObject:photoCollection[@"PhotoName"]];
        }
    }
    
    return retArr;
}

+ (NSArray *) addressArrayFromJSON:(NSDictionary *)jsonDict {
    NSMutableArray *retArr = [[NSMutableArray alloc] initWithCapacity:3];
    
    if(jsonDict) {
        // pull out what we can, it can be null or an array or a single address
        id addressCollection = jsonDict[@"AddressList"][@"Address"];
        if(addressCollection && [addressCollection isKindOfClass:[NSArray class]]){
            NSDictionary *rawAddress = nil;
            for(rawAddress in addressCollection) {
                CBLocation *anAddress = [[CBLocation alloc] initWithCompanyAddressJSONDict:rawAddress];
                [retArr addObject:anAddress];
            }
        }else if(addressCollection && [addressCollection isKindOfClass:[NSDictionary class]]){
            CBLocation *anAddress = [[CBLocation alloc] initWithCompanyAddressJSONDict:addressCollection];
            [retArr addObject:anAddress];
        }
    }
    
    return retArr;
}

+ (NSArray *) bulletinBoardsArrayFromJSON:(NSDictionary *)jsonDict {
    NSMutableArray *retArr = [[NSMutableArray alloc] initWithCapacity:3];
    
    if(jsonDict) {
        // pull out what we can, it can be null or an array or a single address
        id bbCollection = jsonDict[@"bulletinboards"][@"BulletinBoard"];
        if(bbCollection && [bbCollection isKindOfClass:[NSArray class]]){
            NSDictionary *rawBB = nil;
            for(rawBB in bbCollection) {
                CBBulletinBoard *aBB = [[CBBulletinBoard alloc] initWithJSONDict:rawBB];
                [retArr addObject:aBB];
            }
        }else if(bbCollection && [bbCollection isKindOfClass:[NSDictionary class]]){
            CBBulletinBoard *aBB = [[CBBulletinBoard alloc] initWithJSONDict:bbCollection];
            [retArr addObject:aBB];
        }
    }
    
    return retArr;
}

+ (NSArray *) testimonialsArrayFromJSON:(NSDictionary *)jsonDict {
    NSMutableArray *retArr = [[NSMutableArray alloc] initWithCapacity:3];
    
    if(jsonDict) {
        // pull out what we can, it can be null or an array or a single address
        id testimonialCollection = jsonDict[@"Testimonials"][@"Testimonial"];
        if(testimonialCollection && [testimonialCollection isKindOfClass:[NSArray class]]){
            NSDictionary *rawTestimonial = nil;
            for(rawTestimonial in testimonialCollection) {
                CBTestimonial *aTestimonial = [[CBTestimonial alloc] initWithJSONDict:rawTestimonial];
                [retArr addObject:aTestimonial];
            }
        }else if(testimonialCollection && [testimonialCollection isKindOfClass:[NSDictionary class]]){
            CBTestimonial *aTestimonial = [[CBTestimonial alloc] initWithJSONDict:testimonialCollection];
            [retArr addObject:aTestimonial];
        }
    }
    
    return retArr;
}

+ (NSArray *) companyLinksArrayFromJSON:(NSDictionary *)jsonDict {
    NSMutableArray *retArr = [[NSMutableArray alloc] initWithCapacity:3];
    
    if(jsonDict) {
        // pull out what we can, it can be null or an array or a single address
        id linksCollection = jsonDict[@"companylinks"];
        if(linksCollection && [linksCollection isKindOfClass:[NSArray class]]){
            NSDictionary *rawLink = nil;
            for(rawLink in linksCollection) {
                // I don't know the format and don't know what to do
            }
        }else if(linksCollection && [linksCollection isKindOfClass:[NSDictionary class]]){
            // I don't know the format and don't know what to do
        }
    }
    
    return retArr;
}

+ (NSArray *) industryTypesArrayFromJSON:(NSDictionary *)jsonDict {
    NSArray *retArr = [[NSArray alloc] init];
    
    NSArray *values = jsonDict[@"string"];
    if(values != Nil){
        retArr = [retArr arrayByAddingObjectsFromArray:values];
    }
    
    return retArr;
}

//

@end
