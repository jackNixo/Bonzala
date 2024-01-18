//
//  InfoView.swift
//  Bonzala


import Foundation
import UIKit

class InfoView: UIView {
    
    private(set) lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "backBtn"), for: .normal)
        return button
    }()

    private(set) lazy var imageConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 8)
        view.layer.shadowRadius = 14
        return view
    }()
    
    private (set) var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private(set) var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Settings.appTitle)"
        label.textColor = .yellowOne
        label.font = UIFont(name: "JosefinSans-Bold", size: 28)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the Bonzala store and app - your wild jungle guide, where adventure begins with every purchase! At Bonzala you'll discover a wonderful world of fashion filled with bold patterns, vibrant colors and unexpected style combinations.\nImmerse yourself in the wild by choosing from our wide range of exclusive products inspired by the beauty of the rainforest. From stylish clothing and accessories to unique home furnishings, Bonzala invites you to create your own unique lifestyle.\nOur Bonzala app opens the door to a world of privilege. Receive exclusive discount offers by scanning QR codes when shopping and enjoy special bonuses. Participate in our interactive events and promotions to receive nice gifts and become real owners of jungle treasures.\nBonzala is not just a store, it is a journey into the world of style, pleasure and amazing discoveries. Welcome to the wild fashion jungle with Bonzala!"
        label.textColor = .white
        label.font = UIFont(name: "JosefinSans-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var infoConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 8)
        view.layer.shadowRadius = 14
        return view
    }()
    
    private(set) lazy var infoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: -56, right: 0)
        return scrollView
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
        addSubview(infoScrollView)
        addSubview(backBtn)
        infoScrollView.addSubview(infoConteinerView)
        infoConteinerView.addSubview(imageConteinerView)
        infoConteinerView.addSubview(subTitleLabel)
        infoConteinerView.addSubview(contentLabel)
        imageConteinerView.addSubview(iconImage)
    }
    
    private func setupConstraints() {
     
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(56)
        }
        
        infoScrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.top.equalToSuperview()
        }
        
        infoConteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        imageConteinerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(100)
        }
        iconImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(56)
        }
    }
}
