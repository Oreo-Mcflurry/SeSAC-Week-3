//
//  SettingTableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import UIKit

/*
 Dynamic height
 1. 오토레이아웃 설정
 2. Label numberOfLines = 0으로 설정
 3. automaticDimension
 */

/*
 UiViewController + CollectionView
 1. 아울렛 연결 필요
	- 그냥 컬렉션뷰 컨트롤러 같은건 유일무이해서 애플이 알아서 지어줬었음. 이제는 2개 이상 사용가능하기에 이름을 지워줘야함
 2. Delegate와 Data Sorurce
	- 프로토콜을 선언했으므로 필요한 메서드 2개가 등장하게됨.
 3. XIB Register
	- 컬렉션뷰에 어떤 셀을 쓸지 viewDidLoad에서 등록하는 과정이 필요함.
 4. 컬렉션뷰와 부하직원들을 연결함.
 5. 컬렉션뷰 레이아웃 구현
 */

class SettingTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {

	// MARK: - 1번
	@IBOutlet var foodCollectionView: UICollectionView!

	// MARK: - 2번
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "P1CollectionViewCell", for: indexPath) as! P1CollectionViewCell

		cell.imageCell.backgroundColor = .red
		cell.labelCell.text = "23"
		cell.backgroundColor = .brown
		return cell
	}

	override func viewWillAppear(_ animated: Bool) {
		print("1 viewWillAppear")
	}

	override func viewDidAppear(_ animated: Bool) {
		print("1 viewDidAppear")
	}

	override func viewDidDisappear(_ animated: Bool) {
		print("1 viewDidDisappear")
	}

	override func viewWillDisappear(_ animated: Bool) {
		print(" 1 viewWilldisappar")
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		print("1 viewDidLoad")
		// MARK: - 3번
		foodCollectionView.register(UINib(nibName: "P1CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "P1CollectionViewCell")

		// MARK: - 4번
		foodCollectionView.dataSource = self
		foodCollectionView.delegate = self

		// MARK: - 5번
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 80, height: 80)
		layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		layout.scrollDirection = .horizontal
		foodCollectionView.collectionViewLayout = layout


		tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
		tableView.rowHeight = UITableView.automaticDimension
	}

	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return SettingOption.allCases.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell

		guard let cell else { return UITableViewCell() }

		cell.configureCell(with: SettingOption.allCases[indexPath.row].rawValue) 
		cell.settingLabel.numberOfLines = 0
		return cell

	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		showAlert(withTitel: "dfsdf", withMessage: "adf")
	}
}

enum SettingOption: String, CaseIterable {
	case notice = "공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항"
	case version = "버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보버전정보"
	case help = "고객센터/도움말"
	case qna = "Q/A"
}

enum CellKind: String {
	case SettingTableViewCell
}
