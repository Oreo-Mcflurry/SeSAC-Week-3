//
//  TodoTableTableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/5/24.
//

import UIKit

class TodoTableTableViewController: UITableViewController {
	let todo = [
		["1", "2"],
		["3", "4", "5", "9", "9", "9", "9", "9", "9", "9", "9", "9", "9", "9"],
		["6", "7", "8", "9", "9", "9", "9", "9", "9", "9", "9"],
		["10", "11", "9", "9", "9", "9", "9", "9", "9", "9", "9", "9", "9"]
	]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	// 셀 갯수 : numberOfRows
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print("numberOfRows")
		return todo[section].count
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return todo.count
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "\(section+1)번 섹션인듯"
	}

	// 셀 디자인 및 로직 처리 : cellForRowAt
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "default")!

		cell.textLabel?.text = todo[indexPath.section][indexPath.row]
		cell.textLabel?.textColor = indexPath.section == 0 ? .black : indexPath.row%2 == 0 ? .white : .green
		cell.backgroundColor = .brown
		print("cellForRowAt", indexPath, indexPath.item, indexPath.section)
		return cell
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		print("heightForRow")
//		tableView.ide
		return 80
	}
	// 테이블뷰 무조건 필요한 메서드
	// 셀 갯수
	// 셀 디자인 및 데이터 처리
	// 셀 높이 - 스토리보드를 아무리 땡겨도 설정안하면 기본 높이인 44로 고정됨.

}
