//
//  AnyLayout+.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/8/5.
//

import Foundation
import SwiftUI

extension AnyLayout
{
    static func userVStack(if condition: Bool, spacing: CGFloat, @ViewBuilder content: @escaping () -> some View) -> some View {
        let layout = condition ? AnyLayout(VStackLayout(spacing: spacing)) : AnyLayout(HStackLayout(spacing: spacing))
        return layout(content)
    }
}
