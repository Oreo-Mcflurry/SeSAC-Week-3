//
//  Case1TableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/6/24.
//

import UIKit

class Case1TableViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 2
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return section == 0 ? 4 : 1
	}
	@IBAction func tapSwitch(_ sender: UISwitch) {
		overrideUserInterfaceStyle = !sender.isOn ? .dark : .light
	}
	
}
