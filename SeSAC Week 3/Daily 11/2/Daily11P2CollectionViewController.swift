//
//  Daily11P2CollectionViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import UIKit

private let reuseIdentifier = Daily11CellName.Daily11P2Cell.rawValue

class Daily11P2CollectionViewController: UICollectionViewController {
	let citys = CityInfo.city
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.register(UINib(nibName: "DailyP2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
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
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DailyP2CollectionViewCell
		cell.designCell(data: citys[indexPath.item], searchText: "")
		return cell
	}
}
