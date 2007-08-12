//
//  UpperCaseStringFormatter.m
//  OSIHangingPreferencePane
//
//  Created by Lance Pysher on 1/3/07.

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

#import "UpperCaseStringFormatter.h"


@implementation UpperCaseStringFormatter

- (NSString *)stringForObjectValue:(id)anObject{
	return [anObject uppercaseString];
}

- (BOOL)getObjectValue:(id *)anObject forString:(NSString *)string errorDescription:(NSString **)error{
	*anObject = [string uppercaseString];
	return YES;
}

- (BOOL)isPartialStringValid:(NSString *)partialString newEditingString:(NSString **)newString errorDescription:(NSString **)error{
	*newString = [partialString uppercaseString];
	return YES;
}

@end
