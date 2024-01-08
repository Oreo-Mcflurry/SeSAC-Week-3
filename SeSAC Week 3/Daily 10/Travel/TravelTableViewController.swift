//
//  TravelTableViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/8/24.
//

import UIKit

class TravelTableViewController: UITableViewController {

	@IBOutlet var headerSeparator: UIView!
	let magazines = MagazineInfo().magazine
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.separatorStyle = .none
		headerSeparator.layer.backgroundColor = UIColor.lightGray.cgColor
		headerSeparator.frame.size.height = 1
		headerSeparator.layer.opacity = 0.7
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
		 return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return magazines.count
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TravelCell", for: indexPath) as? TravelTableViewCell

		guard let cell else { return UITableViewCell() }
		
		cell.titleImage.kf.setImage(with: URL(string: magazines[indexPath.row].photo_image)!)
		cell.titleImage.contentMode = .scaleAspectFill
		cell.titleImage.layer.cornerRadius = 10

		cell.titleLabel.text = magazines[indexPath.row].title
		cell.titleLabel.font = .boldSystemFont(ofSize: 25)
		cell.titleLabel.numberOfLines = 2

		cell.subTitleLabel.text = magazines[indexPath.row].subtitle
		cell.subTitleLabel.textColor = .lightGray
		cell.subTitleLabel.font = .systemFont(ofSize: 15)

		cell.dateLabel.text = formatDate(magazines[indexPath.row].date)
		cell.dateLabel.textColor = .lightGray
		cell.dateLabel.font = .systemFont(ofSize: 13)

		return cell
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 500
	}
}

extension TravelTableViewController {
	func formatDate(_ dateString: String) -> String {
		let formatter = DateFormatter()
		let date = formatter.date(from: dateString) ?? Date()
		formatter.dateFormat = "yy년 MM월 dd일"
		formatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)!

		return formatter.string(from: date)
	}
}
