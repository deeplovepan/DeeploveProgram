//
//  CoreDataEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CoreDataEx.h"
#import "Person.h"

@implementation CoreDataEx


@synthesize managedObjectContext=__managedObjectContext;

@synthesize managedObjectModel=__managedObjectModel;

@synthesize persistentStoreCoordinator=__persistentStoreCoordinator;

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


@end
