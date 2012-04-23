//
//  Debug.h
//  Locomote
//
//  Created by Peter Pan on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef Debug_h
#define Debug_h


#ifdef _NETWORK_DEBUG
#define NETWORK_LOG(...) NSLog(__VA_ARGS__)
#else
#define NETWORK_LOG(...)  
#endif 

#endif
