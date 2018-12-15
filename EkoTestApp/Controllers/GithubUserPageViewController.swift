//
//  UserGithubViewController.swift
//  EkoTestApp
//
//  Created by Shayan Ali on 15/12/2018.
//  Copyright © 2018 Shayan Ali. All rights reserved.
//

import UIKit
import WebKit
class GitHubUserPageViewController: UIViewController, Storyboarded {
    // MARK: Outlets
    @IBOutlet weak private var githubWebView: WKWebView!
    
    // MARK: Properties
    var pageUrl = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: pageUrl) {
            githubWebView.navigationDelegate = self
            githubWebView.load(URLRequest(url: url))

        }
        else {
            self.showAlert(message: "invalid Url")
        }

    }

}

extension GitHubUserPageViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        self.showAlert(message: error.localizedDescription)
    }
}
