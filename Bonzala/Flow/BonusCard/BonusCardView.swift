//
//  BonusCardView.swift
//  Bonzala


import Foundation
import UIKit
class BonusCardView: UIView {
    
    private lazy var bonusCardQRConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGreen
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        return view
    }()
    
    private(set) lazy var qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()


    private(set) lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "backBtn"), for: .normal)
        return button
    }()
    
    private lazy var bonusCardImageConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 8)
        view.layer.shadowRadius = 14
        return view
    }()

    private lazy var cardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "Account"
        label.textColor = .yellowOne
        label.font = UIFont(name: "JosefinSans-Regular", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "\(UD.shared.balance)"
        label.textColor = .white
        label.font = UIFont(name: "JosefinSans-Bold", size: 80)
        label.textAlignment = .center
        return label
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
        [backBtn,accountLabel,scoreLabel,bonusCardQRConteinerView,bonusCardImageConteinerView].forEach(addSubview(_:))
        bonusCardImageConteinerView.addSubview(cardImage)
        bonusCardQRConteinerView.addSubview(qrCodeImageView)
        
    }
    
    private func setupConstraints() {
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
        }
        
        bonusCardImageConteinerView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(backBtn.snp.bottom)
            make.bottom.equalTo(accountLabel.snp.top)
        }
        
        cardImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(180)
        }
        
        accountLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(scoreLabel.snp.top).offset(-2)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        bonusCardQRConteinerView.snp.makeConstraints { (make) in
            make.top.equalTo(scoreLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(56)
            make.height.equalTo(bonusCardQRConteinerView.snp.width)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-16)
        }
        qrCodeImageView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview().inset(10)
        }

    }
}

