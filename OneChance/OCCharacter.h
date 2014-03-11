//
//  OCCharacter.h
//  OneChance
//
//  Created by Jon Como on 3/11/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "OCSprite.h"

typedef enum
{
    OCDirectionNone,
    OCDirectionRight,
    OCDirectionLeft
} OCDirection;

@interface OCCharacter : OCSprite

@property (nonatomic, copy) NSString *texturePrefix;

@property OCDirection runDirection;
@property OCDirection facing;

-(id)initWithSize:(CGSize)size texturePrefix:(NSString *)texturePrefix;
-(void)initPhysics;

-(void)remove;

@end