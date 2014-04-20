//
//  CoreDataSetupViewController.h
//  MultipleChoice
//
//  Created by JJ Garzella on 4/19/14.
//  Copyright (c) 2014 JJ Garzella. All rights reserved.
//
//
// This is a helper class that was created for an app that runs using core data and UIDocument
//  using the UIManagedDocument class. The problem with it is that it

#import <UIKit/UIKit.h>

@interface CoreDataSetupViewController : UIViewController

@property (nonatomic, strong) UIManagedDocument *database;

- (void)setup; // This is called after it is safe to use

@end
