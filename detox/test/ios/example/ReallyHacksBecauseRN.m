//
//  ReallyHacksBecauseRN.m
//  example
//
//  Created by Leo Natan (Wix) on 3/28/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

@import Foundation;
@import ObjectiveC;

@interface ReallyHacksBecauseRN : NSObject @end

@implementation ReallyHacksBecauseRN

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		Class cls = NSClassFromString(@"RCTLinkingManager");
		Method m = class_getInstanceMethod(cls, NSSelectorFromString(@"startObserving"));
		void (*orig)(id, SEL) = (void*)method_getImplementation(m);
		method_setImplementation(m, imp_implementationWithBlock(^ (id _self) {
			orig(_self, NSSelectorFromString(@"startObserving"));
			
			[[NSNotificationCenter defaultCenter] postNotificationName:@"itFinallyRegistered" object:nil];
		}));
	});
}


@end
