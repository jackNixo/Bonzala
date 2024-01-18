//
//  StartBonusVC.swift
//  Bonzala

import Foundation
import UIKit

class StartBonusVC: UIViewController {
    
    var uD: UD = .shared
    
    var balanse: Int {
        get {
            return uD.balance
        }
        set {
            uD.balance = newValue
        }
    }
    
    private var contentView: StartBonusView {
        view as? StartBonusView ?? StartBonusView()
    }
    
    override func loadView() {
        view = StartBonusView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.thankButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped() {
        balanse += 100
        Settings.points = balanse
        dismiss(animated: true)

    }
    
}
