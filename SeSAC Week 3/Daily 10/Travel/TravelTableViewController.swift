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
		cell.titleLabel.text = magazines[indexPath.row].title
		cell.subTitleLabel.text = magazines[indexPath.row].subtitle
		cell.dateLabel.text = formatDate(magazines[indexPath.row].date)
		return cell
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 500
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let sb = UIStoryboard(name: TravelWebViewController.identifier, bundle: nil)

		let vc = sb.instantiateViewController(withIdentifier: TravelWebViewController.identifier) as! TravelWebViewController
		vc.url = magazines[indexPath.row].link

		navigationController?.pushViewController(vc, animated: true)

	}
}

extension UITableViewController {
	func formatDate(_ dateString: String) -> String {
		let formatter = DateFormatter()
		let date = formatter.date(from: dateString) ?? Date()
		formatter.dateFormat = "yy년 MM월 dd일"
		return formatter.string(from: date)
	}
}

