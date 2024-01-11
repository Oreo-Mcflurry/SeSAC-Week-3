//
//  DetailTableViewCell.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/11/24.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

	static let identifier = "DetailTableViewCell"
	@IBOutlet weak var heartButton: UIButton!
	@IBOutlet weak var travelImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var ratingLabel: UILabel!

	@IBOutlet var stars: [UIImageView]!
	

	override func awakeFromNib() {
		super.awakeFromNib()
		heartButton.setTitle("", for: .normal)
		titleLabel.font = .boldSystemFont(ofSize: 17)
		subtitleLabel.textColor = .systemGray2
		subtitleLabel.numberOfLines = 3
		subtitleLabel.font = .systemFont(ofSize: 14)
		ratingLabel.textColor = .systemGray4
		ratingLabel.font = .systemFont(ofSize: 14)
		travelImage.clipsToBounds = true
		travelImage.contentMode = .scaleAspectFill
		travelImage.setCornerRadius()
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	func setDetailViewCell(data: Travel) {
		travelImage.kf.setImage(with: URL(string: data.travel_image ?? "https://velog.velcdn.com/images/sehyunny/post/9a074eca-4274-4f46-8970-62b73fa5243e/image.png")!)
		heartButton.setImage(UIImage(systemName: data.like ?? false ? "heart" : "heart.fill"), for: .normal)
		heartButton.tintColor = .white

		titleLabel.text = data.title
		subtitleLabel.text = data.description

		for i in 0..<Int(floorf(data.grade ?? 0)) {
			stars[i].image = UIImage(systemName: "star.fill")
			stars[i].tintColor = .yellow
		}

		for i in Int(floorf(data.grade ?? 0))..<5 {
			stars[i].image = UIImage(systemName: "star.fill")
			stars[i].tintColor = .lightGray
		}

		ratingLabel.text = "(\(Int.random(in: 0...1000))) · 저장 \(data.save ?? 0)"
	}

}
