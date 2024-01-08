//
//  P1TableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import UIKit

class P1TableViewController: UITableViewController {
	let content: [String] = ["123", "234", "456"]
	override func viewDidLoad() {
		super.viewDidLoad()

	}

	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return content.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "P1Cell", for: indexPath) as? P1TableViewCell
		guard let cell else { return UITableViewCell() }

		cell.p1Label.text = content[indexPath.row]
		return cell
	}


}
