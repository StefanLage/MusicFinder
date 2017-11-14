//
//  MFSearchSongsResultsController.m
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFSearchSongsResultsController.h"
#import "MFSearchSongsViewModel.h"

NSString * const SongCellIdentifier = @"SongCell";

@interface MFSearchSongsResultsController ()

@property (nonatomic, weak, readonly) MFSearchSongsViewModel *viewModel;

@end

@implementation MFSearchSongsResultsController

- (instancetype) initWithViewModel: (MFSearchSongsViewModel * __weak) viewModel{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self){
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:UITableViewCell.class
           forCellReuseIdentifier:SongCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.viewModel){
        return [self.viewModel songsInSection:section];
    }
    else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SongCellIdentifier
                                                            forIndexPath:indexPath];
    cell.textLabel.text = self.viewModel ? [self.viewModel songName:indexPath] : @"";
    return cell;
}

@end
