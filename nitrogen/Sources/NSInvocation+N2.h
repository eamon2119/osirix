//
//  NSInvocation+N2.h
//  Nitrogen
//
//  Created by Alessandro Volz on 21.09.09.
//  Copyright 2009 OsiriX Team. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSInvocation (N2)

+(NSInvocation*)invocationWithSelector:(SEL)sel target:(id)target argument:(id)arg;

@end
