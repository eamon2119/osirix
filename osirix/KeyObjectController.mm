//
//  KeyObjectController.mm
//  OsiriX
//
//  Created by Lance Pysher on 6/13/06.
/*=========================================================================
  Program:   OsiriX

  Copyright (c) OsiriX Team
  All rights reserved.
  Distributed under GNU - GPL
  
  See http://homepage.mac.com/rossetantoine/osirix/copyright.html for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.
=========================================================================*/

#import "KeyObjectController.h"
#import "KeyObjectReport.h"
#import "browserController.h"
#import "DicomStudy.h"


@implementation KeyObjectController

- (id)initWithStudy:(id)study{
	if (self = [super initWithWindowNibName:@"KeyObjectReport"]) {
		_study = [study retain];
		_title = 113000; // Of Interest
		NSLog(@"init Key Object controller");
		NSArray *series = [study keyObjectSeries];
		_seriesUID = [series valueForKey:@"seriesInstanceUID"];
	}
	return self;
}

- (void)dealloc{
	[_study release];
	[_keyDescription release];
	[_seriesUID release];
	[super dealloc];
}

- (int) title{
	return _title;
}
- (void)setTitle:(int)title{
	_title = title;
}
- (NSString *) keyDescription{
	return _keyDescription;
}
- (void)setKeyDescription:(NSString *)keyDescription{
	[_keyDescription release];
	_keyDescription = [keyDescription retain];
	NSLog(@"set description: %@",keyDescription);
}

- (IBAction)closeWindow:(id)sender{
	if ([sender tag] == 0){
		NS_DURING
		NSLog(@"close Window");
		NSString *studyInstanceUID = [_study valueForKey:@"studyInstanceUID"];
		NSString *path;


		//Save to INCOMING		
		NSString *rootFolder = [[BrowserController currentBrowser] documentsDirectory];
		//path = [[rootFolder stringByAppendingPathComponent:@"REPORTS"] stringByAppendingPathComponent:studyInstanceUID];
		path = [rootFolder stringByAppendingPathComponent:@"INCOMING"];

		KeyObjectReport *ko = [[KeyObjectReport alloc] initWithStudy:_study  title:_title   description:_keyDescription seriesUID:_seriesUID];
		NSString *sopInstanceUID = [ko sopInstanceUID];
	
		path = [path stringByAppendingPathComponent:sopInstanceUID];
		NSLog(@"Write file: %@", path);
		if (ko) {
			NSLog(@"ko: %@", [ko description]);
			[ko writeFileAtPath:path];
			[ko release];
		}

		NS_HANDLER
			NSLog(@"exception: %@", [localException description]);
		NS_ENDHANDLER
		
	}
	[NSApp endSheet:[self window] returnCode:0];
	[[self window] close];
	
}

@end
