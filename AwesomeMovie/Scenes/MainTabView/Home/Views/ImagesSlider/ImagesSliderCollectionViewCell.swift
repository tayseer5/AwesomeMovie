//
//  ImagesSliderCollectionViewCell.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import UIKit

class ImagesSliderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    private func bindData(model: Movie) {
        var imageEndPoint = model.posterPath ?? ""
        self.cellImage.setImage(imageUrl: imageEndPoint.imagePath)
    }

}

extension ImagesSliderCollectionViewCell : ConfigurableCell {
    
    func configure(data viewModel:Movie, indexPath:IndexPath) {
        bindData(model: viewModel)
    }
}
