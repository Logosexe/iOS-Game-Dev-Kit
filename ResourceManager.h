//
//  ResourceManager.h
//  Jumperv2
//
//  Created by Tomek Janik on 17.02.2012.
//  Copyright 2012 YOSOFTWARE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class ResourceManager;



@interface ResourceManager : CCNode {
//	NSMutableDictionary * textures;
	
	NSMutableDictionary * sounds;
	CGSize winsize;
	
}

@property (nonatomic) CGSize winsize;

+ (ResourceManager *) instance;

- (CCTexture2D *)getTexture:(NSString *)filename;

- (void) saveUserDataObject:(id) data toFile:(NSString*)filename;
- (void) saveUserDataFloat:(float) data toFile:(NSString*)filename;
- (void) saveUserDataInt:(int) data toFile:(NSString*)filename;
- (id) getUserData:(NSString*) filename;

- (void) purgeTextures;
- (void) removeAllTextures;
- (void) purgeSounds;
@end
