//
//  BonusCardVC.swift
//  Bonzala


import UIKit
import SnapKit

class BonusCardVC: UIViewController {
    
    
     var contentView: BonusCardView {
        view as? BonusCardView ?? BonusCardView()
    }
    
    override func loadView() {
        view = BonusCardView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.backBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
        
    }


    
}

