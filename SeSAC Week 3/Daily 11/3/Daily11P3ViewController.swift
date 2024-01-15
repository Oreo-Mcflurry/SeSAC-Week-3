//
//  Daily11P3ViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import UIKit

class Daily11P3ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	var citys: [City] = CityInfo.city

	@IBOutlet var citySegmentedControl: UISegmentedControl!
	@IBOutlet var cityCollectionView: UICollectionView!
	@IBOutlet weak var searchBar: UISearchBar!
	
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

		cell.designCell(data: citys[indexPath.item], searchText: searchBar.text!)
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
		case 0: citys = CityInfo.city
		case 1: citys = CityInfo.city.filter({ $0.domestic_travel })
		case 2: citys = CityInfo.city.filter({ !$0.domestic_travel })
		default: print("이게 나올수가")
		}
		// 순환 참조가 일어난다.
//		searchBar(searchBar, textDidChange: searchBar.text ?? "")
		searchBar(searchBar, textDidChange: searchBar.text ?? "")
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

extension Daily11P3ViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		if !searchText.trimmingCharacters(in: [" "]).isEmpty {
			citys = citys.filter({
				$0.city_name.uppercased().contains(searchText.uppercased()) ||
				$0.city_english_name.uppercased().contains(searchText.uppercased()) ||
				$0.city_explain.uppercased().contains(searchText.uppercased())
			})
		} else {
//			changeSegmentValue(citySegmentedControl)
			switch citySegmentedControl.selectedSegmentIndex {
			case 0: citys = CityInfo.city
			case 1: citys = CityInfo.city.filter({ $0.domestic_travel })
			case 2: citys = CityInfo.city.filter({ !$0.domestic_travel })
			default: print("이게 나올수가")
			}
		}
		cityCollectionView.reloadData()
	}
}

extension Daily11P3ViewController: SetTableViewController {

	func setDelegate() {
		// MARK: - 다해놓고 까먹지 말기
		cityCollectionView.delegate = self
		cityCollectionView.dataSource = self
		searchBar.delegate = self
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

extension String {
	 func attributed(of searchString: String, key: NSAttributedString.Key, value: Any) -> NSMutableAttributedString {

		  // 문자열을 속성 문자열로 변환
		  let attributedString = NSMutableAttributedString(string: self)

		  // 문자열의 길이 확인
		  let length = self.count

		  var range = NSRange(location: 0, length: length)
		  var rangeArray = [NSRange]()

		  // 문자열에서 특정 문자열의 위치 찾기
		  while range.location != NSNotFound {
				range = (attributedString.string as NSString).range(of: searchString, options: .caseInsensitive, range: range)
				rangeArray.append(range)

				if range.location != NSNotFound {
					 range = NSRange(location: range.location + range.length, length: self.count - (range.location + range.length))
				}
		  }

		  // 찾은 범위의 문자열에 속성 추가
		  rangeArray.forEach {
				attributedString.addAttribute(key, value: value, range: $0)
		  }

		  return attributedString
	 }
}
