//
//  CollectionLoadingState.swift
//  MovieDB
//
//  Created by 60156720 on 12/25/25.
//

public enum CollectionLoadingState<Content> {
  case loading(placeholder: Content), loaded(content: Content), empty, error(Error)
}
