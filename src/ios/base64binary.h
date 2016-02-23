//
//  ExternalFile.h
//  FileCreate
//
//  Created by Josue Bustos on 12/2/13.
//
//

#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>

@interface OpenWith : CDVPlugin <UIDocumentInteractionControllerDelegate>
{
    NSString *localFile;


}

- (void) openWith:(CDVInvokedUrlCommand*)command;

- (void) cleanupTempFile: (UIDocumentInteractionController *)controller;

@end
