//
//  Extensions.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/6/18.
//

import Foundation
import SwiftUI

extension View {
    func mainButtonStyle() -> some View {
        buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
    }
    
    func roudedRectBackground(radius: CGFloat = 8,
                              fill: some ShapeStyle = .bg ) -> some View {
        background(RoundedRectangle(cornerRadius: radius).fill(fill))
    }
}

extension Animation {
    static let mySpring = Animation.spring(dampingFraction: 0.55)
    static let myEase = Animation.easeInOut(duration: 0.6)
}

extension ShapeStyle where Self == Color {
    static var bg: Color {  Color(.systemBackground) }
    static var bg2: Color { Color(.secondarySystemBackground) }
}

extension AnyTransition {
    static let delayInsertionOpacity = Self.asymmetric(
        insertion:.opacity.animation(.easeInOut(duration: 0.5).delay(0.2)),
        removal:.opacity.animation(.easeInOut(duration: 0.4))
    )
    
    static let moveUpWithOpacity = Self.move(edge: .top).combined(with: .opacity)
}
