//
//  Keypad.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import SwiftUI

struct Keypad: View {
    
    private let keys: [String] = ["7", "8", "9", "4", "5", "6", "1", "2", "3", ".", "0", "-"]
    
    @Binding var input: Double
    @State private var inputString: String = "0"
    
    var body: some View {
        
        GeometryReader { geometry in
            GridStack(rows: Constants.keypadRows, columns: Constants.keypadColumns) { row, column in
                Button(action: {
                    let index = row * Constants.keypadColumns + column
                    self.handleKeyPressed(index)
                }) {
                    if (row * Constants.keypadColumns + column) == 11 {
                        Image(systemName: "delete.left.fill")
                            .foregroundColor(Color.textBody)
                            .background(Circle().foregroundColor(Color.buttonSecondary).frame(width: geometry.size.width / 6, height: geometry.size.width / 6))
                            .frame(
                                width: geometry.size.width / 3,
                                height: (geometry.size.height - Constants.keypadPadding) / 4
                            )
                            .onTapGesture {
                                self.handleKeyPressed(row * Constants.keypadColumns + column)
                            }
                            .onLongPressGesture {
                                self.clearExchange()
                            }
                    } else {
                        Text("\(self.keys[row * Constants.keypadColumns + column])")
                            .font(.system(
                                size: Constants.keyFontSize,
                                weight: .semibold,
                                design: .rounded)
                            )
                            .foregroundColor(Color.textBody)
                            .background(Circle().foregroundColor(Color.background).frame(width: geometry.size.width / 6, height: geometry.size.width / 6))
                            .frame(
                                width: geometry.size.width / 3,
                                height: (geometry.size.height - Constants.keypadPadding) / 4
                            )
                    }
                }
            }
        }
        
    }
    
}

extension Keypad {

    private func handleKeyPressed(_ keyIndex: Int) {
        let keyAsString = keyIndexAsString(keyIndex)
        if keyAsString == "BACKSPACE" {
            inputString = "0"
        } else if inputString == "0" {
            inputString = keyAsString
        } else {
            inputString += keyAsString
        }
        
        // When user taps "." if input without trailing zeros != input, do not add another "." to the string
        
        // print(inputString)
        input = Double(inputString) ?? input
    }

    private func clearExchange() {
        inputString = ""
        warningHaptic()
    }

    func warningHaptic() {
        UINotificationFeedbackGenerator().notificationOccurred(.warning)
    }

    private func keyIndexAsInt(_ index: Int) -> Decimal {
        switch index {
        case 0:
            return 7
        case 1:
            return 8
        case 2:
            return 9
        case 3:
            return 4
        case 4:
            return 5
        case 5:
            return 6
        case 6:
            return 1
        case 7:
            return 2
        case 8:
            return 3
        case 9:
            return -1
        case 10:
            return 0
        case 11:
            return -2
        default:
            return 0
        }
    }
    
    // could just use a map
    
    private func keyIndexAsString(_ index: Int) -> String {
        switch index {
        case 0:
            return "7"
        case 1:
            return "8"
        case 2:
            return "9"
        case 3:
            return "4"
        case 4:
            return "5"
        case 5:
            return "6"
        case 6:
            return "1"
        case 7:
            return "2"
        case 8:
            return "3"
        case 9:
            return "."
        case 10:
            return "0"
        case 11:
            return "BACKSPACE"
        default:
            return "0"
        }
    }

}

/*struct Keypad_Previews: PreviewProvider {
    static var previews: some View {
        Keypad(
            exchange: .constant(Exchange(
                primary: Currency(name: "NOK", fullName: "Norwegian Krone", continent: .Europe),
                secondary: Currency(name: "USD", fullName: "United States Dollar", continent: .NorthAmerica)
            ))
        )
    }
}*/
