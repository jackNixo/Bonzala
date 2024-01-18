//
//  StartVC.swift
//  Bonzala

import UIKit
import SnapKit

class StartVC: UIViewController {
    
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to"
        label.textColor = UIColor.yellowOne
        label.font = UIFont.boldSystemFont(ofSize: 46)
        return label
    }()
    
    private lazy var bonzalaLabel: UILabel = {
        let label = UILabel()
        label.text = "Bonzala"
        label.textColor = UIColor.yellowOne
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    private lazy var bonzalaImageView: UIImageView = {
        let im = UIImageView(image: .centerHome)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        startAuth()
        
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.darkGreen
        view.addSubview(bonzalaLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(bonzalaImageView)
        
        
    }
    
    private func setupConstraints() {
        
        bonzalaLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bonzalaLabel.snp.top).offset(-50)
        }
        
        bonzalaImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bonzalaLabel.snp.bottom).offset(50)
        }
        
    }
    
    private func startAuth() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            let vc = HomeVC()
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true)
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
}
