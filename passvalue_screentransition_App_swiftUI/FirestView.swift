//
//  FirestView.swift
//  passvalue_screentransition_App_swiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/09/29.
//

import SwiftUI

struct FirestView: View {

    let result: Int

    var body: some View {
        Text(String(result))
            .font(.system(size: 50, weight: .bold))
    }
}

struct FirestView_Previews: PreviewProvider {
    static var previews: some View {
        FirestView(result: 50) // 仮の計算結果を渡してプレビュー
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
