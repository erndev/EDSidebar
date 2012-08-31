//
//  EDSidebarAppDelegate.m
//  EDSidebar
//
//  Created by erndev 
//  BSD license. 
//

#import "EDSidebarAppDelegate.h"
#import "BlackCell.h"
@implementation EDSidebarAppDelegate

@synthesize window;

-(NSImage*)buildSelectionImage
{
	// Create the selection image on the fly, instead of loading from a file resource. 
	NSInteger imageWidth=12, imageHeight=22;
	NSImage* destImage = [[NSImage alloc] initWithSize:NSMakeSize(imageWidth,imageHeight)];
	[destImage lockFocus];
	
	
	
	// Constructing the path
    NSBezierPath *triangle = [NSBezierPath bezierPath];
	[triangle setLineWidth:1.0];
    [triangle moveToPoint:NSMakePoint(imageWidth+1, 0.0)];
    [triangle lineToPoint:NSMakePoint( 0, imageHeight/2.0)];
    [triangle lineToPoint:NSMakePoint( imageWidth+1, imageHeight)];
    [triangle closePath];
	[[NSColor controlColor] setFill];
	[[NSColor darkGrayColor] setStroke];
	[triangle fill];
	[triangle stroke];
	[destImage unlockFocus];
	return destImage;
}
-(void)awakeFromNib
{

	// Setup sidebar with default cell (EDSideBarCell)
	// Buttons top-aligned. Selection animated
	[sideBarDefault setLayoutMode:ECSideBarLayoutTop];
	sideBarDefault.animateSelection =YES;
	sideBarDefault.sidebarDelegate=self;
	NSImage *selImage =[self buildSelectionImage];
	[sideBarDefault setSelectionImage:selImage];
	[selImage release];
	[sideBarDefault addButtonWithTitle:@"Button 1" image:[NSImage imageNamed:@"icon1-white.png"] alternateImage:[NSImage imageNamed:@"icon1-gray.png"]];
	[sideBarDefault addButtonWithTitle:@"Button 2" image:[NSImage imageNamed:@"icon1-white.png"] alternateImage:[NSImage imageNamed:@"icon1-gray.png"]];
	[sideBarDefault addButtonWithTitle:@"Button 3" image:[NSImage imageNamed:@"icon1-white.png"] alternateImage:[NSImage imageNamed:@"icon1-gray.png"]];
	[sideBarDefault selectButtonAtRow:2];
	// Add a bit of noise texture
    sideBarDefault.noiseAlpha=0.04;
    
    [sideBarDefault setTarget:self withSelector:@selector(logThis:) atIndex:0];
    
	// Setup sidebar with blackCell (BlackCell)
	// Buttons centered. Selection is not animated
	sideBarBlack.backgroundColor = [NSColor blackColor];
	[sideBarBlack setLayoutMode:ECSideBarLayoutCenter];
	sideBarBlack.animateSelection =NO;
	sideBarBlack.sidebarDelegate=self;
	sideBarBlack.cellClass = [BlackCell class];
	[sideBarBlack setSelectionImage:[NSImage imageNamed:@"blue.png"]];
	[sideBarBlack addButtonWithTitle:@"Btn1" image:[NSImage imageNamed:@"icon1-blue.png"] alternateImage:[NSImage imageNamed:@"icon1-gray.png"]];
	[sideBarBlack addButtonWithTitle:@"Btn2" image:[NSImage imageNamed:@"icon1-blue.png"] alternateImage:[NSImage imageNamed:@"icon1-gray.png"]];
	[sideBarBlack addButtonWithTitle:@"Btn3" image:[NSImage imageNamed:@"icon1-blue.png"] alternateImage:[NSImage imageNamed:@"icon1-gray.png"]];
	[sideBarBlack selectButtonAtRow:0];

}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}
-(void)sideBar:(EDSideBar*)tabBar didSelectButton:(NSInteger)button
{
	NSString *str = [NSString stringWithFormat:@"Selected button #%lu in %@",
					 button, [tabBar isEqualTo:sideBarBlack]?@"Right sidebar":@"Left sidebar"];
	NSLog(@"Button selected: %lu", button );
	[textField setStringValue:str];
	
}

- (IBAction)logThis:(id)sender
{
    NSLog(@"here I am");
}

@end
