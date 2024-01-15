//
//  DailyP2CollectionViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import UIKit

class DailyP2CollectionViewCell: UICollectionViewCell {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var subTitleLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		imageView.contentMode = .scaleToFill

		titleLabel.textAlignment = .center
		titleLabel.font = .boldSystemFont(ofSize: 18)

		subTitleLabel.textAlignment = .center
		subTitleLabel.font = .systemFont(ofSize: 15)
		subTitleLabel.textColor = .systemGray3
		subTitleLabel.numberOfLines = 0
    }

	override func draw(_ rect: CGRect) {
		imageView.layer.cornerRadius = (imageView.frame.width)/2
	}
// 부
	func designCell(data: City, searchText: String) {
		var attributedString = AttributedString(data.city_name)
		let range = attributedString.range(of: searchText)
		if let range {
			attributedString.foregroundColor = .red
			titleLabel.text = "\(attributedString) | \(data.city_english_name)"
		} else {
			titleLabel.text = "\(data.city_name) | \(data.city_english_name)"
		}

		imageView.kf.setImage(with: URL(string: data.city_image)!)

		subTitleLabel.text = data.city_explain
	}

}
