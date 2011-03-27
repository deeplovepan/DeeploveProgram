//
//  CoreDataEx.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CoreDataEx : NSObject {
    
}

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// insert one row
-(void)createNewPerson;
// read from table
-(void)getAllPersons;

@end
