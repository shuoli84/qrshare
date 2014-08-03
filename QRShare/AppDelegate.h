//
//  AppDelegate.h
//  QRShare
//
//  Created by Li Shuo on 14-8-2.
//  Copyright (c) 2014年 Li Shuo. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSTextField *contentTextField;

@property (weak) IBOutlet NSImageView *qrImageView;

@property (assign) IBOutlet NSWindow *window;

@end
