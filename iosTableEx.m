//
//  iosTableEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/5/22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "iosTableEx.h"


@implementation iosTableEx

// UITableViewController
// (1) self.view = self.tableView

// delete cell
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleDelete;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [companyArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
// delete cell end


-(void)removeCellSelectStyle
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

}

// disable table selection
-(void)disableTableSelection
{
    tableView.allowsSelection = NO;
}

#pragma mark - Table view delegate
// set cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
