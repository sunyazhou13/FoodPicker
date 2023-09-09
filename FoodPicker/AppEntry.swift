//
//  FoodPickerApp.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/4/16.
//

import SwiftUI

@main
struct AppEntry: App {
    init() {
        applyTabbarBackground()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
    
    func applyTabbarBackground() {
        let tabbarAppearence = UITabBarAppearance()
        tabbarAppearence.configureWithTransparentBackground()
        tabbarAppearence.backgroundColor = .secondarySystemBackground.withAlphaComponent(0.3)
        tabbarAppearence.backgroundEffect = UIBlurEffect(style: .systemChromeMaterial)
        UITabBar.appearance().scrollEdgeAppearance = tabbarAppearence
    }
}
