//
//  InfoVC.swift
//  Bonzala


import Foundation
import UIKit

class InfoVC: UIViewController {
    
    private var contentView: InfoView {
        view as? InfoView ?? InfoView()
    }
    
    override func loadView() {
        view = InfoView()
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
