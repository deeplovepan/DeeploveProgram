//
//  PhotoGalleryTableViewController.m
//  IceCream
//
//  Created by  on 11/12/5.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "PhotoGalleryTableViewController.h"
#import "TouchImageView.h"
#import "ImageRecord.h"

#define PHOTO_COUNT_OF_ONE_CELL 4 
#define PHOTO_START_X 5
#define PHOTO_START_Y 5
#define PHOTO_X_DISTANCE 5
#define ROW_HEIGHT 80

#define TAG_PHOTO 100

@implementation PhotoGalleryTableViewController

@synthesize photoArray;
@synthesize imageDownloadsInProgress;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        //self.photoArray = [[NSMutableArray alloc] init];

    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)dealloc
{
    [imageDownloadsInProgress release];
    [photoArray release];
    [super dealloc];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.imageDownloadsInProgress = [NSMutableDictionary dictionary];
    self.view.frame = CGRectMake(0, 0, 320, 480-20);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = ROW_HEIGHT;
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)setCellImageAtIndex:(int)index imageView:(UIImageView*)imageView 
{
    ImageRecord *imageRecord = [self.photoArray objectAtIndex:index];
    if(imageRecord.image)
    {
        imageView.image = imageRecord.image;
    }
    else
    {
        if (self.tableView.dragging == NO && self.tableView.decelerating == NO)
        {
            [self startImageDownload:imageRecord imageIndex:index];
        }
    }

}

#pragma makr - download 

// this method is used in case the user scrolled into a set of cells that don't have their app icons yet
- (void)loadImagesForOnscreenRows
{
     int photoCount = [self.photoArray count];

     if (photoCount > 0)
     {
         NSArray *visiblePaths = [self.tableView indexPathsForVisibleRows];
         for (NSIndexPath *indexPath in visiblePaths)
         {
             int startIndex = indexPath.row*PHOTO_COUNT_OF_ONE_CELL;
             int index = startIndex;
             
             UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
             
             for(UIView *tempView in cell.subviews)
             {
                 
                 if(tempView.tag == TAG_PHOTO)
                 {
                     UIImageView *imageView = (UIImageView*)tempView;
                     [self setCellImageAtIndex:index imageView:imageView];
                     index++;
                     if(index == photoCount)
                     {
                         break;
                     }
                 }
                 
             }

             
        }
     }
     
}


- (void)startImageDownload:(ImageRecord*)record imageIndex:(int)imageIndex
{
    NSNumber *indexNumber = [NSNumber numberWithInt:imageIndex];
    ImageDownloader *imageDownloader = [imageDownloadsInProgress objectForKey:indexNumber];
    if (imageDownloader == nil) 
    {
        imageDownloader = [[ImageDownloader alloc] init];
        imageDownloader.record = record;
        imageDownloader.imageIndex = imageIndex;
        imageDownloader.delegate = self;
        [imageDownloadsInProgress setObject:imageDownloader forKey:indexNumber];
        [imageDownloader startDownload];
        [imageDownloader release];   
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if([self.photoArray count] == 0)
    {
        return 0;
    }
    else
    {
        NSLog(@"numberOfRowsInSection %d", (([self.photoArray count]-1)/PHOTO_COUNT_OF_ONE_CELL)+1);
        return (([self.photoArray count]-1)/PHOTO_COUNT_OF_ONE_CELL)+1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ImageCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    int i;
    int startIndex = indexPath.row*PHOTO_COUNT_OF_ONE_CELL;
    int index = startIndex;
    int photoCount = [self.photoArray count];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        
        float x = PHOTO_START_X;
        float y = PHOTO_START_Y;
        
        for(i=0; i<PHOTO_COUNT_OF_ONE_CELL; i++)
        {
            if(index == photoCount)
            {
                break;
            }
            else
            {
                UIImageView *imageView = [[TouchImageView alloc] initWithFrame:
                                          CGRectMake(x, y, PHOTO_WIDTH, PHOTO_HEIGHT)];
                imageView.contentMode = UIViewContentModeScaleAspectFit;
                [cell addSubview:imageView];
                imageView.tag = TAG_PHOTO;
                [imageView release];
                
                
                
            }
            index = index + 1;
            x = x + PHOTO_WIDTH + PHOTO_X_DISTANCE;
        }
    }
    
    index = startIndex;
    
    for(UIView *tempView in cell.subviews)
    {
       
        if(tempView.tag == TAG_PHOTO)
        {
            UIImageView *imageView = (UIImageView*)tempView;
            [self setCellImageAtIndex:index imageView:imageView];
            index++;
            if(index == photoCount)
            {
                break;
            }
        }
        
    }
    
       
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

#pragma mark - ImageDownloaderDelegate

// called by our ImageDownloader when an icon is ready to be displayed
- (void)imageDidLoad:(int)imageIndex
{
    NSNumber *indexNumber = [NSNumber numberWithInt:imageIndex];
    ImageDownloader *imageDownloader = [imageDownloadsInProgress objectForKey:indexNumber];
    if (imageDownloader != nil)
    {
        NSLog(@"imageDidLoad %d", imageIndex);
        int row = imageIndex/PHOTO_COUNT_OF_ONE_CELL;
        int indexInCell = imageIndex%PHOTO_COUNT_OF_ONE_CELL;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        int i = 0;
        for(UIView *tempView in cell.subviews)
        {
            if(tempView.tag == TAG_PHOTO)
            {
                if(indexInCell == i)
                {
                    UIImageView *imageView = (UIImageView*)tempView;
                    imageView.image = imageDownloader.record.image;
                    break;
                }
                i++;
            }
        }
    }
}

#pragma mark - Deferred image loading (UIScrollViewDelegate)

// Load images for all onscreen rows when scrolling is finished
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
	{
        [self loadImagesForOnscreenRows];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesForOnscreenRows];
}


@end
