//
//  VehicleListViewController.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import UIKit

final class VehicleListViewController: BaseViewController, LoadingShowable {
    @IBOutlet private weak var vehicleListCollectionView: UICollectionView!

    var viewModel: VehicleListViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
    
    @objc fileprivate func pullToRefresh() {
        viewModel.pullToRefresh()
    }
}

extension VehicleListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellType: VehicleListCollectionViewCell.self,
                                            indexPath: indexPath)
        
        if let vehicle = viewModel.vehicles(indexPath.item) {
            cell.viewModel = VehicleListCollectionViewCellViewModel(vehicle: vehicle)
        }
        
        return cell
    }
}

extension VehicleListViewController: UICollectionViewDelegate {
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            self.vehicleListCollectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
}

extension VehicleListViewController: VehicleListViewModelDelegate {
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func reloadData() {
        vehicleListCollectionView.reloadData()
    }
    
    func endRefreshing() {
        vehicleListCollectionView.refreshControl?.endRefreshing()
    }
    
    func addRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        vehicleListCollectionView.refreshControl = refreshControl
    }
    
    func prepareCollectionView() {
        vehicleListCollectionView.dataSource = self
        vehicleListCollectionView.delegate = self
        vehicleListCollectionView.register(cellType: VehicleListCollectionViewCell.self)
        
        handleCompositionalLayout()
    }
    
    fileprivate func handleCompositionalLayout() {
        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(viewModel.widthDimension),
            heightDimension: NSCollectionLayoutDimension.estimated(viewModel.heightDimension)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size,
                                                       subitem: item,
                                                       count: viewModel.layoutGroupCount)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        vehicleListCollectionView.collectionViewLayout = layout
    }
}
