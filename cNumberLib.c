//
//  cNumberLib.c
//  DeeploveProgram
//
//  Created by deeplove on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#include "cNumberLib.h"

char isNumberInt(float num)
{
    if(num == (int)num)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}