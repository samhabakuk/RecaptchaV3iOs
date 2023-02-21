//
//  ViewController.swift
//  AnnnuaireInterne
//
//  Created by Melchisedeck Folloh MABIALA [SNT DST/DD/DASI/PMA] on 02/09/2022.
//

import UIKit
import WebKit //Ajouté

class ViewController: UIViewController {
    
    private var reCAPTCHAViewModel: ReCAPTCHAViewModel?
    private var vm: ReCAPTCHAViewModel!
    private var vc: ReCAPTCHAViewController!
    private var webView: WKWebView! //Ajouté
    private var currentToken = ""
    
    let viewModel = ReCAPTCHAViewModel(
        siteKey: "6LeUTakhAAAAAD7qDsrMSySky7YaUf4mKGEa8QcY",
        url: URL(string: "https://www.google.com/recaptcha/admin/site/565010968/settings")!
    )
    
    @IBOutlet weak var genererBtn: UIButton!
    
    private var usePush = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        self.vm = viewModel
        
        //launchWebView()
        
    }
    
    func launchWebView() {
        let webConfiguration = WKWebViewConfiguration()
        let contentController = WKUserContentController()

        contentController.add(viewModel, name: "recaptcha")
        webConfiguration.userContentController = contentController

        webView = WKWebView(frame: .zero, configuration: webConfiguration)

        webView.loadHTMLString(viewModel.html, baseURL: viewModel.url)
    }
    
    
    @IBAction func genererAction(_ sender: Any) {
        launchWebView()
       
    }
    
    
}

// MARK: - ReCAPTCHAViewModelDelegate
extension ViewController: ReCAPTCHAViewModelDelegate {
    func didSolveCAPTCHA(token: String) {
        print("fonction didSolveCAPTCHA")
        print("Token: \(token)")
        
    }
    
}

