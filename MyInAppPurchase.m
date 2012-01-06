//
//  MyInAppPurchase.m
//  MyLib
//
//  Created by deeplove on 2010/8/21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyInAppPurchase.h"
#import "MyProduct.h"
#import "ccMacros.h"
//#import "MyDebug.h"



@implementation MyInAppPurchase

@synthesize productArray;
@synthesize productIdArray;
@synthesize validProductIdArray;
@synthesize isFirstGetProductsDone;

-(id)init
{
	if((self = [super init]))
	{
		validProductIdArray = [[NSMutableArray alloc] init];
		isFirstGetProductsDone = NO;
	}
	return self;
}

-(MyProduct*)findProductFromId:(NSString*)productId
{
	MyProduct *targetProduct = nil;
	
	for(MyProduct *product in validProductIdArray)
	{
		if([product.productIdentifier isEqualToString:productId])
		{
			targetProduct = product;
			break;
		}
	}
	return targetProduct;
}



-(void)buy:(NSString*)productId
{
	
	isGetProductInfo = NO;
	[self getProductInfo:productId];
	

	
	NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:0.1];
	
	while(isGetProductInfo == NO)
	{
		[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode 
								 beforeDate:loopUntil];
		
	}
	

	SKPayment *payment = [SKPayment paymentWithProductIdentifier:productId];
	[[SKPaymentQueue defaultQueue] addPayment:payment];
	
	
}

-(void)getProductInfo:(NSString*)productId
{	
	//MY_NSLOG(@"getProductInfo %@", productId);
	productRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:productId]];  
	
	productRequest.delegate = self;  
	[productRequest start]; 
}


-(void)getProductsInfo
{
	//product identifier list would ideally be loaded from an external server in order
	// to allow you to dynamically add or remove products
	// set product id defined in itunes connect 
	[[SKPaymentQueue defaultQueue] addTransactionObserver:self];
	CCLOG(@"productIdArray %@", productIdArray);
	productRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:
					  [NSSet setWithArray:productIdArray]];  
	
	productRequest.delegate = self;  
	[productRequest start]; 
}

- (void)dealloc {
	[productRequest release];
	[productArray release];
	[validProductIdArray release];
	[super dealloc];
}


#pragma mark -
#pragma mark SKProductsRequestDelegate

// get project detail info
// response.products include products info from Apple Server
-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response  
{  
	CCLOG(@"response.products valid count %d invalid count %d",
		  [response.products count],
		  [response.invalidProductIdentifiers count]);
	
	if ([response.products count] > 1) {
		for(SKProduct *product in response.products) {
			
			//MyProduct *validProduct = [[MyProduct alloc] initWithProduct:product];
			//[validProduct initProduct];
			[validProductIdArray addObject:product.productIdentifier];
			//[validProduct release];
		}
		if(isFirstGetProductsDone == NO)
		{
			isFirstGetProductsDone = YES;
			//[[NSNotificationCenter defaultCenter] postNotificationName:
			// @"firstGetProductsDone" object:nil];

		}
	}
	
	
	isGetProductInfo = YES;
}  

-(void)requestDidFinish:(SKRequest *)request
{  
	
	[request release];  
}  

-(void)request:(SKRequest *)request didFailWithError:(NSError *)error
{  
	CCLOG(@"Failed to connect with error: %@", [error localizedDescription]);
}  

- (void) failedTransaction: (SKPaymentTransaction *)transaction
{
	if (transaction.error.code != SKErrorPaymentCancelled)
	{
		// Optionally, display an error here.
	}
	[[NSNotificationCenter defaultCenter] postNotificationName:
		@"buyVirtualMoneyCancel" object:transaction.payment.productIdentifier];
	
	[[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

-(void)purchaseOk:(SKPaymentTransaction *)transaction
{
	[[NSNotificationCenter defaultCenter] postNotificationName:
	  @"buyVirtualMoneyDone" object:transaction.payment.productIdentifier];
	[[SKPaymentQueue defaultQueue] finishTransaction: transaction];

}

#pragma mark -
#pragma mark SKPaymentTransactionObserver methods

//
// called when the transaction status is updated
//
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
	CCLOG(@"updatedTransactions");
	for (SKPaymentTransaction *transaction in transactions)
	{
		CCLOG(@"state %d %@", transaction.transactionState,
              transaction.payment.productIdentifier);
		switch (transaction.transactionState)
		{
			case SKPaymentTransactionStatePurchased:
				[self purchaseOk:transaction];
				break;
			case SKPaymentTransactionStateFailed:
                NSLog(@"error %@", transaction.error);
				[self failedTransaction:transaction];
				break;
			case SKPaymentTransactionStateRestored:
				[[SKPaymentQueue defaultQueue] finishTransaction: transaction];
				break;
			default:
				break;
		}
	}
}




@end
