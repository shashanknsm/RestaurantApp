//
//  contact.h
//  RestaurantApp
//
//  Created by PCS MV on 1/31/16.
//  Copyright (c) 2016 personal. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Contact : JSONModel


@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *formattedPhone;
@property (nonatomic, strong) NSString <Optional>*twitter;


@end
