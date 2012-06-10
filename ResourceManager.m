//
//  ResourceManager.m
//  Jumperv2
//
//  Created by Tomek Janik on 17.02.2012.
//  Copyright 2012 YOSOFTWARE. All rights reserved.
//

#import "ResourceManager.h"
#import "cocos2d.h"

static ResourceManager *instance;

@implementation ResourceManager

@synthesize winsize;

+ (void)initialize {
	static BOOL initialized = false;
	if(!initialized){
		initialized = true;
		resManager = [[ResourceManager alloc] init];
	}	
}

+ (ResourceManager *) instance{
	if(!instance){
		instance = [[ResourceManager alloc] init];
	}
	return instance;
}

- (ResourceManager *) init{
	if(self = [super init]){
	//	textures = [[NSMutableDictionary dictionary] retain];
		sounds	 = [NSMutableDictionary dictionary];
		winsize = [[CCDirector sharedDirector] winSize];
	}
	return self;
}


- (CCTexture2D *)getTexture:(NSString *)filename {
	//CCTexture2D * texture = [textures valueForKey:filename];
	
	CCTexture2D *texture = [[CCTextureCache sharedTextureCache] textureForKey:filename];
	
	if(texture != nil) return texture;
	//texture = [[CCTexture2D alloc] initWithImage:[UIImage imageNamed:filename]];
		[[CCTextureCache sharedTextureCache] addImage:filename];
		texture = [[CCTextureCache sharedTextureCache] textureForKey:filename];
	//[textures setValue:[texture autorelease] forKey:filename];
	return texture;
}

- (void) saveUserDataObject:(id) data toFile:(NSString*)filename{
	[[NSUserDefaults standardUserDefaults] setObject:data forKey:filename];
}

- (void) saveUserDataFloat:(float) data toFile:(NSString*)filename{
	[[NSUserDefaults standardUserDefaults] setFloat:data forKey:filename];
}

- (void) saveUserDataInt:(int) data toFile:(NSString*)filename{
	[[NSUserDefaults standardUserDefaults] setInteger:data forKey:filename];
}

- (id) getUserData:(NSString*) filename {
	return [[NSUserDefaults standardUserDefaults] objectForKey:filename];
}

- (void) purgeTextures{
	//[textures removeAllObjects];
	[[CCTextureCache sharedTextureCache] removeUnusedTextures];
}

- (void) removeAllTextures{
	//[textures removeAllObjects];
	[[CCTextureCache sharedTextureCache] removeAllTextures];
}

- (void) purgeSounds{
	[sounds removeAllObjects];
}

@end
