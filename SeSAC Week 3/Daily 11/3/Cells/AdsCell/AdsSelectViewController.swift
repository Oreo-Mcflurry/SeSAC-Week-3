//
//  AdsSelectViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/11/24.
//

import UIKit
import WebKit

class AdsSelectViewController: UIViewController {

	@IBOutlet weak var webView: WKWebView!
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "광고인듯"
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "돌아가기", style: .done, target: self, action: #selector(dismissModal))
		if let url = URL(string: "https://velog.io/@yuiop1029/posts") {
			webView.load(URLRequest(url: url))
		}
	}

	@objc func dismissModal() {
		dismiss(animated: true)
	}
}
