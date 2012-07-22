//
//  AppDelegate.m
//  Twitter & Facebook
//
//  Created by Rui Aureliano on 7/21/12.
//  Copyright (c) 2012 Rui Aureliano. All rights reserved.
//


#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window makeKeyAndVisible];
    
    controller = [[UIViewController alloc] init];
    [[controller view] setBackgroundColor:[UIColor viewFlipsideBackgroundColor]];
    [window setRootViewController:controller];
    
    UIButton *twitter = [UIButton buttonWithType:UIButtonTypeCustom];
    [twitter setFrame:CGRectMake(50, 10, [window frame].size.width - 100, 45)];
    [twitter setTitle:@"Twitter" forState:UIControlStateNormal];
    [twitter addTarget:self action:@selector(twitterPress) forControlEvents:UIControlEventTouchUpInside];
    
    [twitter setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [twitter setTitleShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f] forState:UIControlStateNormal];
    
    [twitter setTitleColor:[UIColor colorWithRed:0.61f green:0.61f blue:0.61f alpha:1.00f] forState:UIControlStateDisabled];
    [twitter setTitleShadowColor:[UIColor clearColor] forState:UIControlStateDisabled];
    
    [[twitter titleLabel] setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [[twitter titleLabel] setShadowOffset:CGSizeMake(0.0f, -1.0f)];
    [twitter setBackgroundImage:[[UIImage imageNamed:@"twitter_n"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateNormal];
    [twitter setBackgroundImage:[[UIImage imageNamed:@"twitter_h"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateHighlighted];
    [twitter setBackgroundImage:[[UIImage imageNamed:@"twitter_d"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateDisabled];
    [twitter setEnabled:(__IOS_VERSION >= 5)];
    [[controller view] addSubview:twitter];
    
    UIButton *facebook = [UIButton buttonWithType:UIButtonTypeCustom];
    [facebook setFrame:CGRectMake(50, 80, [window frame].size.width - 100, 45)];
    [facebook setTitle:@"Facebook" forState:UIControlStateNormal];
    [facebook addTarget:self action:@selector(facebookPress) forControlEvents:UIControlEventTouchUpInside];
    
    [facebook setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [facebook setTitleShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f] forState:UIControlStateNormal];
    
    [facebook setTitleColor:[UIColor colorWithRed:0.61f green:0.61f blue:0.61f alpha:1.00f] forState:UIControlStateDisabled];
    [facebook setTitleShadowColor:[UIColor clearColor] forState:UIControlStateDisabled];
    
    [[facebook titleLabel] setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [[facebook titleLabel] setShadowOffset:CGSizeMake(0.0f, -1.0f)];
    [facebook setBackgroundImage:[[UIImage imageNamed:@"facebook_n"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateNormal];
    [facebook setBackgroundImage:[[UIImage imageNamed:@"facebook_h"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateHighlighted];
    [facebook setBackgroundImage:[[UIImage imageNamed:@"facebook_d"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateDisabled];
    [facebook setEnabled:(__IOS_VERSION >= 6)];
    [[controller view] addSubview:facebook];
    
    return YES;
}

- (void) twitterPress {
    if(NSClassFromString(@"SLComposeViewController") != nil) {
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
    } else if(NSClassFromString(@"TWTweetComposeViewController") != nil) {
        TWTweetComposeViewController *twitterController = [[TWTweetComposeViewController alloc] init];
        [twitterController addImage:[UIImage imageNamed:@"sip.png"]];
        [twitterController setInitialText:@"The refreshingly simple app that instantly samples & encodes any color on your screen."];
        [twitterController addURL:[NSURL URLWithString:@"http://theolabrothers.com/sip"]];
        
        [controller presentViewController:twitterController animated:YES completion:nil];
        twitterController.completionHandler = ^(TWTweetComposeViewControllerResult res) {
            [controller dismissModalViewControllerAnimated:YES];
        };
    }
}

- (void) facebookPress {
    if(NSClassFromString(@"SLComposeViewController") != nil) {
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
}

@end