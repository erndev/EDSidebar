//
//  ECSideBar.h
//
//
//  Created by erndev 
//  BSD license. 
//

#import <Cocoa/Cocoa.h>

@class EDSideBar;



@protocol EDSideBarDelegate <NSObject>
@required
- (void)sideBar:(EDSideBar*)tabBar didSelectButton:(NSInteger)index;
@end
enum {
	ECSideBarLayoutTop			= 0,
	ECSideBarLayoutCenter		= 1,
	ECSideBarLayoutBottom		= 2,
};	
typedef NSUInteger ECSideBarLayoutMode;

@interface EDSideBar : NSView {



	ECSideBarLayoutMode layoutMode;
	NSColor *_backgroundColor;
	CGFloat	buttonsHeight;
	id<EDSideBarDelegate> sidebarDelegate;
	NSMatrix *_matrix;
	Class cellClass;
	NSImageView *selectorImageView;
	BOOL	animateSelection;
	NSTimeInterval animationDuration;

}
-(void)setLayoutMode:(ECSideBarLayoutMode)layout;
-(void)addButtonWithTitle:(NSString*)title;
-(void)addButtonWithTitle:(NSString*)title image:(NSImage*)image;
-(void)addButtonWithTitle:(NSString*)title image:(NSImage*)image alternateImage:(NSImage*)alternateImage;
-(void)selectButtonAtRow:(NSUInteger)row;
-(void)drawBackground:(NSRect)rect;
-(void)setSelectionImage:(NSImage*)image;
-(id)cellForItem:(NSInteger)index;

@property (nonatomic,retain) NSColor *backgroundColor;
@property (nonatomic,retain) id<EDSideBarDelegate>sidebarDelegate;
@property (setter=setCellClass) Class cellClass;
@property (setter=setLayoutMode) ECSideBarLayoutMode layoutMode;
@property (setter=setButtonsHeight) CGFloat buttonsHeight;
@property BOOL animateSelection;
@property NSTimeInterval animationDuration;
@end
