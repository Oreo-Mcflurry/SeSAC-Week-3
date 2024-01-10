//
//  UIImageView+Extension.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/10/24.
//

import UIKit

extension UIImageView {
  static	let 이런거임 = "123"
	func setCornerRadius() {
		self.layer.cornerRadius = 20
		self.clipsToBounds = true
	}
}
