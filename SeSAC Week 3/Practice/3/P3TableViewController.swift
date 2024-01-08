//
//  P3TableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import UIKit

class P3TableViewController: UITableViewController {
	var toggles = [
		true,
		false,
		true,
		false
	]
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
		return toggles.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "P3Cell", for: indexPath) as? P3TableViewCell

		guard let cell else { return UITableViewCell() }

		cell.toggleSwitch.isOn = toggles[indexPath.item]
		return cell
	}

}
