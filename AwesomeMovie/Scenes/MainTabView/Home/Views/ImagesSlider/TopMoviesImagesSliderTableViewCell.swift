//
//  TopMoviesImagesSliderTableViewCell.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import UIKit

class TopMoviesImagesSliderTableViewCell: UITableViewCell {

    @IBOutlet weak var moviesImagesPageController: UIPageControl!
    @IBOutlet weak var autoMoviesImageSliderCollectionViiew: UICollectionView! {
        didSet {
            autoMoviesImageSliderCollectionViiew.registerNib(ImagesSliderCollectionViewCell.self)
            autoMoviesImageSliderCollectionViiew.delegate = self
            autoMoviesImageSliderCollectionViiew.dataSource = self
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TopMoviesImagesSliderTableViewCell : UICollectionViewDelegate {
    
}
extension TopMoviesImagesSliderTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
