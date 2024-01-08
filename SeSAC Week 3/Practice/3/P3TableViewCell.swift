//
//  P3TableViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import UIKit

class P3TableViewCell: UITableViewCell {

	@IBOutlet var toggleSwitch: UISwitch!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	@IBAction func tapSwitch(_ sender: UISwitch) {
		sender.isOn.toggle()
	}

}
