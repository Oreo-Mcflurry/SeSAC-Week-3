//
//  Case3TableViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import UIKit

class Case3TableViewCell: UITableViewCell {

	@IBOutlet var checkButton: UIButton!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var starButton: UIButton!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
	 }
	@IBAction func tapButton(_ sender: UIButton) {
		if sender == checkButton {
			let image = sender.currentImage == UIImage(systemName: "checkmark.square") ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
			sender.setImage(image, for: .normal)
		} else {
			let image = sender.currentImage == UIImage(systemName: "star") ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
			sender.setImage(image, for: .normal)
		}
	}
	
}
