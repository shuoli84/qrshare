//
//  AppDelegate.m
//  QRShare
//
//  Created by Li Shuo on 14-8-2.
//  Copyright (c) 2014年 Li Shuo. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXMultiFormatWriter.h"
#import "ZXBitMatrix.h"
#import "ZXBarcodeFormat.h"
#import "ZXImage.h"
#import "ZXQRCodeWriter.h"
#import "ZXEncodeHints.h"

@interface ContentDelegate:NSObject<NSTextFieldDelegate>
@end

@implementation ContentDelegate

-(void)controlTextDidChange:(NSNotification *)obj{
    NSLog(@"hshshkx");
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}

- (IBAction)generateQCode:(NSTextField *)sender {
    NSString *content = sender.stringValue;

    NSLog(@"Generate qcode for %@", content);

    if(content.length == 0){
        NSLog(@"Empty Conent, skip it");
        return;
    }

    content = [[NSString alloc] initWithFormat:@"\357\273\277%@", content];

    CGSize size = self.qrImageView.frame.size;

    NSError *error = nil;
    ZXQRCodeWriter *writer = [[ZXQRCodeWriter alloc]init];
    ZXEncodeHints *hints = [ZXEncodeHints hints];

    hints.encoding = NSUTF8StringEncoding;

    ZXBitMatrix* result = [writer encode:content
                                  format:kBarcodeFormatQRCode
                                   width:roundtol(size.width)
                                  height:roundtol(size.height)
                                    hints:hints
                                   error:&error];
    if (result) {
        CGImageRef image = [[ZXImage imageWithMatrix:result] cgimage];

        // This CGImageRef image can be placed in a UIImage, NSImage, or written to a file.
        self.qrImageView.image = [[NSImage alloc] initWithCGImage:image size:size];
    } else {
        NSString *errorMessage = [error localizedDescription];
    }
}

@end
