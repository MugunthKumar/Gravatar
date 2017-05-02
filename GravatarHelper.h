//
//  GravatarHelper.h
//  Gravatar
//
//  Created by Mugunth Kumar on 11-Sep-10.
//  Copyright 2010 Steinlogic. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GravatarHelper : NSObject {

}

+ (nullable NSURL*) getGravatarURL:(nonnull NSString*) emailAddress;

@end
