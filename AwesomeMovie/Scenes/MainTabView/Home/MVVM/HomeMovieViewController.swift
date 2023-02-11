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
        }
    }
    
    var finishFlow: (() -> Void)?
    var viewModel: (HomeMovieViewModelInput & HomeMovieViewModelOutput)?
    private var layout = PinterestLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustUI()
        handlingBindingWithViewModel()
        viewModel?.viewDidLoad()
    }
    
    private func adjustUI () {
        movieCollectionView?.collectionViewLayout = layout
        layout.columnsCount = 2
        layout.delegate = self
        layout.contentPadding = PinterestLayout.Padding(horizontal: 5, vertical: 5)
        layout.cellsPadding = PinterestLayout.Padding(horizontal: 10, vertical: 10)
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
extension HomeMovieViewController: PinterestLayoutDelegate {
    func cellSize(indexPath: IndexPath) -> CGSize {
        // Calculate size based on the layout width
        //let image = images[indexPath.row]
        //guard let
        let width = 100
        let height = 150
        //image.thumbnail?.height
        //else { return .zero }
        let cellWidth = layout.width
        let size = CGSize(width: Int(cellWidth), height: Int(CGFloat((height/width)) * cellWidth))
        return size
    }
}

