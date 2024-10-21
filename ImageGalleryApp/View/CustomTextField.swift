//
//  CustomTextField.swift
//  ImageGalleryApp
//
//  Created by Shaahid shamil on 21/10/24.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.cornerRadius = 8
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
        placeholder = "Enter your name"
        font = UIFont.systemFont(ofSize: 16)
    }
}
