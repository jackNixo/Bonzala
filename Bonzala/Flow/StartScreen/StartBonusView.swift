//
//  StartBonusView.swift
//  Bonzala

import Foundation
import UIKit
import SnapKit

class StartBonusView: UIView {
    
    private lazy var startBonusLabel: UILabel = {
        let label = UILabel()
        label.text = "START \nBONUS"
        label.textColor = .yellowOne
        label.font = UIFont(name: "JosefinSans-Bold", size: 48)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var startImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "giftsStart")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private(set) lazy var pointLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.textColor = .white
        label.font = UIFont(name: "JosefinSans-Bold", size: 48)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var thankButton: UIButton = {
        let button = UIButton()
        button.setTitle("THANK YOU", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellowOne
        button.titleLabel?.font = UIFont(name: "JosefinSans-Regular", size: 20)
        button.layer.cornerRadius = 20
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGreen
        setupUI()
        setUpConstraints()
        adjustFontSizesForScreenSize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(startBonusLabel)
        addSubview(startImageView)
        addSubview(pointLabel)
        addSubview(thankButton)
        
    }
    private func setUpConstraints(){
        
        
        startBonusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.left.right.equalToSuperview().inset(24)
        }
        
        startImageView.snp.makeConstraints { make in
            make.top.equalTo(startBonusLabel.snp.bottom).offset(60)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(pointLabel.snp.top).offset(-60)
            
        }
        
        pointLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(thankButton.snp.top).offset(-48)
            make.centerX.equalToSuperview()
        }
        
        thankButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(24)
            make.width.equalTo(345)
            make.height.equalTo(46)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-36)
        }
    }
    
    private func adjustFontSizesForScreenSize() {
        let screenSize = UIScreen.main.bounds
        let smallerScreenHeight: CGFloat = 812

        if screenSize.height < smallerScreenHeight {
            startBonusLabel.font = UIFont(name: "JosefinSans-Bold", size: 48)
            pointLabel.font = UIFont(name: "JosefinSans-Bold", size: 40)
        }
    }

    
}
