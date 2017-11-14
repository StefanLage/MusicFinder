//
//  MFSearchSongsController.m
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFSearchSongsController.h"
#import "MFSearchSongsResultsController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "UISearchBar+RAC.h"

@interface MFSearchSongsController () <UITableViewDelegate>

@property (nonatomic, strong, readonly) MFSearchSongsViewModel *viewModel;
@property (nonatomic, strong, readonly) UISearchController *searchBarController;
@property (nonatomic, strong, readonly) MFSearchSongsResultsController *resultController;

@end

@implementation MFSearchSongsController

#pragma mark - Lifecycle
- (instancetype) initWithViewModel: (MFSearchSongsViewModel *) viewModel{
    self = [super init];
    if (self){
        _viewModel = viewModel;
        _resultController = [[MFSearchSongsResultsController alloc] initWithViewModel:self.viewModel];
        _searchBarController = [[UISearchController alloc] initWithSearchResultsController:self.resultController];
        [self setTitle:self.viewModel.title];
        [self setUpSearchBar];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setUpSearchBar{
    self.searchBarController.searchBar.placeholder = self.viewModel.searchBarPlaceHolder;
    [self.searchBarController.searchBar sizeToFit];
    self.resultController.tableView.delegate = self;
    self.searchBarController.dimsBackgroundDuringPresentation = YES;
    self.definesPresentationContext = YES;
    // Add the searchBar in the navigation bar
    if (@available(iOS 11.0, *)){
        self.navigationItem.searchController = _searchBarController;
    }
    else{
        self.navigationItem.titleView = _searchBarController.searchBar;
    }
    // bind searchTerms to the searchbar's input
    RAC(self.viewModel, searchTerms) = self.searchBarController.searchBar.rac_textSignal;
    // Avoid retain cylce
    @weakify(self);
    [[self.viewModel.songsObserver deliverOnMainThread]
     subscribeNext:^(id _) {
         @strongify(self);
         // Send message to the tableView to update itself
         NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
         [self.resultController.tableView reloadSections:indexSet
                                        withRowAnimation:UITableViewRowAnimationAutomatic];
     }];
}

#pragma mark - UITableViewDelegate

@end
