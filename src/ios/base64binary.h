
#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>

@interface DecodeUtil : CDVPlugin <UIDocumentInteractionControllerDelegate>
{
    NSString *localFile;
}

- (void) decodeUtil:(CDVInvokedUrlCommand*)command;

- (void) cleanupTempFile: (UIDocumentInteractionController *)controller;

@end
