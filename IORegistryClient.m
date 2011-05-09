//
//  IORegistryClient.m
//  DeeploveProgram
//
//  Created by deeplove on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IORegistryClient.h"


int findClassesInIoregistry(io_iterator_t*  iterator, char *match_name)
{
    CFDictionaryRef classToMatch;
    kern_return_t kernResult; 
    classToMatch = IOServiceMatching(match_name);
    if (classToMatch == NULL)
    {
        return -1;
    }
    // use class name to match
    kernResult = IOServiceGetMatchingServices(kIOMasterPortDefault,    
                                              classToMatch, iterator);
    if (kernResult != KERN_SUCCESS) 
    {
        
        return -1;
    }
    
    return kIOReturnSuccess;
}


@implementation IORegistryClient



// findEthernetInterface
-(void)findEthernetInterface
{
    io_iterator_t ethernetInterfaceIterator;
    result = findClassesInIoregistry(& ethernetInterfaceIterator, kIOEthernetInterfaceIterator);
    if(result == kIOReturnSuccess)
    {
        io_service_t ethernetInterface;
        while(ethernetInterface = IOIteratorNext(ethernetInterfaceIterator))
        {
            NSString *bsdName =
            (NSString*)IORegistryEntrySearchCFProperty(ethernetInterface,
                                                       kIOServicePlane, 
                                                       CFSTR("BSD Name"), 
                                                       kCFAllocatorDefault,
                                                       kIORegistryIterateRecursively);
            
            
            io_service_t ethernetController;
            result = IORegistryEntryGetParentEntry(ethernetInterface, 
                                                   kIOServicePlane, 
                                                   &ethernetController);
            if(result == kIOReturnSuccess)
            {
                
                IOObjectRelease(ethernetController);
            }
            
            
            
            IOObjectRelease(ethernetInterface);
            
        }
        IOObjectRelease(ethernetInterfaceIterator);
    }
}

@end
