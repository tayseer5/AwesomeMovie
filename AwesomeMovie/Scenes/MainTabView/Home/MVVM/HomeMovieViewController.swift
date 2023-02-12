//
//  HomeMovieViewController.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import UIKit
//1) stop current layout just display data
//2) get image
//3) get image with different size
//4) sort
//5) details
//6) favourite


final class HomeMovieViewController: UIViewController, HomeView {
    @IBOutlet weak var movieCollectionView: UICollectionView! {
        didSet{
            movieCollectionView.registerNib(ImagesSliderCollectionViewCell.self)
            movieCollectionView.delegate = self
            movieCollectionView.dataSource = self
            movieCollectionView.prefetchDataSource = self
        }
    }
    
    var finishFlow: (() -> Void)?
    var viewModel: (HomeMovieViewModelInput & HomeMovieViewModelOutput)?
    let cellWidth = UIScreen.main.bounds.width / 2.1
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustUI()
        handlingBindingWithViewModel()
        viewModel?.viewDidLoad()
    }
    
    private func adjustUI () {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        movieCollectionView?.collectionViewLayout = layout
    }
    private func handlingBindingWithViewModel() {
        viewModel?.showErrorMessage = { [weak self] messgage in
            
        }
        viewModel?.dataLoaded = { [weak self] in
            self?.movieCollectionView?.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeMovieViewController : UICollectionViewDelegate {
    
}
extension HomeMovieViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getNumberOfData() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = viewModel?.getDataForIndex(indexPath.row) else {
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeue(ImagesSliderCollectionViewCell.self, indexPath: indexPath)
        cell.configure(data: data, indexPath: indexPath)
        return cell
       
    }
}
extension HomeMovieViewController : UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let needsFetch = indexPaths.contains { $0.row >= ((self.viewModel?.getNumberOfData() ?? 0) - 1) }
        if needsFetch {
            viewModel?.didLoadNextPage()
        }
    }
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
    }
}

