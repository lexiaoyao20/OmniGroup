// Copyright 2013 The Omni Group. All rights reserved.
//
// This software may only be used and reproduced according to the
// terms in the file OmniSourceLicense.html, which should be
// distributed with this project and can also be found at
// <http://www.omnigroup.com/developer/sourcecode/sourcelicense/>.
//
// $Id$

#import <UIKit/UITableViewController.h>

@class OUIMenuOption;

@interface OSUPreferencesViewController : UITableViewController

// Strings for displaying before navigating to this view controller
+ (NSString *)localizedDisplayName;
+ (NSString *)localizedDetailDescription;

+ (OUIMenuOption *)menuOption;

@end
