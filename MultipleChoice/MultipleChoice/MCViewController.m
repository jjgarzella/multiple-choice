//
//  MCViewController.m
//  MultipleChoice
//
//  Created by JJ Garzella on 3/15/14.
//  Copyright (c) 2014 JJ Garzella. All rights reserved.
//

#import "MCViewController.h"
#import "CoreDataDocumentController.h"

@interface MCViewController ()

@property (nonatomic, strong) CoreDataDocumentController *documentController;

@end

@implementation MCViewController


- (void)setup
{

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.documentController = [[CoreDataDocumentController alloc] init];
    
    [self.documentController setupCoreDataWithCompletion:^(UIManagedDocument *database) {
        [self setup];
    }                                            cleanly:YES];
    
    
}

@end
