//
//  VehicleListViewController.m
//  FreeNow
//
//  Created by Varol Aksoy on 1.02.2022.
//

#import "FreeNow-Swift.h"
#import "VehicleListViewController.h"

@interface VehicleListViewController ()<VehicleListViewModelDelegate>
@end

@implementation VehicleListViewController
static NSString *cellIdentifier = @"VehicleListCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel.delegate = self;
    [_viewModel load];
}

// MARK: - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.viewModel numberOfItems];
}
 
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VehicleListCollectionViewCell *cell =
    [self.vehicleListCollectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Vehicle *vehicle = [self.viewModel vehicles:(indexPath.item)];
    VehicleListCollectionViewCellViewModel *cellVM = [[VehicleListCollectionViewCellViewModel alloc] initWithVehicle:vehicle];

    cell.viewModel = cellVM;
    return cell;
}
 
// MARK: - UICollectionViewDelegate

- (void)prepareCollectionView{
    self.vehicleListCollectionView.backgroundColor = [UIColor whiteColor];
    self.vehicleListCollectionView.delegate = self;
    self.vehicleListCollectionView.dataSource = self;
    [self.vehicleListCollectionView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat fullWidth = CGRectGetWidth(collectionView.bounds);
    return CGSizeMake(fullWidth, [self.viewModel heightDimension]);
}

// MARK: - VehicleListViewModelDelegate

- (void)showLoadingView {
    [[LoadingView shared] startLoading];
}

- (void)hideLoadingView {
    [[LoadingView shared] hideLoading];
}

- (void)reloadData {
    [self.vehicleListCollectionView reloadData];
}

- (void)addRefreshControl {
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(pullToRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.vehicleListCollectionView addSubview:refreshControl];
    self.vehicleListCollectionView.alwaysBounceVertical = YES;

}

- (void) pullToRefresh:(id)sender {
    [self.viewModel pullToRefresh];
    
    UIRefreshControl *refreshControl = (UIRefreshControl *)sender;
    if (refreshControl) {
        [refreshControl endRefreshing];
    }
}

@end
