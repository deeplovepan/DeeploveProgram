//
//  CoreDataEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//


/*
    1. define core data modal xcdatamodeld
 
    2. create NSManagementedObject file from xcdatamodeld
 
 
*/

#import "CoreDataEx.h"
#import "Person.h"

/* core data type
 
    Decimal, Double, and Float data types are for storing fractional numbers. The Double data type uses 64 bits to store a value while the 
    Float data type uses 32 bits for storing a value. The only limitation with these two data types is that they round off the values. To avoid 
    any rounding of values, the Decimal data type is preferred. The Decimal type uses fixed point numbers for storing values, so the numerical 
    value stored in it is not rounded off.
*/

@implementation CoreDataEx


@synthesize managedObjectContext=__managedObjectContext;

@synthesize managedObjectModel=__managedObjectModel;

@synthesize persistentStoreCoordinator=__persistentStoreCoordinator;

// sort 

-(void)sortArray
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // sort 
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"birthday" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    NSError *error = nil;
    NSArray *array = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}


// insert one row
-(void)createNewPerson
{
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    if(person != nil)
    {
        person.age = [NSNumber numberWithInt:1];
        person.name = @"peter";
        
        NSError *saveError = nil;
        if([self.managedObjectContext save:&saveError] == YES)
        {
            NSLog(@"save new rocord successfully");
        }
    }
}



// read from table
-(void)getAllPersons
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *personArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for(Person *person in personArray)
    {
        NSLog(@"name %@", person.name);
    }

}

// delete 
-(void)delObject:(id)delObj
{
    [managedObjectContext deleteObject:delObj];
    
    // Save the context.
    NSError *error = nil;
    if (![managedObjectContext save:&error])
    {

    }
}



@end
