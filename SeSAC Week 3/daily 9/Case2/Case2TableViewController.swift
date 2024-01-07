//
//  Case2TableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/6/24.
//

import UIKit

class Case2TableViewController: UITableViewController {
	let menu = [
		["공지사항", "실험실", "버전 정보"],
		["개인/보안", "알림", "채팅", "멀티프로필"],
		["고객센터/도움말"]
	]
	let header = ["전체 설정", "개인 설정", "기타"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
		 return menu.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		 return menu[section].count
    }

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return header[section]
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: tableIdentifier.Case2Cell.rawValue, for: indexPath) as? Case2TableViewCell else {
				  return UITableViewCell()
			 }

		cell.titleLabel.text = menu[indexPath.section][indexPath.row]

		return cell
	}

}
