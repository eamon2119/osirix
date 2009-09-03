//
//  N2Steps.h
//  Nitrogen Framework
//
//  Created by Joris Heuberger on 02/04/07.
//  Edited by Alessandro Volz since 21/05/09.
//  Copyright 2007-2009 OsiriX Team. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class N2Step; //, N2StepsView;

extern NSString* N2StepsDidAddStepNotification;
extern NSString* N2StepsWillRemoveStepNotification;
extern NSString* N2StepsNotificationStep;

@interface N2Steps : NSArrayController {
//	IBOutlet N2StepsView* _view;
	N2Step* _currentStep;
	IBOutlet id _delegate;
}

@property(retain) id delegate;
@property(assign) N2Step* currentStep;
//	@property(readonly) N2StepsView* view;

-(void)enableDisableSteps;

-(BOOL)hasNextStep;
-(BOOL)hasPreviousStep;

-(IBAction)nextStep:(id)sender;
-(IBAction)previousStep:(id)sender;
-(IBAction)skipStep:(id)sender;
-(IBAction)stepValueChanged:(id)sender;
-(IBAction)reset:(id)sender;

@end

@interface NSObject (N2StepsDelegate)

-(void)steps:(N2Steps*)steps willBeginStep:(N2Step*)step;
-(void)steps:(N2Steps*)steps valueChanged:(id)sender;
-(BOOL)steps:(N2Steps*)steps shouldValidateStep:(N2Step*)step;
-(void)steps:(N2Steps*)steps validateStep:(N2Step*)step;

@end