//
//  FirstViewController.h
//  RestaurantApp
//
//  Created by PCS MV on 1/26/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UICollectionViewDataSource,
                                                   UICollectionViewDelegate,
                                                   UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *restaurantCollectionView;

@end

