//
//  ToastModifier.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//
import SwiftUI

struct ToastModifier<ToastContent: View>: ViewModifier {
    @Binding var toast: ToastData?
    let duration: TimeInterval
    let content: (ToastData) -> ToastContent
    @State private var isVisible = true
    @State private var task: Task<Void, Never>?
    
    func body(content view: Content) -> some View {
        ZStack {
            view
            if let toast = toast, isVisible {
                self.content(toast)
                    .padding()
                    .background(backgroundColor(for: toast.style))
                    .cornerRadius(12)
                    .shadow(radius: 6)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .zIndex(100)
                    .onAppear {
                        isVisible = true
                        startAutoHide()
                    }
            }
        }
        .animation(.spring(), value: isVisible)
    }
    
    private func startAutoHide() {
        task?.cancel()
        task = Task { @MainActor in
            try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
            isVisible = false
            try? await Task.sleep(nanoseconds: 300_000_000)
            toast = nil
        }
    }
    
    private func backgroundColor(for style: ToastStyle) -> Color {
        switch style {
        case .info: return Color.blue.opacity(0.8)
        case .success: return Color.green.opacity(0.8)
        case .error: return Color.red.opacity(0.8)
        }
    }
}

extension View {
    func toast<ToastContent: View>(
        item: Binding<ToastData?>,
        duration: TimeInterval = 10.0,
        @ViewBuilder content: @escaping (ToastData) -> ToastContent
    ) -> some View {
        modifier(ToastModifier(toast: item, duration: duration, content: content))
    }
}
