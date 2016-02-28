/*
 The MIT License (MIT)
 Copyright (c) 2016 Josue Bustos
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
 documentation files (the "Software"), to deal in the Software without restriction, including without
 limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 Software, and to permit persons to whom the Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions
 of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 DEALINGS IN THE SOFTWARE.
 */

#import "base64binary.h"
#import <Cordova/CDV.h>
#import "NSData+Base64.h"

@implementation base64binary


- (void) decodeUtil:(CDVInvokedUrlCommand*)command;
{
    
    
    CDVPluginResult* pluginResult = nil;
    
    NSString *base64string = [command.arguments objectAtIndex:0];
    NSString *newFileName = [command.arguments objectAtIndex:1];
    NSString *uti = [command.arguments objectAtIndex:2];


    NSData *fileOnDevice = [NSData dataFromBase64String:base64string];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
   

    localFile = [documentsDirectory stringByAppendingPathComponent:newFileName ];
    
    [fileOnDevice writeToFile:localFile atomically:YES];
    
    
    if (localFile != nil && [localFile length] > 1) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"error"];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
    
    NSURL *fileURL = [NSURL fileURLWithPath:localFile];
    UIDocumentInteractionController *controller = [UIDocumentInteractionController  interactionControllerWithURL:fileURL];
    controller.delegate = self;
    
    CDVViewController* cont = (CDVViewController*)[ super viewController ];
    CGRect rect = CGRectMake(0, 0, 1500.0f, 50.0f);
    [controller presentOpenInMenuFromRect:rect inView:cont.view animated:YES];
    
}

- (void) documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller {
    
    [self cleanupTempFile:controller];
}

- (void) documentInteractionController: (UIDocumentInteractionController *) controller didEndSendingToApplication: (NSString *) application {
    
    [self cleanupTempFile:controller];
}

- (void) cleanupTempFile: (UIDocumentInteractionController *) controller
{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL fileExists = [fileManager fileExistsAtPath:localFile];
    
    if (fileExists)
    {
        BOOL success = [fileManager removeItemAtPath:localFile error:&error];
        if (!success) NSLog(@"Error: %@", [error localizedDescription]);
    }
}

@end
