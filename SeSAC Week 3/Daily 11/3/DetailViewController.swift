//
//  DetailViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/11/24.
//

import UIKit

class DetailViewController: UIViewController {
	let datas = TravelInfo().travel
	@IBOutlet weak var detailTableVIew: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "도시 상세 정보"
		registerCells()
		setDelegate()
		detailTableVIew.rowHeight = UITableView.automaticDimension
	}

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return datas.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if !datas[indexPath.row].ad {
			let detailCell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
			detailCell.setDetailViewCell(data: datas[indexPath.row])
			return detailCell
		} else {
			let adCell = tableView.dequeueReusableCell(withIdentifier: AdsTableViewCell.identifier, for: indexPath) as! AdsTableViewCell
			adCell.setadsString(datas[indexPath.row].title)
			adCell.separatorInset = UIEdgeInsets(top: -10, left: 30, bottom: -10, right: 30)
			return adCell
		}
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if !datas[indexPath.row].ad {
			let vc = storyboard?.instantiateViewController(withIdentifier: "DetailSelectView") as! DetailSelectViewController
			navigationController?.pushViewController(vc, animated: true)
		} else {
			let vc = storyboard?.instantiateViewController(withIdentifier: "AdsSelectView") as! AdsSelectViewController
			let nav = UINavigationController(rootViewController: vc)
			nav.modalPresentationStyle = .fullScreen
			present(nav, animated: true)
		}
		tableView.reloadRows(at: [indexPath], with: .none)
	}

	func setDelegate() {
		detailTableVIew.delegate = self
		detailTableVIew.dataSource = self
	}
}

extension DetailViewController: SetTableViewCell {
	func registerCells() {
		detailTableVIew.register(UINib(nibName: DetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DetailTableViewCell.identifier)
		detailTableVIew.register(UINib(nibName: AdsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AdsTableViewCell.identifier)
	}
}


protocol SetTableViewCell {
	func registerCells()
}
