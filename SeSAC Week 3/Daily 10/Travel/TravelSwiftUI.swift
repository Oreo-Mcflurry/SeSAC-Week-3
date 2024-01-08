//
//  TravelSwiftUI.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/8/24.
//

import SwiftUI
import Kingfisher

struct TravelSwiftUI: View {
	let magazines = MagazineInfo().magazine
	var body: some View {
		NavigationStack {
			ScrollView {
				headerLine
				ForEach(magazines, id: \.self) { item in
					TravelCell(magazine: item)
				}

			}

		}
		.navigationTitle("SeSAC TRAVEL")
		.navigationBarTitleDisplayMode(.inline)
	}

	private var headerLine: some View {
		Rectangle()
			.frame(height: 1)
			.foregroundStyle(.gray)
			.opacity(0.5)
	}
}

#Preview {
	NavigationStack {
		TravelSwiftUI()
	}
}

struct TravelCell: View {
	let magazine: Magazine
	var body: some View {
		VStack(alignment: .leading) {
			KFImage(URL(string: magazine.photo_image)!)
				.resizable()
				.clipShape(RoundedRectangle(cornerRadius: 15))
				.aspectRatio(1.0, contentMode: .fit)

			Text(magazine.title)
				.font(.title)
				.bold()
				.padding(.top, 8)

			Text(magazine.subtitle)
				.font(.callout)
				.foregroundStyle(.gray)

			Text(formatDate(magazine.date))
				.font(.footnote)
				.foregroundStyle(.gray)
				.frame(maxWidth: .infinity, alignment: .trailing)
		}
		.padding(.all, 20)
	}
}

extension View {
	func formatDate(_ dateString: String) -> String {
		let formatter = DateFormatter()
		let date = formatter.date(from: dateString) ?? Date()
		formatter.dateFormat = "yy년 MM월 dd일"
		formatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)!

		return formatter.string(from: date)
	}
}
