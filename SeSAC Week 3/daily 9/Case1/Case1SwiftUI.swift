//
//  Case1SwiftUI.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/6/24.
//

import SwiftUI
// 한동안 유킷만 하다보니까 스유 다 까먹은거 같아서 한동한 과제를 똑같은 뷰를 유킷/스유 두개씩 그리겠습니다. 한달전의 제가 더 스유를 잘하는거같아요...ㅋㅋㅋㅋ
struct Case1SwiftUI: View {
	var body: some View {
		NavigationStack {
			List {
				Section {
					NavigationLink {

					} label: {
						Image(systemName: "moon.fill")
							.foregroundStyle(.purple)
						Text("방해 금지 모드")
						Text("켬")
							.frame(maxWidth: .infinity, alignment: .trailing)
							.font(.caption)
					}

					NavigationLink {

					} label: {
						Image(systemName: "star")
							.foregroundStyle(.yellow)
						Text("수면")
					}

					NavigationLink {

					} label: {
						Image(systemName: "iphone.gen3")
							.foregroundStyle(.green)
							.font(.title2)
						VStack(alignment: .leading) {
							Text("업무")
							Text("09:00 ~ 06:00")
								.font(.caption2)
						}
					}

					NavigationLink {

					} label: {
						Image(systemName: "person.fill")
							.foregroundStyle(.blue)
						Text("개인 시간")
						Text("설정")
							.frame(maxWidth: .infinity, alignment: .trailing)
							.font(.caption)
					}

				} header: {
					Text("헤더부터")
				} footer: {
					Text("푸터까지 다 사랑스러워")
				}

				Section {
					NavigationLink {

					} label: {
						Toggle(isOn: .constant(true)) {
							Text("모든 기기에서 공유")
						}
					}
				} footer: {
					Text("이 기기에서 집중 모드를 켜면 사용자의 다른 기기에서도 집중 모드가 켜집니다.")
				}
			}
			.navigationTitle("모드 설정")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

#Preview {
	Case1SwiftUI()
}
