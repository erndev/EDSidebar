//
//  BlackCell.m
//  EDSidebar
//
//  Created by erndev 
//  BSD license. 
//

#import "BlackCell.h"

// Other Example cell, black background, no text.

@implementation BlackCell

-(id)init
{

	self = [super init];
	if ( self )
	{
        _shadow = [[NSShadow alloc] init] ;

		[self setHighlightsBy:NSContentsCellMask];
        
	}
	return self;
	
}
#if !__has_feature(objc_arc)
-(void)dealloc
{
    
    [_shadow release];
}
#endif
- (void)drawWithFrame:(NSRect)frame inView:(NSView *)view {
	
	[[NSColor blackColor] setFill];
	NSRectFill(frame);
	NSImage *img = nil;
		   
	// Just a test. Should handle highlight better
	if( [self state] == NSOnState )
	{
		img = [self image];
	}
	else {
		img = [self alternateImage];
	}
	[NSGraphicsContext saveGraphicsState];
	if( [self isHighlighted] )
	{
		img = [self image];
		// simulate outer glow using a shadow
		[_shadow setShadowColor:[NSColor colorWithDeviceRed:115.0/225.0 green:215.0/225.0 blue:245.0/225.0 alpha:1.0] ];
		[_shadow setShadowBlurRadius:5];
		[_shadow setShadowOffset:NSMakeSize(0, 0)];	//[NSColor colorWithDeviceRed:0.0 green:0.0 blue:0.0 alpha:1.0];
		[_shadow set];	
	}
	NSRect imgRect = NSInsetRect(frame, ( NSWidth(frame) -[img size].width)/2.0, ( NSHeight(frame) -[img size].height)/2.0);
	[img drawInRect:imgRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0 respectFlipped:YES hints:nil] ;
	[NSGraphicsContext restoreGraphicsState];


}
@end
