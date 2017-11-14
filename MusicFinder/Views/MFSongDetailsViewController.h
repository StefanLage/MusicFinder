//
//  MFSongDetailsViewController.h
//  MusicFinder
//
//  Created by Stefan Lage on 14/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MFSongDetailsViewModel;

@interface MFSongDetailsViewController : UIViewController

- (instancetype) initWithViewModel: (MFSongDetailsViewModel *) viewModel;

@end
