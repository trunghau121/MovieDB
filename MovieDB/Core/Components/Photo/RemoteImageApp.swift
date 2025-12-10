//
//  RemotePhoto.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

import Foundation
import SwiftUICore

struct RemotePhotoUI: View {
    let url: String
    let size: CGSize
    
    private var imageURL: URL? {
        return URL(string: Enviroment.photo500Url + url)
    }
    
    var body: some View {
        Group {
            if let url = imageURL {
                
            }
        }
    }
    
    struct Re
    
}
