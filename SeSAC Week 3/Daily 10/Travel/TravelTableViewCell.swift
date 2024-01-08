//
//  TravelTableViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/8/24.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

	@IBOutlet var titleImage: UIImageView!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var subTitleLabel: UILabel!
	@IBOutlet var dateLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
