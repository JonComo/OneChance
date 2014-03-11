//
//  OCGameScene.m
//  OneChance
//
//  Created by Jon Como on 3/11/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "OCGameScene.h"

#import "OCCharacter.h"

#import "JCControlPad.h"

@interface OCGameScene () <JCControlPadDelegate>

@end

@implementation OCGameScene
{
    NSMutableArray *objects;
    
    OCCharacter *player;
    
    JCControlPad *padBlock;
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        objects = [NSMutableArray array];
        _world = [[SKSpriteNode alloc] init];
        [self addChild:_world];
        
        OCSprite *ground = [[OCSprite alloc] initWithColor:[UIColor blackColor] size:CGSizeMake(size.width, 60)];
        ground.position = CGPointMake(ground.size.width/2, ground.size.height/2);
        [_world addChild:ground];
        
        ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
        ground.physicsBody.dynamic = NO;
        
        player = [[OCCharacter alloc] initWithSize:CGSizeMake(34, 70) texturePrefix:@"knight"];
        player.position = CGPointMake(100, 100);
        [objects addObject:player];
        [_world addChild:player];
        
        [player initPhysics];
        player.runDirection = OCDirectionRight;
        
        
        OCCharacter *enemy = [[OCCharacter alloc] initWithSize:CGSizeMake(34, 70) texturePrefix:@"knight"];
        enemy.position = CGPointMake(400, 100);
        [_world addChild:enemy];
        [objects addObject:enemy];
        
        [enemy initPhysics];
        
        
        padBlock = [[JCControlPad alloc] initWithTouchRegion:CGRectMake(60, 60, 100, 100) delegate:self];
        padBlock.color = [UIColor orangeColor];
        [self addChild:padBlock];
    }
    
    return self;
}

-(void)update:(NSTimeInterval)currentTime
{
    [padBlock update:currentTime];
    
    NSMutableArray *dead = [NSMutableArray array];
    for (OCSprite *sprite in objects){
        if (sprite.isDead) [dead addObject:sprite];
        [sprite update:currentTime];
    }
    
    for (OCSprite *sprite in dead){
        [objects removeObject:sprite];
        [sprite remove];
    }
}

-(void)didSimulatePhysics
{
    CGPoint offset = CGPointMake(-player.position.x + self.size.width/2, -player.position.y + self.size.height/2);
    
    for (OCSprite *sprite in self.world.children){
        sprite.position = CGPointMake(sprite.position.x + offset.x, sprite.position.y + offset.y);
    }
}

-(void)controlPad:(JCControlPad *)pad beganTouch:(UITouch *)touch
{
    [player.physicsBody applyImpulse:CGVectorMake(-10, 0)];
}

@end
