//
//  GravatarViewController.m
//  Gravatar
//
//  Created by Mugunth Kumar on 11-Sep-10.
//  Copyright 2010 Steinlogic. All rights reserved.
//

#import "GravatarViewController.h"

@implementation GravatarViewController
@synthesize emailTextField;
@synthesize spinner;
@synthesize gravatarImageView;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
	[emailTextField resignFirstResponder];
	NSURL *gravatarURL = [GravatarHelper getGravatarURL:emailTextField.text];
	[spinner startAnimating];
	[NSThread detachNewThreadSelector:@selector(startGettingGravatarURL:) toTarget:self withObject:gravatarURL];
	return YES;
}

-(void) startGettingGravatarURL:(NSURL*) gravatarURL
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];	
	NSError *error;
	NSData* data = [[NSData alloc] initWithContentsOfURL:gravatarURL
												 options:NSDataReadingUncached error:&error];
	[data autorelease];
	if(data)
		[self performSelectorOnMainThread:@selector(fetchSucceeded:) withObject:data waitUntilDone:NO];
	else
		[self performSelectorOnMainThread:@selector(fetchFailed) withObject:nil waitUntilDone:NO];
	[pool release];
	
}

-(void) fetchSucceeded:(NSData*) imageData
{
	UIImage *image = [[UIImage alloc] initWithData:imageData];
	gravatarImageView.image = image;
	[image release];
	[spinner stopAnimating];
}

-(void) fetchFailed
{
	[spinner stopAnimating];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
