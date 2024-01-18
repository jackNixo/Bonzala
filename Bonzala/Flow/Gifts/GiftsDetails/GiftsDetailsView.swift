//
//  GiftsDetailsView.swift
//  Bonzala

import Foundation
import UIKit

class GiftDetailView: UIView {
    
    private(set) lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "backBtn"), for: .normal)
        return button
    }()
    
    private lazy var titleGiftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellowOne
        label.font = UIFont(name: "JosefinSans-Bold", size: 28)
        label.text = "Gift"
        return label
    }()
    
    private lazy var giftDetailUseConteiner: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        view.backgroundColor = .greenOne
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var giftDetailConteiner: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var subTitleGiftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "JosefinSans-Bold", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var giftDetailImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    
    private(set) lazy var creditsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Credits"
        label.font = UIFont(name: "JosefinSans-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = .white
        label.font = UIFont(name: "JosefinSans-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var volumeScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "JosefinSans-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var creditsScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "JosefinSans-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var descriptionBodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "JosefinSans-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var payHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("PAY", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellowOne
        button.titleLabel?.font = UIFont(name: "JosefinSans-Regular", size: 20)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        backgroundColor = .darkGreen
        
        [backBtn,titleGiftLabel,giftDetailUseConteiner] .forEach(addSubview(_:))
        
        
        giftDetailUseConteiner.addSubview(giftDetailImage)
        giftDetailUseConteiner.addSubview(subTitleGiftLabel)
        giftDetailUseConteiner.addSubview(payHideButton)
        giftDetailUseConteiner.addSubview(creditsLabel)
        giftDetailUseConteiner.addSubview(creditsScoreLabel)
        giftDetailUseConteiner.addSubview(descriptionLabel)
        giftDetailUseConteiner.addSubview(descriptionBodyLabel)
        
    }
    private func setupConstraints() {
   
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        titleGiftLabel.snp.makeConstraints { make in
            make.top.equalTo(backBtn.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }

        giftDetailUseConteiner.snp.makeConstraints { make in
            make.top.equalTo(titleGiftLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().offset(-32)
        }

        payHideButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(20)
            make.height.equalTo(46)
            make.width.equalTo(245)
        }
        
        giftDetailImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(subTitleGiftLabel.snp.top).offset(-20)
            make.height.equalTo(giftDetailImage.snp.width).multipliedBy(0.7)
        }
        
        subTitleGiftLabel.snp.makeConstraints { make in
            make.top.equalTo(giftDetailImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        creditsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(subTitleGiftLabel.snp.bottom).offset(20)
        }
        
        creditsScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(creditsLabel.snp.right).offset(12)
            make.top.equalTo(subTitleGiftLabel.snp.bottom).offset(20)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(creditsLabel.snp.bottom).offset(20)
        }
    
        descriptionBodyLabel.snp.makeConstraints { make in
            make.left.right.equalTo(giftDetailUseConteiner).inset(12)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
        }
        
    }
}
