//
//  HomeMovieViewController.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import UIKit
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
        adjustNavBarAndAddSortButtonWithAction()
        self.navigationItem.title = "The title";
        navigationController?.setNavigationBarHidden(false, animated: false)
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
    private func adjustNavBarAndAddSortButtonWithAction () {
            let rightBarButtonsView = UIStackView(frame: CGRect.init(x: 0, y: 0, width: 180, height: 40))
            rightBarButtonsView.backgroundColor = .clear
            rightBarButtonsView.axis  = NSLayoutConstraint.Axis.horizontal
            rightBarButtonsView.distribution  = UIStackView.Distribution.equalSpacing
            rightBarButtonsView.alignment = UIStackView.Alignment.center
            rightBarButtonsView.spacing   = 5.0
            let sortButton = UIButton()
            sortButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            sortButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
            //UIButton(frame: CGRect.init(x: 100, y: 8, width: 40, height: 20))
            sortButton.setImage(UIImage(named: "funnel"), for: .normal)
            sortButton.tintColor = .white
            let menuClosure = {(action: UIAction) in
                    self.sortActionHandler(value: action.title)
                }
            sortButton.menu = UIMenu(children: [
                        UIAction(title: "Most Popular", handler: menuClosure),
                        UIAction(title: "Top Rated", handler: menuClosure),
                    ])
            sortButton.showsMenuAsPrimaryAction = true
            //notificatioButton.changesSelectionAsPrimaryAction = true
            //notificatioButton.addTarget(self, action: #selector(self.openMenu), for: .touchUpInside)
            rightBarButtonsView.addArrangedSubview(sortButton)
            let rightBarButton = UIBarButtonItem(customView: rightBarButtonsView)
            self.navigationItem.rightBarButtonItems = [rightBarButton]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(hexString: HexColors.grayshGreen.rawValue)]
    }
    func sortActionHandler(value:String) {
        if value == "Most Popular" {
            viewModel?.changeSort(sortType: .mostPopular)
        } else {
            viewModel?.changeSort(sortType: .topRated)
        }
        
    }
    private func handlingBindingWithViewModel() {
        viewModel?.showErrorMessage = { [weak self] messgage in
            
        }
        viewModel?.dataLoaded = { [weak self] reset in
            if reset {
                self?.movieCollectionView?.setContentOffset(.zero, animated: false)
            }
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

