//
//  NewsCell.swift
//  Bonzala


import Foundation
import UIKit
import SnapKit

class NewsCell: UITableViewCell {
    
    static let reuseId = String(describing: NewsCell.self)
    
    
    private(set) lazy var tittleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .greenOne
        label.font = UIFont(name: "JosefinSans-Bold", size: 28)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private(set) lazy var newsDetailUseConteiner: UIView = {
        let view = UIView()
        view.clipsToBounds = true
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
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 34, bottom: 0, right: 34))
        }
    
        func setupUI() {
            contentView.addSubview(newsDetailUseConteiner)
            contentView.backgroundColor = .clear
            contentView.layer.cornerRadius = 8
            contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
            contentView.layer.shadowOpacity = 1
            contentView.layer.shadowOffset = .init(width: 0, height: 8)
            contentView.layer.shadowRadius = 14
            backgroundColor = .clear
            selectionStyle = .none
            [tittleLabel,newsImage].forEach(newsDetailUseConteiner.addSubview(_:))
        }
        
        func setupConstraints() {
            
            newsDetailUseConteiner.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(20)
                make.left.right.bottom.equalToSuperview()
            }
            
            newsImage.snp.makeConstraints { make in
                make.left.right.top.equalToSuperview()
            }
            
            tittleLabel.snp.makeConstraints { make in
                make.top.equalTo(newsImage.snp.bottom)
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(48)
            }
        }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        tittleLabel.text = nil
        newsImage.image = nil
    }
    
    func setupCell(item: NewsModel) {
        tittleLabel.text = item.title
        newsImage.image = UIImage(named: item.imageNews)
    }
}
