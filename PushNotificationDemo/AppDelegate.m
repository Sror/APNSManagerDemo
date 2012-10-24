//
//  AppDelegate.m
//  PushNotificationDemo
//
//  Created by Eddie Espinal on 10/24/12.
//  Copyright (c) 2012 EspinalLab.com. All rights reserved.
//

#import "AppDelegate.h"
#import "APPconnect.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    [application registerForRemoteNotificationTypes: UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];

    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    
    NSLog(@"Did register for remote notifications: %@", deviceToken);
    
    //you will find these values when you create an app from your apnsmanager website
    NSString *apiKey = @"YOUR_API_KEY";
    NSString *sharedSecret = @"YOUR_SHARED_SECRET";
    NSString *url = @"http://yourwebsite.com/apnsmanager/";
    
    APPconnect *service = [[APPconnect alloc] initWithUrl:url api:apiKey andSharedsecret:sharedSecret];
    [service registerDevice:[deviceToken description] withCustomInfo:@"Your App Name" error:nil];
    
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Fail to register for remote notifications: %@", error);
    
    //If you are app fails to register, please make sure that you are not using a wildchar domain such as "com.yourdomain.*"
    //You need to have a provisioning profile that has been enabled for push notifications.
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
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

@end
