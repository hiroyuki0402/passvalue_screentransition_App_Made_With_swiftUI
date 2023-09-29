//
//  SecondView.swift
//  passvalue_screentransition_App_swiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/09/29.
//

import SwiftUI

struct SecondView: View {

    @State private var firstValue: String = ""
    @State private var secondValue: String = ""
    @State private var selectedOperator: ArithmeticOperator = .addition
    @State private var result: Double = 0.0

    let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    var body: some View {
        VStack {
            VStack {
                /// スペーサ
                Spacer().frame(height: 50)

                /// 入力欄上段
                ZStack(alignment: .leading) {
                    if firstValue.isEmpty {
                        Text("数字を入れてください")
                            .padding(.leading)
                            .foregroundColor(Color.black.opacity(0.3))
                            .frame(height: 50)
                    }
                    TextField("", text: $firstValue)
                        .padding(.horizontal, 10)
                        .padding(.leading, 10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(Color.black)

                }
                .background(RoundedRectangle(cornerRadius: 10).stroke( Color.black))
                .padding(.horizontal, 20)

                /// 入力欄下段
                ZStack(alignment: .leading) {
                    if secondValue.isEmpty {
                        Text("数字を入れてください")
                            .padding(.leading)
                            .foregroundColor(Color.black.opacity(0.3))
                            .frame(height: 50)
                    }
                    TextField("", text: $secondValue)
                        .padding(.horizontal, 10)
                        .padding(.leading, 10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(Color.black)
                }
                .background(RoundedRectangle(cornerRadius: 10).stroke( Color.black))
                .padding(.horizontal, 20)

                /// セグメント
                Picker("四則演算", selection: $selectedOperator) {
                    Text("+").tag(ArithmeticOperator.addition)
                    Text("-").tag(ArithmeticOperator.subtraction)
                    Text("×").tag(ArithmeticOperator.multiplication)
                    Text("÷").tag(ArithmeticOperator.division)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                ///計算ボタン
                Button("計算") {
                    /// 値が入っていなければ0を渡し抜ける
                    guard let firstValue = Double(firstValue),
                          let secondValue = Double(secondValue) else {
                        result = 0.0
                        return
                    }

                    result = selectedOperator.performOperation(lhs: firstValue, rhs: secondValue)

                }
                .frame(width: 300, height: 50)
                .foregroundColor(.black)
                .bold()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                .padding(.all, 20)

                /// スペーサ
                Spacer()

            }
        }
    }
}

enum ArithmeticOperator {
    case addition
    case subtraction
    case multiplication
    case division

    func performOperation(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .addition:
            return lhs + rhs
        case .subtraction:
            return lhs - rhs
        case .multiplication:
            return lhs * rhs
        case .division:
            if rhs != 0 {
                return lhs / rhs
            } else {
                // ゼロ除算を防ぐためにエラー処理が必要です
                return 0
            }
        }
    }

    var symbol: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
}


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

