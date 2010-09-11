//
//  GravatarAppDelegate.h
//  Gravatar
//
//  Created by Mugunth Kumar on 11-Sep-10.
//  Copyright 2010 Steinlogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GravatarViewController;

@interface GravatarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GravatarViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GravatarViewController *viewController;

@end

