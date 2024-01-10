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
		titleImage.contentMode = .scaleAspectFill
		titleImage.layer.cornerRadius = 10

		titleLabel.font = .boldSystemFont(ofSize: 25)
		titleLabel.numberOfLines = 2

		subTitleLabel.textColor = .lightGray
		subTitleLabel.font = .systemFont(ofSize: 15)

		dateLabel.textColor = .lightGray
		dateLabel.font = .systemFont(ofSize: 13)
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
