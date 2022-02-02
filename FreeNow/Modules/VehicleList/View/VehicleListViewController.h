//
//  VehicleListViewController.h
//  FreeNow
//
//  Created by Varol Aksoy on 1.02.2022.
//

@import UIKit;

@class VehicleListViewModel;

@protocol VehicleListViewModelDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface VehicleListViewController : UIViewController<VehicleListViewModelDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *vehicleListCollectionView;


@end

NS_ASSUME_NONNULL_END
