//
//  AppDelegate.m
//  EventBase
//
//  Created by Nik Macintosh on 1/14/2014.
//  Copyright (c) EventBase Technology Inc. All rights reserved.
//

#import "AppDelegate.h"

#import "FilmCategoriesVC.h"
#import "SqliteDB.h"

@implementation AppDelegate

#pragma mark - AppDelegate

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    
    return _window;
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SqliteDB openDatabase];
    
    FilmCategoriesVC *catVC = [[FilmCategoriesVC alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:catVC];
    [self.window setRootViewController:nc];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)applicationWillTerminate {
    [SqliteDB closeDatabase];
    
    return YES;
}

@end
