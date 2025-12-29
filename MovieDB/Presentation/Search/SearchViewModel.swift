//
//  SearchViewModel.swift
//  MovieDB
//
//  Created by 60156720 on 12/29/25.
//

import Foundation
import SwiftUICore
import Combine

class SearchViewModel: BaseViewModel<HomeNavigationEvent> {
    @Published var state: CollectionLoadingState<[Movie]> = .loading(placeholder: [])
    private let repository = MovieRepositoryImp()
    private var searchUseCase: SearchUseCase
    @Published var query: String = ""
    private var subscriptions = Set<AnyCancellable>()
    
    override init() {
        Logger.log("SearchViewModel init")
        self.searchUseCase = SearchUseCase(repository: repository)
        super.init()
        $query
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .sink(receiveValue: {
                [weak self] query in
                if !query.isEmpty {
                    self?.didSearch(query: query)
                }
            })
            .store(in: &subscriptions)
    }
    
    func didSearch(query: String) {
        performAsyn(
            operation: {
                try await self.searchUseCase.execute(query: query, language: LocalizableManager.shared.currentLanguage.rawValue)
            },
            onLoading: { loading in
                if loading {
                    self.state = .loading(placeholder: Movie.placeholder)
                }
            },
            onSuccess: { result in
                if result.isEmpty {
                    self.state = .empty
                } else {
                    self.state = .loaded(content: result)
                }
            },
            onError: { error in
                self.state = .error(error)
            }
        )
    }
    
    func didSelect(_ movieId: Int) {
        navigate(.openDetail(movieId: movieId))
    }
    
    deinit {
        subscriptions.removeAll()
    }
}
