//
//  SplashView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct SplashView: View {
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
            .onAppear {
                withAnimation(.bouncy(duration: 0.5, extraBounce: 0.4)) {
                    self.size = 0.24
                }
            }
            .onAppear {
                // とりあえず時間経過で表示
                DispatchQueue.main.asyncAfter(deadline: .now()+1.2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
