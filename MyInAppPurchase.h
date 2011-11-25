//
//  MyInAppPurchase.h
//  MyLib
//
//  Created by deeplove on 2010/8/21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>  

@class MyProduct;

@interface MyInAppPurchase : NSObject <SKProductsRequestDelegate, SKPaymentTransactionObserver> {
	SKProductsRequest *productRequest;
	NSMutableArray *productArray, *productIdArray;
	NSMutableArray *validProductIdArray;
    BOOL isFirstGetProductsDone;
    BOOL isGetProductInfo;
}
@property (nonatomic, retain) NSMutableArray *productArray;
@property (nonatomic, retain) NSMutableArray *productIdArray;
@property (nonatomic, assign) NSMutableArray *validProductIdArray;
@property (nonatomic, assign) BOOL isFirstGetProductsDone;

-(void)getProductsInfo;
-(void)getProductInfo:(NSString*)productId;
-(void)buy:(NSString*)productId;
-(MyProduct*)findProductFromId:(NSString*)productId;


@end
