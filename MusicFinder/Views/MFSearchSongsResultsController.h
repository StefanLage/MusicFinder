//
//  MFSearchSongsResultsController.h
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MFSearchSongsViewModel;

@interface MFSearchSongsResultsController : UITableViewController

- (instancetype) initWithViewModel: (MFSearchSongsViewModel * __weak) viewModel;

@end
