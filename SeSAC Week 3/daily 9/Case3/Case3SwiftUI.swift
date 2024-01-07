//
//  Case3SwiftUI.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import SwiftUI

struct Case3SwiftUI: View {
	@State private var shopping: [ShoppingModel] = [
		ShoppingModel(isChecked: true, text: "그립톡 구매하기", isStared: false),
		ShoppingModel(isChecked: false, text: "사이다 구매", isStared: false),
		ShoppingModel(isChecked: false, text: "아이패드 케이스 최저가 알아보기", isStared: true),
		ShoppingModel(isChecked: false, text: "양말", isStared: false)
	]
	@State private var text: String = ""
	var body: some View {
		NavigationStack {
			ScrollView {
				textFieldView
				
				ForEach($shopping, id: \.self) { item in
					Case3SwiftUICell(shoping: item)
				}
			}
		}
		.navigationTitle("쇼핑")
		.navigationBarTitleDisplayMode(.inline)
	}

	private var textFieldView: some View {
		ZStack {
			TextField("무엇을 구매하실 건가요?", text: $text)
				.padding()
				.background(Color(uiColor: UIColor.lightGray))
				.clipShape(RoundedRectangle(cornerRadius: 10))

			Button("추가") {
				shopping.append(ShoppingModel(isChecked: false, text: text, isStared: false))
			}
			.padding(.all, 8)
			.background(Color(uiColor: UIColor.gray))
			.clipShape(RoundedRectangle(cornerRadius: 5))
			.frame(maxWidth: .infinity, alignment: .trailing)
			.padding(.trailing)
			.foregroundStyle(.black)
		}
		.padding()
	}
}

#Preview {
	NavigationStack {
		Case3SwiftUI()
	}
}

struct Case3SwiftUICell: View {
	@Binding var shoping: ShoppingModel
	var body: some View {
		HStack {
			Button {
				shoping.isChecked.toggle()
			} label: {
				Image(systemName: shoping.isChecked ? "checkmark.square.fill" : "checkmark.square")
					.foregroundStyle(.black)
			}

			Text(shoping.text)
				.padding(.leading, 10)

			Spacer()

			Button {
				shoping.isStared.toggle()
			} label: {
				Image(systemName: shoping.isStared ? "star.fill" : "star")
					.foregroundStyle(.black)
			}
		}
		.padding()
		.frame(maxWidth: .infinity)
		.background(Color(uiColor: UIColor.lightGray))
		.clipShape(RoundedRectangle(cornerRadius: 10))
		.padding(.horizontal)
	}
}
