//
//  AppDelegate.h
//  Twitter & Facebook
//
//  Created by Rui Aureliano on 7/21/12.
//  Copyright (c) 2012 Rui Aureliano. All rights reserved.
//

#define __IOS_VERSION [[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
@private
    UIWindow *window;
    UIViewController *controller;
}

@end