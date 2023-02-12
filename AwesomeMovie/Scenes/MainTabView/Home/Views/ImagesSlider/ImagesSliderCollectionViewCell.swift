//
//  ImagesSliderCollectionViewCell.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import UIKit

class ImagesSliderCollectionViewCell: UICollectionViewCell {
    //MARK: IBOutlet
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cellImage: UIImageView! {
        didSet {
            cellImage.layer.cornerRadius = 25.0
             cellImage.clipsToBounds = true;
        }
    }
    //MARK: override
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    private func bindData(model: Movie) {
        var imageEndPoint = model.posterPath ?? ""
        self.cellImage.setImage(imageUrl: imageEndPoint.imagePath)
    }

}
//MARK: ConfigurableCell Extention 
extension ImagesSliderCollectionViewCell : ConfigurableCell {
    
    func configure(data viewModel:Movie, indexPath:IndexPath) {
        bindData(model: viewModel)
    }
}
