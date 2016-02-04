//
//  Restaurant.h
//  RestaurantApp
//
//  Created by PCS MV on 1/31/16.
//  Copyright (c) 2016 personal. All rights reserved.
//

//{
//    "name": "Hopdoddy Burger Bar",
//    "backgroundImageURL": "http://sandbox.bottlerocketapps.com/BR_iOS_CodingExam_2015_Server/Images/hopdoddy.png",
//    "category" : "Burgers",
//        "contact": {
//            "phone": "9723872337",
//            "formattedPhone": "(972) 387-2337",
//            "twitter": "hopdoddy"
//        },
//        "location": {
//            "address": "5100 Belt Line Road, STE 502",
//            "crossStreet": "Dallas North Tollway",
//            "lat": 32.950787,
//            "lng": -96.821118,
//            "postalCode": "75254",
//            "cc": "US",
//            "city": "Addison",
//            "state": "TX",
//            "country": "United States",
//            "formattedAddress": [
//                "5100 Belt Line Road, STE 502 (Dallas North Tollway)",
//                "Addison, TX 75254",
//                "United States"
//            ]
//        }
//}

#import <JSONModel/JSONModel.h>
#import "Contact.h"
#import "Location.h"

@interface Restaurant : JSONModel


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *backgroundImageURL;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) Contact <Optional>*contact;
@property (nonatomic, strong) Location *location;

@end
