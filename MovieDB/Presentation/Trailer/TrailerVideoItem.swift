//
//  TrailerVideoItem.swift
//  MovieDB
//
//  Created by 60156720 on 1/27/26.
//

import SwiftUI

struct TrailerVideoItem: View {
    var trailer: Trailer
    var isSelected: Bool
    
    var body: some View {
        HStack(alignment: .center,spacing: 10) {
            AsyncImageApp(url: trailer.getThumbnail())
                .background(Color.gray)
                .frame(width: 65, height: 65)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .shadowApp.opacity(0.2), radius: 5, x: 2, y: 0)
            
            Text(trailer.name)
                .font(.system(size: 15, weight: .semibold))
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .foregroundColor(isSelected ? Color.white : .textApp)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(isSelected ? Color.violet : Color.clear)
    }
}

struct TrailerVideoItem_Previews : PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            TrailerVideoItem(trailer: Trailer.placeholder[0], isSelected: true)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}
