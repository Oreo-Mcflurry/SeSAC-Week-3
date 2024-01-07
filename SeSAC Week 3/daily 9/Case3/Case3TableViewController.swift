//
//  Case3TableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import UIKit

class Case3TableViewController: UITableViewController {

	@IBOutlet var textField: UITextField!
	@IBOutlet var addButton: UIButton!
	var shopping: [ShoppingModel] = [
		ShoppingModel(isChecked: true, text: "그립톡 구매하기", isStared: true)
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		addButton.layer.cornerRadius = 10

	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return shopping.count
	}

	// Cell에 선언된 버튼을 눌렀을때 컨트롤러에 있는 데이터에 어떻게 접근하는지 감이 안와요.
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Case3Cell", for: indexPath) as! Case3TableViewCell?
		guard let cell else { return UITableViewCell() }
		cell.backgroundColor = .systemGray6
		cell.titleLabel.text = shopping[indexPath.row].text
		cell.checkButton.setImage(shopping[indexPath.row].isChecked ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square"), for: .normal)
		cell.checkButton.tintColor = .black
		cell.starButton.setImage(shopping[indexPath.row].isStared ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
		cell.starButton.tintColor = .black
		return cell
	}

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			shopping.remove(at: indexPath.row)
			tableView.reloadData()
		}
	}

	@IBAction func tapAddButton(_ sender: UIButton) {
		shopping.append(ShoppingModel(isChecked: false, text: textField.text!, isStared: false))
		tableView.reloadData()
	}

}

struct ShoppingModel: Hashable {
	var isChecked: Bool
	var text: String
	var isStared: Bool
}
