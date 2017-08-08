//
//  SplashScreenViewController.swift
//  Buddy School Search
//
//  Created by AppStarter on 08.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import UIKit

final class SplashScreenViewController: UIViewController {

    private struct ViewConstants {
        static let backgroundColor: UIColor = .lightBlue
        static let duration = 1.0
        static let delay = 0.0
        static let startAlpha: CGFloat = 0.0
        static let middleAlpha: CGFloat = 0.5
        static let endAlpha: CGFloat = 1.0
        static let startScale = CGAffineTransform(scaleX: 4.0, y: 4.0)
        static let middleScale = CGAffineTransform(scaleX: 0.75, y: 0.75)
        static let endScale = CGAffineTransform(scaleX: 1.0, y: 1.0)
        static let segueIdentifier = "showSearchVC"
    }
    
    @IBOutlet private weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ViewConstants.backgroundColor
        animateLogo()
    }
    
    private func animateLogo() {
        changeLogoState(withAlpha: ViewConstants.startAlpha, andTransform: ViewConstants.startScale)
        
        UIView.animate(withDuration: ViewConstants.duration, delay: ViewConstants.delay, options: .curveEaseOut, animations: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.changeLogoState(withAlpha: ViewConstants.middleAlpha, andTransform: ViewConstants.middleScale)
        }) { finished in
            UIView.animate(withDuration: ViewConstants.duration, animations: { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.changeLogoState(withAlpha: ViewConstants.endAlpha, andTransform: ViewConstants.endScale)
            }) { [weak self] finished in
                guard let weakSelf = self else { return }
                weakSelf.performSegue(withIdentifier: ViewConstants.segueIdentifier, sender: nil)
            }
        }
    }
    
    private func changeLogoState(withAlpha alpha: CGFloat, andTransform transform: CGAffineTransform) {
        logoImageView.alpha = alpha
        logoImageView.transform = transform
    }
}
