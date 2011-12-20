//
//  iosTableEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/5/22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "iosTableEx.h"


@implementation iosTableEx


+(void)setHeight:(UITableView*)tableView
{
    tableView.rowHeight = 10;
    tableView.sectionHeaderHeight = 10;
    tableView.sectionFooterHeight = 10;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CELL";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    return cell;
}


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
