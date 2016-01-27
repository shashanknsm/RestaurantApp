//
//  RACustomCell.h
//  RestaurantApp
//
//  Created by PCS MV on 1/26/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RACustomCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *restaurantImageView;


@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;


@property (weak, nonatomic) IBOutlet UILabel *categoryTypeLabel;


@end
