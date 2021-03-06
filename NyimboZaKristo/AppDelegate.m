//
//  AppDelegate.m
//  NyimboZaKristo
//
//  Created by Nelson on 9/30/14.
//  Copyright (c) 2014 Nelson. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "NavigationViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) MainViewController *mainViewController;

@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    _window.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:166.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
    
    _mainViewController = [[MainViewController alloc] init];
    
    _navigationController = [[NavigationViewController alloc]
                             initWithRootViewController:_mainViewController];
    _window.rootViewController = _navigationController;
    
    [self setNavigationBarBg];
    
    [_window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//Called for setting the ui that will be used for top bar in all views
- (void)setNavigationBarBg
{
    
    NSString *postFix = @".png";
    
    
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@", @"action_bar_background", postFix]];
    //create a UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    imageView.frame = CGRectMake(0, 0, _navigationController.navigationBar.bounds.size.width,
                                 _navigationController.navigationBar.bounds.size.height);
    
    if([_navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        //iOS 5 new UINavigationBar custom background
        [_navigationController.navigationBar setBackgroundImage:[img resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30)]forBarMetrics: UIBarMetricsDefault];
    } else {
        for (UIView *subView in _navigationController.navigationBar.subviews)
        {
            [subView removeFromSuperview];
            continue;
        }
        [_navigationController.navigationBar insertSubview:imageView atIndex:0];
    }
    _navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
}

@end
