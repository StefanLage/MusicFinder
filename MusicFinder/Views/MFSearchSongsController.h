//
//  MFSearchSongsController.h
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSearchSongsViewModel.h"

@interface MFSearchSongsController : UIViewController

- (instancetype) initWithViewModel: (MFSearchSongsViewModel *) viewModel;

@end
