//
//  TestTableTableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/5/24.
//

import UIKit

class TestTableTableViewController: UITableViewController {
	var movies: [Movie] = [
		Movie(title: "서울의 봄", isChecked: true),
		Movie(title: "괴물", isChecked: false),
		Movie(title: "안녕하세요", isChecked: false)
	]
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.rowHeight = 80
	}

	// 필수임
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		print(indexPath.row)
		return 100
	}

	// 필수임2
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? TableCellViewControllerTableViewCell

		cell?.contentLabel.text = "이건 귀찮아서 배열 안만듬"
		cell?.thumnailImage.image = UIImage(systemName: "star")
		cell?.titleLabel.text = movies[indexPath.row].title


		cell?.checkBixButton.tag = indexPath.row
		cell?.checkBixButton.setImage(UIImage(systemName: movies[indexPath.row].isChecked ? "star.fill" : "star"), for: .normal)
		cell?.checkBixButton.addTarget(self, action: #selector(tapButton(sender:)), for: .touchUpInside)
		return cell!
	}

	@IBAction func textFieldEditing(_ sender: UITextField) {
		movies.append(Movie(title: sender.text!, isChecked: false))
		sender.text = ""
		tableView.reloadData()

	}

	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			movies.remove(at: indexPath.row)
			tableView.reloadData()
		}
	}

	@objc func tapButton(sender: UIButton) {
		movies[sender.tag].isChecked.toggle()
		tableView.reloadData()
		tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
	}
}

struct Movie {
	var title: String
	var isChecked: Bool
}
