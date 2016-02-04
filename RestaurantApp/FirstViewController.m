//
//  FirstViewController.m
//  RestaurantApp
//
//  Created by PCS MV on 1/26/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "FirstViewController.h"
#import <UIImage+AFNetworking.h>


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.restaurants  = [NSMutableArray array];
    UINib *nib = [UINib nibWithNibName:@"RACustomCell" bundle:nil];
    [self.restaurantCollectionView registerNib:nib forCellWithReuseIdentifier:@"Identifier"];
    
    [self fetchData];
}

- (void)fetchData {
    NSURL *url = [NSURL URLWithString:@"http://sandbox.bottlerocketapps.com/BR_iOS_CodingExam_2015_Server/restaurants.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration  *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
     
    NSArray *responseArray = [responseObject valueForKey:@"restaurants"];
    NSError *jsonError = nil;
    for (NSDictionary *obj in responseArray) {
        Restaurant *restaurantObj = [[Restaurant alloc] initWithDictionary:obj error:&jsonError];
    
        [self.restaurants addObject:restaurantObj];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.restaurantCollectionView reloadData];
        }];
        
        NSLog(@"%@",jsonError);
    }
    
        }];
    [dataTask resume];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.restaurants count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RACustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Identifier" forIndexPath:indexPath];
    Restaurant* obj = [self.restaurants objectAtIndex:indexPath.row];
    
    cell.tag = indexPath.row;
    [[RAImageDownloadManager sharedManager] downloadImageForURL:obj.backgroundImageURL onCompletion:^(UIImage *image, BOOL isCachedResponse, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (cell.tag == indexPath.row) {
            cell.restaurantImageView.image = image;
            [cell setNeedsLayout];
            }
        });
     }];
    cell.restaurantNameLabel.text = obj.name;
    cell.categoryTypeLabel.text = obj.category;
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.restaurantCollectionView.frame.size.width, 180);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detailView" sender:nil];
}




@end
