//
//  GravatarViewController.h
//  Gravatar
//
//  Created by Mugunth Kumar on 11-Sep-10.
//  Copyright 2010 Steinlogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GravatarHelper.h"

@interface GravatarViewController : UIViewController<UITextFieldDelegate> {

	UITextField *emailTextField;
	UIImageView *gravatarImageView;
	UIActivityIndicatorView *spinner;
}

@property (nonatomic, retain) IBOutlet UITextField *emailTextField;
@property (nonatomic, retain) IBOutlet UIImageView *gravatarImageView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *spinner;

@end

