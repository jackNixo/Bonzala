//
//  NewsView.swift
//  Bonzala



import Foundation
import UIKit

class NewsView: UIView {
    
    private(set) lazy var newsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: 20, right: 0)
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private(set) lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "backBtn"), for: .normal)
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
        backgroundColor = UIColor(named: "darkGreen")
        [newsTableView,backBtn].forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
        
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        newsTableView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            
        }
    }
}
