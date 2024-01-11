//
//  AdsTableViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/11/24.
//

import UIKit

class AdsTableViewCell: UITableViewCell {
	
	static let identifier = "AdsTableViewCell"
	@IBOutlet weak var backGrondView: UIView!
	@IBOutlet weak var firstlaneLabel: UILabel!
	@IBOutlet weak var adLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		backGrondView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
		backGrondView.layer.cornerRadius = 10
		firstlaneLabel.font = .boldSystemFont(ofSize: 17)
		firstlaneLabel.numberOfLines = 0
		firstlaneLabel.textAlignment = .center
		adLabel.backgroundColor = .white
		adLabel.clipsToBounds = true
		adLabel.textAlignment = .center
		adLabel.text = "AD"
		adLabel.layer.cornerRadius = 3
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	func setadsString(_ first: String) {
		firstlaneLabel.text = first
	}
}
