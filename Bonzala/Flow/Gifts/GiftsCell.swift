//
//  GiftsCell.swift
//  Bonzala

import Foundation
import UIKit
import SnapKit

class GiftCell: UITableViewCell {
    
    static let reuseId = String(describing: GiftCell.self)
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellowOne
        label.font = UIFont(name: "JosefinSans-Bold", size: 48)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "JosefinSans-Bold", size: 20)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private(set) lazy var giftImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private(set) lazy var giftDetailUseConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .greenOne
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 24 , bottom: 0, right: 24))
        }
    
    func setupUI(){

        contentView.addSubview(giftDetailUseConteiner)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .init(width: 0, height: 8)
        contentView.layer.shadowRadius = 14
        backgroundColor = .clear
        selectionStyle = .none
        
        [giftImage,titleLabel,scoreLabel].forEach(giftDetailUseConteiner.addSubview(_:))
        
    }
    
    func setupConstraints() {
        giftDetailUseConteiner.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.bottom.equalToSuperview()
        }
        
        giftImage.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(giftImage.snp.right).offset(12)
            make.centerY.equalToSuperview()
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-8)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        scoreLabel.text = nil
        titleLabel.text = nil
        giftImage.image = nil
    }
    
    func setupCell(item: GiftsModel) {
        scoreLabel.text = item.price
        titleLabel.text = item.title
        giftImage.image = UIImage(named: item.imageGifts)
    }
}
