//
//  SplashView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct SplashView: View {
    @Environment(\.modelContext) private var context
    @State private var isActive: Bool = false
    @State private var size = 0.1

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Image("Back")
                    .resizable()
                    .ignoresSafeArea(.all)
                Image("AppIcon")
                    .scaleEffect(size)
            }
            .task {
                withAnimation(.bouncy(duration: 0.5, extraBounce: 0.4)) {
                    size = 0.24
                }

                async let timer = Task.sleep(for: .seconds(1.2))

                do {
                    try ModelContainer.setupInitialData(for: context)
                } catch {
                    print("初期データの設定に失敗しました: \(error)")
                }

                try? await timer

                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
        .modelContainer(.preview)
}
