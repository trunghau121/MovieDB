//
//  BaseViewModel.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

import Foundation
import Combine

@MainActor
class BaseViewModel<NavEvent>: ObservableObject {
    // State for screen
    @Published var loadState: LoadState = .idle
    // Handle loading
    public var isLoading: Bool {
        if case .loading = loadState {
            return true
        }
        return false
    }
    // Toast current (SwiftUI can .sheet / .overlay based on this)
    @Published var toast: ToastData?
    // Navigation event (UI subscribe through .onReceive)
    let navigation = PassthroughSubject<NavEvent, Never>()
    
    // MARK: -Helper: show toast
    func showToast(message: String, style: ToastStyle = .info) {
        toast = ToastData(message: message, style: style)
    }
    
    // MARK: -Helper: send navigation event
    func navigate(_ event: NavEvent){
        navigation.send(event)
    }
    
    // MARK: -Helper: run asyn usecase or API and return T
    func performAsyn<T>(
        showLoading: Bool = true,
        operation: @escaping () async throws -> T,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        Task {
            if showLoading {
                loadState = .loading
            }
            do {
                let value = try await operation()
                loadState = .success
                onSuccess(value)
            } catch {
                loadState = .error(error.localizedDescription)
                onError(error)
            }
        }
    }
    
    // MARK: -Helper: show toast when running asyn usecase or API and return T
    func performAsyn<T>(
        showLoading: Bool = true,
        showErrorToast: Bool = true,
        operation: @escaping () async throws -> T,
        onSuccess: @escaping (T) -> Void
    ) {
        performAsyn(
            showLoading: showLoading,
            operation: operation,
            onSuccess: onSuccess,
            onError: { error in
                if showErrorToast {
                    self.showToast(message: error.localizedDescription, style: .error)
                }
            }
        )
    }
    
}
