//
//  TranslateViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/10/24.
//

import UIKit

class TranslateViewController: UIViewController {

	@IBOutlet var transTextField: UITextField!
	// 텍스트필드에서 엔터키 누르기: Did End On Exit
	// 텍스트필드에서 실시간 글자 감지: Editing Changed
	// 텍스트필드에서 커서가 시작되거나 끝날 때:
	@IBOutlet var transSearchBar: UISearchBar!
	@IBOutlet var transTextEditer: UITextView!
	@IBOutlet var resultTextView: UITextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// 프로토콜은 일급객체? 그거였나... 타입인가 그거 오늘 정리해서 올리기.
		// 타입으로서의 프로토콜
		transSearchBar.delegate = self
		transSearchBar.placeholder = "123"
		transTextEditer.delegate = self
		resultTextView.delegate = self

		transTextEditer.text = ""
		textViewDidEndEditing(transTextEditer)

		let dp = UIDatePicker()
		dp.preferredDatePickerStyle = .wheels
//		UIPickerView
		transTextField.inputView = dp
		transTextField.borderStyle = .none
		transTextField.tintColor = .clear
	}
}

extension TranslateViewController: UISearchBarDelegate, UITextViewDelegate, UITextFieldDelegate  {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		transTextEditer.text = "\(searchBar.text!)를 입력함"
	}

	func textViewDidChange(_ textView: UITextView) {
		transTextField.text = "\(transTextEditer.text!)"
	}

	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = "내용을 입력해주세요"
			textView.textColor = .lightGray
		}
	}

	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor == .lightGray {
			textView.textColor = .black
			textView.text = ""
		}
	}
}
