//
//  QrView.swift
//  Bonzala



import Foundation
import UIKit

class QrView: UIView {

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
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private(set) lazy var qrConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .greenOne
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 24
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 8
        return view
    }()
    
    private(set) lazy var qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private(set) lazy var hideButton: UIButton = {
        let button = UIButton()
        button.setTitle("HIDE", for: .normal)
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
        addSubview(qrConteiner)
        addSubview(backBtn)
        addSubview(titleGiftLabel)
        qrConteiner.addSubview(qrCodeImageView)
        qrConteiner.addSubview(hideButton)
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
        
        qrConteiner.snp.makeConstraints { make in
            make.top.equalTo(titleGiftLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().offset(-56)
        }
        
        qrCodeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(qrCodeImageView.snp.width)
        }
        
        hideButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(20)
            make.height.equalTo(46)
        }
    }
}
