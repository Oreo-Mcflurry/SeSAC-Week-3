//
//  ViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/5/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

	@IBOutlet var imageView: UIImageView!
	let url = URL(string: "https://static.wixstatic.com/media/4d892d_bb03cd23a68943a983020aa3c837be22~mv2.png/v1/fill/w_314,h_318,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/thumbnail.png")!

	override func viewWillAppear(_ animated: Bool) {
		print("main viewWillAppear")
		view.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
	}

	override func viewDidAppear(_ animated: Bool) {
		print("main viewDidAppear")
	}

	override func viewDidDisappear(_ animated: Bool) {
		print("main viewDidDisappear")
	}

	override func viewWillDisappear(_ animated: Bool) {
		print("main viewWilldisappar")
	}


	override func viewDidLoad() {
		print("main ViewDidLoad")
		super.viewDidLoad()
		imageView.kf.setImage(with: url,placeholder: UIImage(systemName: "star"))
	}
}

