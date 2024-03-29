//
//  GiftsVC.swift
//  Bonzala


import Foundation
import UIKit


class GiftVC: UIViewController {
    
    var items = [GiftsModel]()
    
    private var contentView: GiftView {
        view as? GiftView ?? GiftView()
    }
    
    let service = ServiceData.shared
    
    override func loadView() {
        view = GiftView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.giftTableView.dataSource = self
        contentView.giftTableView.delegate = self
        loadModel()
        setupBackButton()
    }
    
    func setupBackButton() {
        contentView.backBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func loadModel() {
        service.readFromGiftsData{ [weak self] models in
            guard let self = self else { return }
            self.items = models
            self.contentView.giftTableView.reloadData()
        } errorComletion: { error in
            print("Error")
        }
    }
    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
        
    }
}

extension GiftVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GiftCell.reuseId, for: indexPath)
        
        guard let giftCell = cell as? GiftCell else {
            return cell
        }
        
        let item = items[indexPath.row]
        
        giftCell.setupCell(item: item)
        
        return giftCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        
        let giftDetailVC = GiftDetailVC(model: item, uuid: item.id)
        
        giftDetailVC.model = item
        
        navigationController?.pushViewController(giftDetailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 60))
            headerView.backgroundColor = .clear
          
            let titleLabel = UILabel()
            titleLabel.text = "Gifts"
            titleLabel.font = UIFont(name: "JosefinSans-Bold", size: 48)
            titleLabel.textAlignment = .center
            titleLabel.textColor = .yellowOne
            titleLabel.frame = headerView.bounds
            
            headerView.addSubview(titleLabel)
            
            return headerView
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 60.0
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Gifts"
        }
}

