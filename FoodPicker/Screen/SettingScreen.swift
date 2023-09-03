//
//  SettingScreen.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/8/6.
//

import SwiftUI

struct SettingScreen: View {
    @AppStorage(.shouldUseDarkMode) private var shouldUseDarkMode: Bool = false
    @AppStorage(.unit) private var unit: Unit = .gram
    @AppStorage(.startTab) private var startTab: HomeScreen.Tab = .picker
    @State private var confirmationDialog: Dialog = .inactive
    private var shouldShowDialog: Binding<Bool> {
        Binding(
            get: { confirmationDialog != .inactive},
            set: { _ in confirmationDialog = .inactive}
        )

    }
    var body: some View {
        Form {
            Section("基本设定") {
                Toggle(isOn: $shouldUseDarkMode) {
                    Label("深色模式", systemImage: .moon)
                }
                
                Picker(selection: $unit) {
                    ForEach(Unit.allCases) { $0 }
                } label: {
                    Label("单位", systemImage: .unitSign)
                }
                
                Picker(selection: $startTab) {
                    Text("随机食物").tag(HomeScreen.Tab.picker)
                    Text("食物清单").tag(HomeScreen.Tab.list)
                } label: {
                    Label("启动画面", systemImage: .house)
                }
            }
            
            Section("危险区域") {
                ForEach(Dialog.allCases){ dialog in
                    Button(dialog.rawValue) { confirmationDialog = dialog }
                        .tint(Color(.label))
                }
            }
            .confirmationDialog(confirmationDialog.rawValue, isPresented: shouldShowDialog, titleVisibility: .visible) {
                Button("确定", role: .destructive, action: confirmationDialog.action)
                Button("取消", role: .cancel) { }
                } message: {
                    Text(confirmationDialog.message)
                }

        }
    }
}

private enum Dialog: String {
    case resetSettings = "重置设定"
    case resetFoodList = "重置食物记录"
    case inactive
    
    var message: String {
        switch self {
        case .resetSettings:
            return "将重置颜色、单位等设置,\n此操作无法复原,确定执行吗?"
        case .resetFoodList:
            return "将重置食物清单,\n此操作无法复原,确定执行吗?"
        case .inactive:
            return ""
        }
    }
    //actionsheet 确定点击
    func action() {
        switch self {
        case .resetSettings:
            let keys: [UserDefaults.Key] = [.shouldUseDarkMode, .unit, .startTab]
            for key in keys {
                UserDefaults.standard.removeObject(forKey: key.rawValue)
            }
        case .resetFoodList:
            UserDefaults.standard.removeObject(forKey: UserDefaults.Key.foodList.rawValue)
        case .inactive:
            return
        }
    }
}

extension Dialog: CaseIterable {
    static let allCases:[Dialog] = [.resetSettings, .resetFoodList]
}

extension Dialog: Identifiable {
    var id : Self { self}
}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
    }
}
