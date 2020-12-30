//
//  SocialNetworking.swift
//  StudentTable
//
//  Created by Азат Киракосян on 28.11.2020.
//

import UIKit
import WebKit

// MARK: - SocialNetworking

final class SocialNetworking: UIViewController, WKUIDelegate {
    
    // MARK: - Public properties
    
    public var url = String()
    
    // MARK: - Private properties
    
    private var webView = WKWebView()
    
    // MARK: - Override methods
    
    override func loadView() {
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let myURL = URL(string: url) else { return }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
}
