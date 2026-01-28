//
//  TrailerVideoViewModel.swift
//  MovieDB
//
//  Created by 60156720 on 1/27/26.
//

import Foundation

@MainActor
class TrailerVideoViewModel: BaseViewModel {
    @Published var state: CollectionLoadingState<[Trailer]> = .loading(placeholder: Trailer.placeholder)
    private let repository = MovieRepositoryImp()
    private var trailerUseCase: TrailerUseCase
    
    override init() {
        self.trailerUseCase = TrailerUseCase(repository: repository)
    }
    
    func getTrailerVideos(movieId: Int) {
        performAsyn(
            operation: {
                try await self.trailerUseCase.execute(movieId: movieId, language: LocalizableManager.shared.currentLanguage.rawValue)
            },
            onLoading: { loading in
                if loading {
                    self.state = .loading(placeholder: Trailer.placeholder)
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
}
