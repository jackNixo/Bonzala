//
//  HomeBtn.swift
//  Bonzala

import Foundation
import UIKit

class HomeBtn: UIView {
    
    private let title: String
    private var image: UIImage?
    

    private lazy var iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = image
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "JosefinSans-Bold", size: 28)
        label.text = title
        label.textColor = .yellowOne
        return label
    }()
    
    init(title: String, image: UIImage?) {
        self.title = title
        self.image = image
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.borderWidth = 1
        addSubview(iconImage)
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
     
        iconImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-28)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
        }
      
    }
}
