//
//  P1CollectionViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import UIKit

class P1CollectionViewCell: UICollectionViewCell {

	@IBOutlet var imageCell: UIImageView!
	@IBOutlet var labelCell: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		labelCell.SetLabel()
		imageCell.setCornerRadius()
	}
	
}
