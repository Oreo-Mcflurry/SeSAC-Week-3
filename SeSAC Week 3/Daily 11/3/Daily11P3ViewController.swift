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
		cityCollectionView.register(UINib(nibName: "DailyP2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Daily11CellName.Daily11P2Cell.rawValue)
		setCellLayOut(16)
		setSegementedControl()
		setDelegate()
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return citys.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: Daily11CellName.Daily11P2Cell.rawValue, for: indexPath) as! DailyP2CollectionViewCell

		cell.designCell(data: citys[indexPath.item])
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let sb = UIStoryboard(name: "DetailView", bundle: nil)
		let vc = sb.instantiateViewController(withIdentifier: "DetailView") as! DetailViewController
		navigationController?.pushViewController(vc, animated: true)
		collectionView.reloadItems(at: [indexPath])
	}

	@IBAction func changeSegmentValue(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0: citys = CityInfo().city
		case 1: citys = CityInfo().city.filter({ $0.domestic_travel })
		case 2: citys = CityInfo().city.filter({ !$0.domestic_travel })
		default: print("이게 나올수가")
		}
		cityCollectionView.reloadData()
	}
}

enum SegementSelect: String, CaseIterable {
	case 모두
	case 국내
	case 해외
}

@objc protocol SetTableViewController {
	func setCellLayOut(_ padding: CGFloat)
	func setDelegate()
	@objc optional func setBackgrondColor()
	@objc optional func setSegementedControl()
}

extension Daily11P3ViewController: SetTableViewController {

	func setDelegate() {
		// MARK: - 다해놓고 까먹지 말기
		cityCollectionView.delegate = self
		cityCollectionView.dataSource = self
	}

	func setCellLayOut(_ padding: CGFloat) {
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - padding*3)/2, height: 300)
		layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
		layout.minimumLineSpacing = padding
		layout.minimumInteritemSpacing = padding
		cityCollectionView.collectionViewLayout = layout
	}
	
	func setSegementedControl() {
		citySegmentedControl.removeAllSegments()
		for (index, item) in SegementSelect.allCases.enumerated() {
			citySegmentedControl.insertSegment(withTitle: item.rawValue, at: index, animated: true)
		}
		citySegmentedControl.selectedSegmentIndex = 0
	}
}
