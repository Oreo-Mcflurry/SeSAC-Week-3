//
//  Daily11P1CollectionViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import UIKit

private let reuseIdentifier = "Daily11P1Cell"

enum Daily11CellName: String {
	case Daily11P1Cell
	case Daily11P2Cell
	case Daily11P3Cell
}

class Daily11P1CollectionViewController: UICollectionViewController {
	let citys = CityInfo().city

	override func viewDidLoad() {
		super.viewDidLoad()
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 16*3)/2, height: 300)
		layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
		layout.minimumLineSpacing = 16
		layout.minimumInteritemSpacing = 16
		collectionView.collectionViewLayout = layout
	}

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}


	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return citys.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Daily11P1CollectionViewCell

		cell.imageView.kf.setImage(with: URL(string: citys[indexPath.item].city_image)!)
		cell.imageView.contentMode = .scaleAspectFill
		cell.imageView.layer.cornerRadius = cell.imageView.frame.width/2
		
		cell.titleLabel.text = "\(citys[indexPath.item].city_name) | \(citys[indexPath.item].city_english_name)"
		cell.titleLabel.font = .boldSystemFont(ofSize: 18)
		cell.titleLabel.textAlignment = .center

		cell.subTitleLabel.text = citys[indexPath.item].city_explain
		cell.subTitleLabel.font = .systemFont(ofSize: 15)
		cell.subTitleLabel.textAlignment = .center
		cell.subTitleLabel.textColor = .systemGray3
		cell.subTitleLabel.numberOfLines = 0

		return cell
	}

}
