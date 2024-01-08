//
//  P1TableViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import UIKit

class P1TableViewCell: UITableViewCell {

	@IBOutlet var p1Label: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
