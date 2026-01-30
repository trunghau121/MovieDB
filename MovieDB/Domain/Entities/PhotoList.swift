//
//  PhotoList.swift
//  MovieDB
//
//  Created by 60156720 on 1/29/26.
//

public struct PhotoList {
    let id: Int
    let backdrops: [Photo]
    let logos, posters: [Photo]
    
    init(id: Int, backdrops: [Photo], logos: [Photo], posters: [Photo]) {
        self.id = id
        self.backdrops = backdrops
        self.logos = logos
        self.posters = posters
    }
}
