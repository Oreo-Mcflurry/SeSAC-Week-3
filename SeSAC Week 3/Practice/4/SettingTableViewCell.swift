//
//  SettingTableViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

	@IBOutlet var settingLabel: UILabel!
	override func awakeFromNib() {
		super.awakeFromNib()
//		settingLabel.textColor = .brown
//		settingLabel.textAlignment = .left
//		settingLabel.numberOfLines = 0
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	func configureCell(with text: String) {
		settingLabel.text = text
	}

}
