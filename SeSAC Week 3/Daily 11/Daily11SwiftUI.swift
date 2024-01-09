//
//  Daily11SwiftUI.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/9/24.
//

import SwiftUI
import Kingfisher

struct Daily11SwiftUI: View {
	@State private var citys = CityInfo().city
	@State private var selectedSegment: SegementSelect = .모두
	var body: some View {
		NavigationStack {
			ScrollView {
				segmentedControl
					.padding(.horizontal)
				citysView
			}
		}
		.navigationTitle("인기도시 SwiftUI")
		.navigationBarTitleDisplayMode(.inline)
		.onChange(of: selectedSegment) { _, newValue in
			switch newValue {
			case .모두: citys = CityInfo().city
			case .국내: citys = CityInfo().city.filter({ $0.domestic_travel })
			case .해외: citys = CityInfo().city.filter({ !$0.domestic_travel })
			}
		}
	}

	private var segmentedControl: some View {
		Picker("", selection: $selectedSegment) {
			ForEach(SegementSelect.allCases, id:\.self) { item in
				Text(item.rawValue)
			}
		}
		.pickerStyle(.segmented)
	}

	@ViewBuilder
	private var citysView: some View {
		let columns = [
			GridItem(.flexible()),
			GridItem(.flexible())
		]
		LazyVGrid(columns: columns, content: {
			ForEach(citys, id: \.self) { item in
				CityCell(data: item)
					.padding()
			}
		})
	}

}

#Preview {
	NavigationStack {
		Daily11SwiftUI()
	}
}

struct CityCell: View {
	let data: City
	var body: some View {
		VStack {
			KFImage(URL(string: data.city_image)!)
				.resizable()
				.aspectRatio(1.0, contentMode: .fill)
				.clipShape(Circle())

			Text("\(data.city_name) | \(data.city_english_name)")
				.bold()

			Text("\(data.city_explain)\n")
				.font(.footnote)
				.foregroundStyle(.gray)
				.opacity(0.7)
				.multilineTextAlignment(.center)
				.lineLimit(2)
		}
	}
}
