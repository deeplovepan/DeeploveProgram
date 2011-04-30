check if string match regular expression
use test function

ex:
var dnsRegEx = /(?=^.{1,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)/;
var dns = "apple.com";
// return true if match
if( dnsRegEx.test(dns) )
{
    
    
}
