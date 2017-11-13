//
//  MFSearchSongsController.m
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFSearchSongsController.h"

@interface MFSearchSongsController ()

@property (nonatomic, strong, readonly) MFSearchSongsViewModel *viewModel;

@end

@implementation MFSearchSongsController

#pragma mark - Lifecycle
- (instancetype) initWithViewModel: (MFSearchSongsViewModel *) viewModel{
    self = [super init];
    if (self){
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
