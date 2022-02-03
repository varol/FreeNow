//
//  VehicleListViewController.h
//  FreeNow
//
//  Created by Varol Aksoy on 1.02.2022.
//

@import UIKit;

@class VehicleListViewModel;
@class APIService;
@class LoadingView;
@protocol VehicleListViewModelDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface VehicleListViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *vehicleListCollectionView;
@property (nonatomic, strong) IBOutlet VehicleListViewModel *viewModel;
@property (nonatomic, retain) APIService* apiService;

@end

NS_ASSUME_NONNULL_END
