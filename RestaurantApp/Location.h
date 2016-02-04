//
//  location.h
//  RestaurantApp
//
//  Created by PCS MV on 1/31/16.
//  Copyright (c) 2016 personal. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Location : JSONModel

@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString <Optional> *crossStreet;
@property (nonatomic, assign) NSInteger lat;
@property (nonatomic, assign) NSInteger lng;
@property (nonatomic, strong) NSString <Optional> *postalCode;
@property (nonatomic, strong) NSString *cc;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSArray *formattedAddress;

@end
