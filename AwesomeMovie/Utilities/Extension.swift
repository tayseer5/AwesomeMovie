//
//  Extentiosn.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation
import UIKit
import SDWebImage

//MARK: - UICollectionView init
extension UICollectionView {
    func registerNib<T: UICollectionViewCell & ConfigurableCell>(_ cellClass: T.Type, bundle: Bundle? = nil){
        self.register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeue<T: UICollectionViewCell & ConfigurableCell>(_ cellClass: T.Type, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Error: cell with id: \(T.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}
//MARK: - UIImageView image Creating
extension UIImageView {
    func setHilightedImage(imageUrl: String){
        self.sd_setHighlightedImage(with: URL(string: imageUrl), options: [], completed: nil)
    }
    func setImage(imageUrl: String , complesion : ((_ img : UIImage) -> Void)? = nil){
        if let encoded = imageUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed){
            self.sd_setImage(with: URL(string: encoded)) { (img, _, _, _) in
                if let image = img{
                    self.image = image
                    complesion?(image)
                }else{
                    self.image = UIImage.init(named: "NoImage")
                }
            }
        }else{
            self.sd_setImage(with: URL(string: imageUrl)) { (img, _, _, _) in
                if img != nil{
                    self.image = img
                }else{
                    self.image = UIImage.init(named: "NoImage")
                }
            }
        }
    }
}
//MARK: - String inhance function
extension String {
        var imagePath: String {
            return BaseUrl.baseImageUrl.rawValue + Param.imageDimention.rawValue + self
        }
}
