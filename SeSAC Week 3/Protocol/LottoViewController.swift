//
//  LottoViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/10/24.
//

import UIKit

class LottoViewController: UIViewController {

	@IBOutlet weak var numberTextField: UITextField!
	@IBOutlet weak var resultLabel: UILabel!
	
	var lottoPickerView = UIPickerView()
	let numberList: [Int] = Array(1...1025).reversed()
	override func viewDidLoad() {
		super.viewDidLoad()
		numberTextField.tintColor = .clear
		numberTextField.inputView = lottoPickerView
		// alpha, opacity가 0이면 클릭이 되지 않는다?
		numberTextField.alpha = 0.1
		resultLabel.text = "클릭하여 회차를 선택해주세여"

		lottoPickerView.delegate = self
		lottoPickerView.dataSource = self
	}

	@IBAction func endEdit(_ sender: Any) {
		view.endEditing(true)
	}
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return numberList.count
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		resultLabel.text = "\(numberList[row])회차"
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return "\(numberList[row])회차"
	}

}
