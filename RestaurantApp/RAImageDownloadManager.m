//
//  ImageDownloadManager.m
//  BogusCode
//
//  Created by Shashank on 1/27/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

#import "RAImageDownloadManager.h"

@interface RAImageDownloadManager ()

@end

@implementation RAImageDownloadManager

+ (RAImageDownloadManager *)sharedManager {
    static RAImageDownloadManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [RAImageDownloadManager new];
    });
    return sharedManager;
}

- (void)downloadImageForURL:(NSURL *)imageURL
               onCompletion:(ImageDownloadBlock)completionBlock {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:imageURL];
    [NSURLProtocol setProperty:@YES forKey:@"allowcaching" inRequest:request];
    
    NSURLCache *cache = [NSURLCache sharedURLCache];
    NSCachedURLResponse *response = [cache cachedResponseForRequest:request];
    
    __block UIImage *image = nil;
    __block BOOL isCachedResponse = NO;
    
    if(response) {
        image = [[UIImage alloc] initWithData:response.data];
        isCachedResponse = YES;
        completionBlock(image, isCachedResponse, nil);
    }
    else {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data,
                                            NSURLResponse *response, NSError *error) {
        
        if(!error) {
            image = [[UIImage alloc] initWithData:data];
            [cache storeCachedResponse:[[NSCachedURLResponse alloc] initWithResponse:response data:data]
                                            forRequest:request];
            completionBlock(image, isCachedResponse, nil);
        }
        else {
            completionBlock(nil, isCachedResponse, error);
        }
        }];
        [dataTask resume];
    }
}

@end
