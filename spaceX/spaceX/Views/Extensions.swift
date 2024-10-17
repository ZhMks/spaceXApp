//
//  Extensions.swift
//  spaceX
//
//  Created by Максим Жуин on 11.10.2024.
//
import SwiftUI

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(1000.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
