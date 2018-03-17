//
//  AppDelegate.h
//  CoreDataInObjC
//
//  Created by Hemanth on 17/03/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

