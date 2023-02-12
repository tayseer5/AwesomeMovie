//
//  PosterImageTableViewCell.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 12/02/2023.
//

import UIKit

class PosterImageTableViewCell: UITableViewCell {
    //MARK: @IBOutlet
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var mainMovieImage: UIImageView!{
        didSet {
            mainMovieImage.layer.cornerRadius = 25.0
            mainMovieImage.clipsToBounds = true;
        }
    }
    //MARK: override function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: private helping function
    private func bindData(model: Movie) {
        mainMovieImage.setImage(imageUrl: (model.posterPath ?? "").imagePath)
        posterImage.setImage(imageUrl: (model.backdropPath ?? "").imagePath)
        posterImage.blurEffect()
        posterImage.addBlackGradientLayerInForeground(frame: posterImage.bounds, colors:[ .clear,.black])
    }
    
}
//MARK: ConfigurableCell extension
extension PosterImageTableViewCell: ConfigurableCell {
    func configure(data viewModel:Movie, indexPath:IndexPath) {
        bindData(model: viewModel)
    }
}
