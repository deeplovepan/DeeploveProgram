//
//  PhotoGalleryTableViewController.h
//  IceCream
//
//  Created by  on 11/12/5.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDownloader.h"

@interface PhotoGalleryTableViewController : UITableViewController <ImageDownloaderDelegate>

@property (nonatomic, retain) NSArray *photoArray;
@property (nonatomic, retain) NSMutableDictionary *imageDownloadsInProgress;

@end
