//
//  Case2TableViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/6/24.
//

import UIKit

class Case2TableViewCell: UITableViewCell {

	@IBOutlet var titleLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UITableViewController {
	enum tableIdentifier: String {
		case Case2Cell
	}
}
