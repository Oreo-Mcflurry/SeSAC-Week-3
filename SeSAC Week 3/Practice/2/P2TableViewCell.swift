//
//  P2TableViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import UIKit

class P2TableViewCell: UITableViewCell {

	@IBOutlet var p2Button: UIButton!
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

	@IBAction func tapButton(_ sender: UIButton) {
		print(sender.currentTitle ?? "안될리가")
	}
}
