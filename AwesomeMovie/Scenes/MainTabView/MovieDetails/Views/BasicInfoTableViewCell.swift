//
//  BasicInfoTableViewCell.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 12/02/2023.
//

import UIKit

class BasicInfoTableViewCell: UITableViewCell {
    //MARK: IBOutlet
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
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
        movieName.text = model.originalTitle
        let ratingText = "\(model.voteAverage) / 10 from IMDB"
        rating.text = ratingText
        releaseDate.text = model.releaseDate
        
    }
    
}
//MARK: ConfigurableCell extension
extension BasicInfoTableViewCell: ConfigurableCell {
    func configure(data viewModel:Movie, indexPath:IndexPath) {
        bindData(model: viewModel)
    }
}
