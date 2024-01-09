//
//  Daily11P3ViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import UIKit

class Daily11P3ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	var citys = CityInfo().city
	@IBOutlet var citySegmentedControl: UISegmentedControl!
	@IBOutlet var cityCollectionView: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// 2번째를 재사용.... 했습니다...
		cityCollectionView.register(UINib(nibName: "DailyP2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Daily11CellName.Daily11P2Cell.rawValue)

		// MARK: - 다해놓고 까먹지 말기
		cityCollectionView.delegate = self
		cityCollectionView.dataSource = self

		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 16*3)/2, height: 300)
		layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
		layout.minimumLineSpacing = 16
		layout.minimumInteritemSpacing = 16
		cityCollectionView.collectionViewLayout = layout
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return citys.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: Daily11CellName.Daily11P2Cell.rawValue, for: indexPath) as! DailyP2CollectionViewCell

		cell.designCell(data: citys[indexPath.item])
		return cell
	}
}
