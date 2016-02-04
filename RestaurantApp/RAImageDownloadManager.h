//
//  ImageDownloadManager.h
//  BogusCode
//
//  Created by Shashank on 1/27/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ImageDownloadBlock)(UIImage *image,BOOL isCachedResponse, NSError *error);

@interface RAImageDownloadManager : NSObject

@property (nonatomic, strong) NSURLSession *session;

+ (RAImageDownloadManager *)sharedManager;

- (void)downloadImageForURL:(NSURL *)imageURL
               onCompletion:(ImageDownloadBlock)completionBlock;

@end
