//
//  LoadState.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

enum LoadState: Equatable {
    case idle
    case loading
    case success
    case error(String)
}
