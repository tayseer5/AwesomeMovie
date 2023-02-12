//
//  DetailsTableViewCell.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 13/02/2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.borderWidth = 3
            containerView.layer.borderColor = UIColor.white.cgColor
            containerView.layer.cornerRadius = 10.0
            containerView.clipsToBounds = true;
        }
    }
    @IBOutlet weak var textView: UITextView!
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
        textView.text = model.overview
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.isScrollEnabled = false
    }
    
}
//MARK: ConfigurableCell extension
extension DetailsTableViewCell: ConfigurableCell {
    func configure(data viewModel:Movie, indexPath:IndexPath) {
        bindData(model: viewModel)
    }
}
