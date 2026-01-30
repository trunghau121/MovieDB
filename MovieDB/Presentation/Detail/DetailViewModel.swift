//
//  DetailViewModel.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import Combine
import Foundation

@MainActor
class DetailViewModel: BaseViewModel {
    @Published var state: CollectionLoadingState<Movie> = .loading(placeholder: Movie.placeholder.first!)
    @Published var castState: CollectionLoadingState<[Cast]> = .loading(placeholder: Cast.placeholder)
    @Published var photoState: CollectionLoadingState<[Photo]> = .loading(placeholder: Photo.placeholder)
    private let repository = MovieRepositoryImp()
    private var detailUseCase: DetailUseCase
    private var castUseCase: CastUseCase
    private var photoUseCase: PhotoUseCase
    
    override init() {
        self.detailUseCase = DetailUseCase(repository: repository)
        self.castUseCase = CastUseCase(repository: repository)
        self.photoUseCase = PhotoUseCase(repository: repository)
    }
    
    func getMovieDetail(movieId: Int) {
        performAsyn(
            operation: {
                try await self.detailUseCase.execute(movieId: movieId, language: LocalizableManager.shared.currentLanguage.rawValue)
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
    
    func getCastCrew(movieId: Int) {
        performAsyn(
            operation: {
                try await self.castUseCase.execute(movieId: movieId, language: LocalizableManager.shared.currentLanguage.rawValue)
            },
            onLoading: { loading in
                if loading {
                    self.castState = .loading(placeholder: Cast.placeholder)
                }
            },
            onSuccess: { result in
                if result.isEmpty {
                    self.castState = .empty
                } else {
                    self.castState = .loaded(content: result)
                }
            },
            onError: { error in
                self.castState = .error(error)
            }
        )
    }
    
    func getPhotos(movieId: Int) {
        performAsyn(
            operation: {
                try await self.photoUseCase.execute(movieId: movieId, language: LocalizableManager.shared.currentLanguage.rawValue)
            },
            onLoading: { loading in
                if loading {
                    self.photoState = .loading(placeholder: Photo.placeholder)
                }
            },
            onSuccess: { result in
                if result.backdrops.isEmpty {
                    self.photoState = .empty
                } else {
                    self.photoState = .loaded(content: result.backdrops)
                }
            },
            onError: { error in
                self.photoState = .error(error)
            }
        )
    }
}
