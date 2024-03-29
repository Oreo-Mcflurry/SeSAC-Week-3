//
//  P1CollectionViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import UIKit


class P1CollectionViewController: UICollectionViewController {
	let list = ["한식", "중식", "일식", "양식", "분식", "기타"]
	override func viewWillAppear(_ animated: Bool) {
		print("food viewWillAppear")
	}

	override func viewDidAppear(_ animated: Bool) {
		print("food viewDidAppear")
	}

	override func viewDidDisappear(_ animated: Bool) {
		print("food viewDidDisappear")
	}

	override func viewWillDisappear(_ animated: Bool) {
		print("food viewWilldisappar")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		print("food viewWilldisappar")
		collectionView.register(UINib(nibName: "P1CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "P1CollectionViewCell")
		// 주의: 인터페이스 빌더에서 cell estimated size를 none으로 할 것.
		collectionView.backgroundColor = .green
		let layout = UICollectionViewFlowLayout()
		let spacing: CGFloat = 24
		let cellWidth = (UIScreen.main.bounds.width-spacing*4)/3
		layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
		layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
		layout.minimumLineSpacing = spacing
		layout.minimumInteritemSpacing = spacing
		layout.scrollDirection = .horizontal
		collectionView.collectionViewLayout = layout
	}

	// 1. 셀 갯수
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 100
	}
	// 2. 셀 디자인 / 로직
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "P1CollectionViewCell", for: indexPath) as! P1CollectionViewCell

		cell.imageCell.backgroundColor = .red

		cell.imageCell.layer.cornerRadius = cell.imageCell.frame.width / 2
		cell.labelCell.text = "23"
		cell.backgroundColor = .brown
		return cell
	}
	// 3. 셀 너비와 높이


	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		showAlert(withTitel: list[indexPath.row], withMessage: "다음은 이거임 \(list[indexPath.row+1])")
	}

}
