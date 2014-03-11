//
//  OCViewController.m
//  OneChance
//
//  Created by Jon Como on 3/11/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "OCViewController.h"
#import "OCGameScene.h"

@implementation OCViewController
{
    OCGameScene *gameScene;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    gameScene = [OCGameScene sceneWithSize:CGSizeMake(skView.frame.size.height, skView.frame.size.width)];
    gameScene.scaleMode = SKSceneScaleModeAspectFit;
    
    // Present the scene.
    [skView presentScene:gameScene];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
