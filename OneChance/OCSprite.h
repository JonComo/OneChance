//
//  OCSprite.h
//  OneChance
//
//  Created by Jon Como on 3/11/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface OCSprite : SKSpriteNode

@property BOOL isDead;

-(void)update:(NSTimeInterval)currentTime;
-(void)remove;

@end