//
//  TestTableTableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/5/24.
//

import UIKit

class TestTableTableViewController: UITableViewController {
	var list = ["서울의 봄", "괴물", "부산팽"]

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return list.count
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? TableCellViewControllerTableViewCell

		cell?.contentLabel.text = "이건 귀찮아서 배열 안만듬"
 		cell?.thumnailImage.image = UIImage(systemName: "star")
		cell?.titleLabel.text = list[indexPath.row]

		return cell!
	}

	@IBAction func textFieldEditing(_ sender: UITextField) {
		list.append(sender.text!)
		print(list)
		sender.text = ""
		tableView.reloadData()
	}

	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			list.remove(at: indexPath.row)
			tableView.reloadData()
		}
	}
}
