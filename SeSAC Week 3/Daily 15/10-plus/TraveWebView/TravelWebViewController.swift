//
//  TravelWebViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/15/24.
//

import UIKit
import WebKit

class TravelWebViewController: UIViewController {

	var url = ""
	@IBOutlet weak var webView: WKWebView!
	override func viewDidLoad() {
		super.viewDidLoad()
		webView.load(URLRequest(url: URL(string: url)!))
	}
}
