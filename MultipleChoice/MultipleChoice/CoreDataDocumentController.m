//
//  CoreDataDocumentController.m
//  MultipleChoice
//
//  Created by JJ Garzella on 4/23/14.
//  Copyright (c) 2014 JJ Garzella. All rights reserved.
//

#import "CoreDataDocumentController.h"

@implementation CoreDataDocumentController


- (void)setupDatabaseWithCompletion:(void (^)(UIManagedDocument *database))completion
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.database.fileURL path]]) { // If it is not created
        
        [self.database saveToURL:self.database.fileURL
                forSaveOperation:UIDocumentSaveForCreating
               completionHandler:^(BOOL success) {
                   
                   if (success) {
                       completion(self.database);
                   } else {
                       NSLog(@"DOCUMENT FAILED TO CREATE: \n%@", self.database);
                   }
                   
                   
               }];
        
    } else if (self.database.documentState == UIDocumentStateClosed) { // if it is closed
        
        [self.database openWithCompletionHandler:^(BOOL success) {
            
            if (success) {
                completion(self.database);
            } else {
                NSLog(@"DOCUMENT FAILED TO OPEN: \n%@", self.database);
            }
            
        }];
    } else { // if it is open
        completion(self.database);
    }
}

- (void)setupCoreDataWithCompletion:(void (^)(UIManagedDocument *database))completion
                            cleanly:(BOOL)cleanly
{
    NSURL *fileURL = [[NSUserDefaults standardUserDefaults] URLForKey:@"DatabaseFileURL"];
    
    if (!fileURL) {
        // make the URL and store it in NSUserDefaults
        fileURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                          inDomains:NSUserDomainMask] lastObject]; // Docs Directory
        fileURL = [fileURL URLByAppendingPathComponent:@"Database"]; // Append New Path Component
        
        [[NSUserDefaults standardUserDefaults] setURL:fileURL forKey:@"DatabaseFileURL"];
    }
    
    
    if (cleanly) {
        // forces the next method to set up a new database
        [[NSFileManager defaultManager] removeItemAtPath:fileURL.path
                                            error:NULL];

    }
    
    self.database = [[UIManagedDocument alloc] initWithFileURL:fileURL];
    
    [self setupDatabaseWithCompletion:completion];
}

@end
