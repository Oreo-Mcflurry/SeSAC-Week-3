//
//  UIViewController+Exteionsion.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/10/24.
//

import UIKit

extension UIViewController {
	func showAlert(withTitel title: String, withMessage message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

		let button = UIAlertAction(title: "OK?", style: .default)
		let button2 = UIAlertAction(title: "취소", style: .cancel)

		alert.addAction(button)
		alert.addAction(button2)

		present(alert, animated: true)
	}
}
