/* add your code here */

#include <IOKit/IOService.h>

class com_peter_driver_MyDriver : public IOService
{
	OSDeclareDefaultStructors(com_peter_driver_MyDriver)
public:
    virtual bool init(OSDictionary *dictionary = 0);
    virtual void free(void);
    virtual IOService *probe(IOService *provider, SInt32 *score);
    virtual bool start(IOService *provider);
    virtual void stop(IOService *provider);
};