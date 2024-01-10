//
//  LottoViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/10/24.
//

import UIKit

class LottoViewController: UIViewController, JackUIProtocol {
	override func viewDidLoad() {
		super.viewDidLoad()
		setNavigationTitle()
		setViewDesign()
		setLayout()
	}

	func setNavigationTitle() {
		navigationItem.title = "Title"
	}

	func setViewDesign() {
		view.backgroundColor = .red
	}

	func setLayout() {
		
	}
}
