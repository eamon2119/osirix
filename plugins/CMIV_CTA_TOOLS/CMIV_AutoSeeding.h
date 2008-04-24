/*=========================================================================
 CMIVSaveResult
 
 Auto Cropping and Auto Seeding
 
 Author: Chunliang Wang (chunliang.wang@imv.liu.se)
 
 
 Program:  CMIV CTA image processing Plugin for OsiriX
 
 This file is part of CMIV CTA image processing Plugin for OsiriX.
 
 Copyright (c) 2007,
 Center for Medical Image Science and Visualization (CMIV),
 Linköping University, Sweden, http://www.cmiv.liu.se/
 
 CMIV CTA image processing Plugin for OsiriX is free software;
 you can redistribute it and/or modify it under the terms of the
 GNU General Public License as published by the Free Software 
 Foundation, either version 3 of the License, or (at your option)
 any later version.
 
 CMIV CTA image processing Plugin for OsiriX is distributed in
 the hope that it will be useful, but WITHOUT ANY WARRANTY; 
 without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 =========================================================================*/

#import <Cocoa/Cocoa.h>
#import "PluginFilter.h"
#import "CMIV_CTA_TOOLS.h"

@interface CMIV_AutoSeeding : NSObject {
	ViewerController     *originalViewController;
	CMIV_CTA_TOOLS* parent;
	long      imageWidth,imageHeight,imageAmount,imageSize;
}
-(int)runAutoSeeding:(ViewerController *) vc: (CMIV_CTA_TOOLS*) owner;
-(void)replaceOriginImage:(unsigned char*)outData;
-(void)exportResults:(unsigned char*)outData:(long*)origin:(long*)dimesion;
-(void)readROIFromViewer:(unsigned char*)colorData;
@end
