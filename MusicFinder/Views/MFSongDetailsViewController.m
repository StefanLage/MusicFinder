//
//  MFSongDetailsViewController.m
//  MusicFinder
//
//  Created by Stefan Lage on 14/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFSongDetailsViewController.h"
#import "MFSongDetailsViewModel.h"

@interface MFSongDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *songImageView;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumLabel;

@property (nonatomic, strong) MFSongDetailsViewModel *viewModel;

@end

@implementation MFSongDetailsViewController

- (instancetype) initWithViewModel: (MFSongDetailsViewModel *) viewModel{
    self = [super init];
    if(self){
        _viewModel = viewModel;
    }
    return self;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)bindViewModel{
    [self setTitle:self.viewModel.title];

    // Load image in background
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        __block NSData *imageData = [NSData dataWithContentsOfURL:self.viewModel.albumArtworkUrl];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self.songImageView setImage:[UIImage imageWithData:imageData]];
        });
    });
    [self.artistLabel setText:self.viewModel.artistName];
    [self.trackLabel setText:self.viewModel.trackName];
    [self.albumLabel setText:self.viewModel.albumName];
}
@end
