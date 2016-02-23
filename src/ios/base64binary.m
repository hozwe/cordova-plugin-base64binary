//
//  ExternalFile.m
//  FileCreate
//
//  Created by Josue Bustos on 12/2/13.
//
//


#import "OpenWith.h"
#import <Cordova/CDV.h>
#import "NSData+Base64.h"

@implementation OpenWith


- (void) openWith:(CDVInvokedUrlCommand*)command;
    {
        
        
        CDVPluginResult* pluginResult = nil;
    
        // first js arg
        NSString *base64string = [command.arguments objectAtIndex:0];
        [base64string retain];
        
        // second js arg
        NSString *newFileName = [command.arguments objectAtIndex:1];
        [newFileName retain];
        NSLog(@"%@", newFileName);
        
        // third js arg
        NSString *uti = [command.arguments objectAtIndex:2];
        [uti retain];
        NSLog(@"%@", uti);
        
    
      
            
        //  decode object base64 string from path js argument
        NSData *fileOnDevice = [NSData dataFromBase64String:base64string];
        NSLog(@"%@", fileOnDevice);
            
        // point to Documents directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSLog(@"%@", paths);
            
        localFile = [documentsDirectory stringByAppendingPathComponent:newFileName ];
        [localFile retain];
            
        [fileOnDevice writeToFile:localFile atomically:YES];
        NSLog(@" file was saved at:::::%@", localFile);
        
        
        
            
        if (localFile != nil && [localFile length] > 1) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
        } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"error"];
        }
    
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

        
        
        
        // Get file again from Documents directory
        NSURL *fileURL = [NSURL fileURLWithPath:localFile];
        UIDocumentInteractionController *controller = [UIDocumentInteractionController  interactionControllerWithURL:fileURL];
        //NSLog(@"%@",fileURL);
        controller.delegate = self;
        controller.UTI = uti;
        [controller retain];

        
        
        CDVViewController* cont = (CDVViewController*)[ super viewController ];
        CGRect rect = CGRectMake(0, 0, 1500.0f, 50.0f);
        [controller presentOpenInMenuFromRect:rect inView:cont.view animated:YES];

       

        
}
    
- (void) documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller {
        NSLog(@"documentInteractionControllerDidDismissOpenInMenu");
    
        
    [self cleanupTempFile:controller];
}
    
- (void) documentInteractionController: (UIDocumentInteractionController *) controller didEndSendingToApplication: (NSString *) application {
        NSLog(@"didEndSendingToApplication: %@", application);
        
    [self cleanupTempFile:controller];
}
    
- (void) cleanupTempFile: (UIDocumentInteractionController *) controller
    {
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error;
        BOOL fileExists = [fileManager fileExistsAtPath:localFile];
        
        //NSLog(@"Path to file: %@", localFile);
        //NSLog(@"File exists: %d", fileExists);
        //NSLog(@"Is deletable file at path: %d", [fileManager isDeletableFileAtPath:localFile]);
        
        if (fileExists) 
        {
            BOOL success = [fileManager removeItemAtPath:localFile error:&error];
            if (!success) NSLog(@"Error: %@", [error localizedDescription]);
        }
        [localFile release];
        [controller release];
}


@end
