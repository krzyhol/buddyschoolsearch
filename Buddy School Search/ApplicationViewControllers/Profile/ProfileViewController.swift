//
//  ProfileViewController.swift
//  Buddy School Search
//
//  Created by AppStarter on 12.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    @IBOutlet private weak var webView: UIWebView!
    
    var profileUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setWebViewContent()
    }
    
    private func setWebViewContent() {
        if let urlRequest = profileUrl {
            let request = URLRequest(url: urlRequest)
            webView.loadRequest(request)
            webView.backgroundColor = .white
        }
    }
}
