//
//  ImageCollectionViewCell.swift
//  ImageGalleryApp
//
//  Created by Shaahid shamil on 21/10/24.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        // Set the background color to adapt to dark mode
        contentView.backgroundColor = UIColor.systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds // Keep imageView's frame to match the contentView
    }
    
    func configure(with url: String) {
        // Use SDWebImage to load the image and support placeholder
        imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(systemName: "photo"))
    }
}
