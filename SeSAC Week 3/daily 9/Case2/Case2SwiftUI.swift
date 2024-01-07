//
//  Case3SwiftUI.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/7/24.
//

import SwiftUI

struct Case2SwiftUI: View {
	let setting: [(String, [String])] = [
		("전체설정", ["공지사항", "실험실", "버전 정보"]),
		("개인설정", ["개인/보안", "알림", "채팅", "멀티프로필"]),
		("기타", ["고객센터/도움말"])
	]
	var body: some View {
		NavigationStack {
			List {
				ForEach(0..<setting.count, id: \.self) { index in
					Section {
						ForEach(setting[index].1, id: \.self) { item in
							Text(item)
						}
					} header: {
						Text(setting[index].0)
					}
				}
			}
			.listStyle(.plain)
		}
		.navigationTitle("설정")
		.navigationBarTitleDisplayMode(.inline)
	}
}

#Preview {
	NavigationStack {
		Case2SwiftUI()
	}
}
