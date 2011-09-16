//
//  EDSidebarAppDelegate.h
//  EDSidebar
//
//
//  Created by erndev 
//  BSD license. 
//

#import <Cocoa/Cocoa.h>
#import "EDSideBar.h"

@interface EDSidebarAppDelegate : NSObject <NSApplicationDelegate,EDSideBarDelegate> {
    NSWindow *window;
	IBOutlet EDSideBar *sideBarDefault, *sideBarBlack;
	IBOutlet NSTextField *textField;
}

@property (assign) IBOutlet NSWindow *window;

@end
