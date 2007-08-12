//
//  LLDCMView.m
//  OsiriX
//
//  Created by joris on 28/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "LLDCMView.h"
#import "ROI.h"

@implementation LLDCMView

- (id)initWithFrame:(NSRect)frameRect
{
	[super initWithFrame:frameRect];
	[self setStringID:@"OrthogonalMPRVIEW"];
	return self;
}

- (void) blendingPropagate
{
	[viewer blendingPropagate:self];
}

- (void) setIndexWithReset:(short) index :(BOOL) sizeToFit
{
	long i;
	if( dcmPixList && index != -1)
    {
		[[self window] setAcceptsMouseMovedEvents: YES];

		curROI = 0L;
		
		origin.x = origin.y = 0;
		curImage = index; 
		if( curImage >= [dcmPixList count]) curImage = [dcmPixList count] -1;
		curDCM = [dcmPixList objectAtIndex: curImage];
		
		[curRoiList release];
		
		if( dcmRoiList) curRoiList = [[dcmRoiList objectAtIndex: curImage] retain];
		else
		{
			curRoiList = [[NSMutableArray alloc] initWithCapacity:0];
		}
		
		for( i = 0; i < [curRoiList count]; i++)
		{
			[[curRoiList objectAtIndex:i ] setRoiFont: labelFontListGL :labelFontListGLSize :self];
			[[curRoiList objectAtIndex:i ] recompute];
			// Unselect previous ROIs
			[[curRoiList objectAtIndex: i] setROIMode : ROI_sleep];
		}
		
		curWW = [curDCM ww];
		curWL = [curDCM wl];
		
		rotation = 0;
		
		//get Presentation State info from series Object
		[self updatePresentationStateFromSeries];
		
		[curDCM checkImageAvailble :curWW :curWL];
		
//		NSSize  sizeView = [[self enclosingScrollView] contentSize];
//		[self setFrameSize:sizeView];
		
		NSRect  sizeView = [self bounds];
		if( sizeToFit || [[[self window] windowController] is2DViewer] == NO) {
			[self scaleToFit];
		}
		
		if( [[[self window] windowController] is2DViewer] == YES)
		{
			if( [curDCM sourceFile])
			{
				if( [[[self window] windowController] is2DViewer] == YES) [[self window] setRepresentedFilename: [curDCM sourceFile]];
			}
		}
		
		[self loadTextures];
		[self setNeedsDisplay:YES];
		
//		if( [[[self window] windowController] is2DViewer] == YES)
//			[[[self window] windowController] propagateSettings];
		
//		if( [stringID isEqualToString:@"FinalView"] == YES || [stringID isEqualToString:@"OrthogonalMPRVIEW"]) [self blendingPropagate];
//		if( [stringID isEqualToString:@"Original"] == YES) [self blendingPropagate];

		[yearOld release];
		yearOld = [[[dcmFilesList objectAtIndex:[self indexForPix:curImage]] valueForKeyPath:@"series.study.yearOld"] retain];
	}
}

@end
