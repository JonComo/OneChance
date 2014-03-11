//
//  OCSprite.m
//  OneChance
//
//  Created by Jon Como on 3/11/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "OCSprite.h"

@implementation OCSprite

-(id)initWithColor:(UIColor *)color size:(CGSize)size
{
    if (self = [super initWithColor:color size:size]) {
        //init
        
    }
    
    return self;
}

-(void)update:(NSTimeInterval)currentTime
{
    
}

-(void)remove
{
    [self removeFromParent];
}

@end
