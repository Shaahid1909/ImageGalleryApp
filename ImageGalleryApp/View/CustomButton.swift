//
//  CustomButton.swift
//  ImageGalleryApp
//
//  Created by Shaahid shamil on 21/10/24.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.cornerRadius = 8
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.cyan.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
