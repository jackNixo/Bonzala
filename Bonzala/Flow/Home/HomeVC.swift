//
//  HomeVC.swift
//  Bonzala
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    var view1Tapped = false
    
    private var contentView: HomeView {
        view as? HomeView ?? HomeView()
    }
    
    override func loadView() {
        view = HomeView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLaunch()
        setupButtonView()
    }
    
    private func firstLaunch() {
        let isFirstLaunch = UserDefaults.isFirstLaunch()
        if isFirstLaunch {
            let vc = StartBonusVC()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    private func setupButtonView() {
        
        let tapGiftsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTappedGift))
        contentView.giftBtn.addGestureRecognizer(tapGiftsGestureRecognizer)
        let tapNewsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTappedNews))
        contentView.newsBtn.addGestureRecognizer(tapNewsGestureRecognizer)
        let tapInfoGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTappedInfo))
        contentView.infoBtn.addGestureRecognizer(tapInfoGestureRecognizer)
        let tapCardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTappedBonusCard))
        contentView.cardBtn.addGestureRecognizer(tapCardGestureRecognizer)
    }
    
    @objc func buttonTappedGift() {
        let giftVC = GiftVC()
        navigationController?.pushViewController(giftVC, animated: true)
    }

    @objc func buttonTappedNews() {
        let newsVC = NewsVC()
        navigationController?.pushViewController(newsVC, animated: true)
    }
    
    @objc func buttonTappedInfo() {
        let infoVC = InfoVC()
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
    @objc func buttonTappedBonusCard() {
        let bonusCardVC = BonusCardVC()
        navigationController?.pushViewController(bonusCardVC, animated: true)
        let qrCodeString = UUID().uuidString
        if let qrCodeImage = generateQRCode(from: qrCodeString, size: CGSize(width: 240, height: 240)) {
            bonusCardVC.contentView.qrCodeImageView.image = qrCodeImage
        }
    }
    
    private func generateQRCode(from string: String, size: CGSize) -> UIImage? {
        if let data = string.data(using: .utf8), let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
            qrFilter.setValue(data, forKey: "inputMessage")

            if let qrImage = qrFilter.outputImage {
                let extent = qrImage.extent
                let scaleX = size.width / extent.size.width
                let scaleY = size.height / extent.size.height
                let transformedImage = qrImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))

                let filter = CIFilter(name: "CIFalseColor")
                filter?.setValue(transformedImage, forKey: kCIInputImageKey)
                filter?.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor0") // Цвет фона
                filter?.setValue(CIColor(red: 0/255, green: 35/255, blue: 29/255), forKey: "inputColor1") //  Цвет QR-кода

                if let outputImage = filter?.outputImage,
                   let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }

        return nil
    }

}


