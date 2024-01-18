//
//  HomeView.swift
//  Bonzala


import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
    
    private(set) lazy var giftBtn = HomeBtn(title: "Gifts", image: UIImage(named: "giftsIconHome"))
    private(set) lazy var newsBtn = HomeBtn(title: "News", image: UIImage(named: "newsIconHome"))
    private(set) lazy var cardBtn = HomeBtn(title: "Card", image: UIImage(named: "qrIconHome"))
    private(set) lazy var infoBtn = HomeBtn(title: "Info", image: UIImage(named: "infoIconHome"))
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGreen
        return view
    }()
    
    private lazy var centerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "centerHome")
        return imageView
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
        addSubview(mainView)
        
        mainView.addSubview(giftBtn)
        mainView.addSubview(newsBtn)
        mainView.addSubview(infoBtn)
        mainView.addSubview(cardBtn)
        mainView.addSubview(centerImage)
        
        
    }
    
    private func setupConstraints() {
        
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        centerImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        giftBtn.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.width.equalTo(mainView.snp.width).dividedBy(2)
            make.height.equalTo(mainView.snp.height).dividedBy(2)
        }
        
        newsBtn.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.width.equalTo(mainView.snp.width).dividedBy(2)
            make.height.equalTo(mainView.snp.height).dividedBy(2)
        }
        
        cardBtn.snp.makeConstraints { (make) in
            make.bottom.left.equalToSuperview()
            make.width.equalTo(mainView.snp.width).dividedBy(2)
            make.height.equalTo(mainView.snp.height).dividedBy(2)
        }
        
        infoBtn.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview()
            make.width.equalTo(mainView.snp.width).dividedBy(2)
            make.height.equalTo(mainView.snp.height).dividedBy(2)
        }
    }
}

