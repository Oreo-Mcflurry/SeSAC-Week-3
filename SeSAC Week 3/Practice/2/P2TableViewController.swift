//
//  P2TableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import UIKit

class P2TableViewController: UITableViewController {
	let p2Content = ["ㅎㅇㅎ", "ㅇㄹㄱㄷ", "123123123"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		 return p2Content.count
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	  let cell = tableView.dequeueReusableCell(withIdentifier: "P2Cell", for: indexPath) as? P2TableViewCell

		guard let cell else { return UITableViewCell() }

		cell.p2Button.setTitle(p2Content[indexPath.row], for: .normal)

		return cell
	}
}
