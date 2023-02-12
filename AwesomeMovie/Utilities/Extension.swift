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
//MARK: - UITableView init
extension UITableView {
    func registerNib<T: UITableViewCell & ConfigurableCell>(_ cellClass: T.Type, bundle: Bundle? = nil){
        self.register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeue<T: UITableViewCell & ConfigurableCell >(_ cellClass: T.Type, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
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
//MARK: - UIColor creation
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
//MARK: - UIImageView enhance feature
extension UIImageView {
    func blurEffect() {
        var context = CIContext(options: nil)
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        if let _ = self.image {
            let beginImage = CIImage(image: self.image! )
            currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
            currentFilter!.setValue(3, forKey: kCIInputRadiusKey)
            
            let cropFilter = CIFilter(name: "CICrop")
            cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
            cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")
            
            let output = cropFilter!.outputImage
            let cgimg = context.createCGImage(output!, from: output!.extent)
            let processedImage = UIImage(cgImage: cgimg!)
            self.image = processedImage
        }
    }
}
//MARK: - UIView enhance feature
extension UIView{
   // For insert layer in Foreground
   func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.addSublayer(gradient)
   }
   // For insert layer in background
   func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.insertSublayer(gradient, at: 0)
   }
}
