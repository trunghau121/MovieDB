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
    // Tasks
    private(set) var tasks = Set<Task<Void, Never>>()
    
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
    
    // MARK: -Helper: No need state
    @MainActor
    @discardableResult
    func performAsyn<T>(
        operation: @escaping () async throws -> T,
        onLoading: @escaping (Bool) -> Void,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void
    ) -> Task<Void, Never> {
        let task = Task {
            onLoading(true)
            do {
                let value = try await operation()
                guard !Task.isCancelled else { return }
                onSuccess(value)
            } catch {
                if Task.isCancelled { return }
                onError(error)
            }
            onLoading(false)
        }
        tasks.insert(task)
        
        return task
    }
    
    // MARK: -Helper: run asyn usecase or API and return T
    @MainActor
    @discardableResult
    func performAsyn<T>(
        showLoading: Bool = true,
        operation: @escaping () async throws -> T,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void
    ) -> Task<Void, Never> {
        return performAsyn(
            operation: operation,
            onLoading: { loading in
                if showLoading && loading {
                    self.loadState = .loading
                }
            },
            onSuccess: { results in
                self.loadState = .success
                onSuccess(results)
            }, onError: { error in
                self.loadState = .error(error.localizedDescription)
                onError(error)
            }
        )
    }
    
    // MARK: -Helper: show toast when running asyn usecase or API and return T
    @MainActor
    @discardableResult
    func performAsyn<T>(
        showLoading: Bool = true,
        showErrorToast: Bool = true,
        operation: @escaping () async throws -> T,
        onSuccess: @escaping (T) -> Void
    ) -> Task<Void, Never> {
        return performAsyn(
            showLoading: showLoading,
            operation: operation,
            onSuccess: onSuccess,
            onError: { error in
                if showErrorToast {
                    self.showToast(message: error.getErrorMessage(), style: .error)
                }
            }
        )
    }
    
    // Cancel all tasks
    deinit {
        tasks.forEach { task in
            task.cancel()
        }
    }
    
}
