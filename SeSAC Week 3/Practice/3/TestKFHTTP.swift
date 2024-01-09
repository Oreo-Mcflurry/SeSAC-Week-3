//
//  TestKFHTTP.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/8/24.
//

import SwiftUI
import Kingfisher

struct TestKFHTTP: View {
    var body: some View {
        KFImage(URL(string: "http://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2023/06/15/d59a594c-0a57-4356-8e48-a46ae6e9b17b.jpg")!)
			 .resizable()
			 .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    TestKFHTTP()
}
