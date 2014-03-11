//
//  OCCharacter.m
//  OneChance
//
//  Created by Jon Como on 3/11/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "OCCharacter.h"

#import "OCGameScene.h"

@implementation OCCharacter
{
    SKSpriteNode *wheel;
    SKPhysicsJointPin *wheelJoint;
}

-(id)initWithSize:(CGSize)size texturePrefix:(NSString *)texturePrefix
{
    if (self = [super initWithColor:nil size:size]) {
        //init
        self.color = [UIColor orangeColor];
        
        _facing = OCDirectionRight;
        
        //Load textures based on prefix for legs and body and head etc.
        
    }
    
    return self;
}

-(void)initPhysics
{
    OCGameScene *scene = (OCGameScene *)self.scene;
    
    //Create physics sprites
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.size.width, self.size.height * 3/4)];
    self.physicsBody.allowsRotation = NO;
    
    wheel = [[SKSpriteNode alloc] initWithColor:[UIColor redColor] size:CGSizeMake(self.size.width, self.size.width)];
    wheel.position = CGPointMake(self.position.x, self.position.y - self.size.height + wheel.size.height);
    wheel.alpha = 0.4;
    
    [scene.world addChild:wheel];
    wheel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width*0.6];
    
    wheelJoint = [SKPhysicsJointPin jointWithBodyA:self.physicsBody bodyB:wheel.physicsBody anchor:CGPointMake(wheel.position.x, wheel.position.y)];
    [self.scene.physicsWorld addJoint:wheelJoint];
}

-(void)update:(NSTimeInterval)currentTime
{
    if (self.position.y < 0) self.isDead = YES;
    
    if (self.runDirection == OCDirectionRight){
        [self.physicsBody applyImpulse:CGVectorMake(0.1, 0)];
    }else if(self.runDirection == OCDirectionLeft){
        [self.physicsBody applyImpulse:CGVectorMake(-0.1, 0)];
    }else{
        //Standing
        wheel.physicsBody.angularVelocity = 0;
    }
    
    [self lookForward];
}

-(void)lookForward
{
    float offset = 0;
    
    if (self.facing == OCDirectionRight){
        offset = 100;
    }else if(self.facing == OCDirectionLeft){
        offset = -100;
    }
    
    SKPhysicsBody *physicsBody = [self.scene.physicsWorld bodyAlongRayStart:self.position end:CGPointMake(self.position.x + offset, self.position.y)];

    if (physicsBody){
        self.runDirection = OCDirectionNone;
    }
}

-(void)remove
{
    [self.scene.physicsWorld removeJoint:wheelJoint];
    [wheel removeFromParent];
    
    [self removeFromParent];
}

@end