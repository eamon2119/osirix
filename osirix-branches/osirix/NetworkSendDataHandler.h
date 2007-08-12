//
//  NetworkSendDataHandler.h
//  OsiriX
//
//  Created by Lance Pysher on 5/31/05.

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


#import <Cocoa/Cocoa.h>
#import <OsiriX/DCMCStoreResponseHandler.h>


@interface NetworkSendDataHandler : DCMCStoreResponseHandler {
	id logEntry;
	
}
@end
