//
//  AppDelegate.m
//  Twitter & Facebook
//
//  Created by Rui Aureliano on 7/21/12.
//  Copyright (c) 2012 Rui Aureliano. All rights reserved.
//

#import <Social/Social.h>
#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window makeKeyAndVisible];
    
    controller = [[UIViewController alloc] init];
    [window setRootViewController:controller];
    
    UIButton *twitter = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [twitter setFrame:CGRectMake(50, 10, [window frame].size.width - 100, 50)];
    [twitter setTitle:@"Twitter" forState:UIControlStateNormal];
    [twitter addTarget:self action:@selector(twitterPress) forControlEvents:UIControlEventTouchUpInside];
    [[controller view] addSubview:twitter];
    
    UIButton *facebook = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [facebook setFrame:CGRectMake(50, 80, [window frame].size.width - 100, 50)];
    [facebook setTitle:@"Facebook" forState:UIControlStateNormal];
    [facebook addTarget:self action:@selector(facebookPress) forControlEvents:UIControlEventTouchUpInside];
    [[controller view] addSubview:facebook];
    
    return YES;
}

- (void) twitterPress {
    SLComposeViewController *twitterController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewControllerCompletionHandler __block completionHandler = ^(SLComposeViewControllerResult result) {
            [twitterController dismissViewControllerAnimated:YES completion:nil];
            switch(result) {
                case SLComposeViewControllerResultDone: {
                    NSLog(@"Posted....");
                }
                    break;
                default:{
                    NSLog(@"Cancelled.....");
                }
                    break;
            }
        };
        
        [twitterController addImage:[UIImage imageNamed:@"sip.png"]];
        [twitterController setInitialText:@"The refreshingly simple app that instantly samples & encodes any color on your screen."];
        [twitterController addURL:[NSURL URLWithString:@"http://theolabrothers.com/sip"]];
        [twitterController setCompletionHandler:completionHandler];
        [controller presentViewController:twitterController animated:YES completion:nil];
    }
}

- (void) facebookPress {
    SLComposeViewController *facebookController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewControllerCompletionHandler __block completionHandler = ^(SLComposeViewControllerResult result) {
            [facebookController dismissViewControllerAnimated:YES completion:nil];
            switch(result) {
                case SLComposeViewControllerResultDone: {
                    NSLog(@"Posted....");
                }
                    break;
                default:{
                    NSLog(@"Cancelled.....");
                }
                    break;
            }
        };
        
        [facebookController addImage:[UIImage imageNamed:@"sip.png"]];
        [facebookController setInitialText:@"The refreshingly simple app that instantly samples & encodes any color on your screen."];
        [facebookController addURL:[NSURL URLWithString:@"http://theolabrothers.com/sip"]];
        [facebookController setCompletionHandler:completionHandler];
        [controller presentViewController:facebookController animated:YES completion:nil];
    }
}

@end