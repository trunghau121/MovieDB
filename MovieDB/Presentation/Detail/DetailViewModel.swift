//
//  DetailViewModel.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import Combine
import Foundation

@MainActor
class DetailViewModel: BaseViewModel<NoNavigationEvent> {
    @Published var state: CollectionLoadingState<Movie> = .loading(placeholder: .placeholder.first!)
    private let repository = MovieRepositoryImp()
    private var detailUseCase: DetailUseCase
    
    override init() {
        self.detailUseCase = DetailUseCase(repository: repository)
    }
    
    func getMovieDetail(movieId: Int) {
        performAsyn(
            operation: {
                try await self.repository.getDetail(movideId: movieId, language: LocalizableManager.shared.currentLanguage.rawValue)
            },
            onLoading: { loading in
                if loading {
                    self.state = .loading(placeholder: .placeholder.first!)
                }
            },
            onSuccess: { result in
                if let value: Movie = result {
                    self.state = .loaded(content: value)
                } else {
                    self.state = .empty
                }
            },
            onError: { error in
                self.state = .error(error)
            }
        )
    }
    
}
