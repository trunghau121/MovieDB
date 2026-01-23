//
//  TagList.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

import SwiftUI

struct TagListView: View {
    let data: [Genre]
    
    var body: some View {
        FlexibleView(
            data: data,
            spacing: 10,
            alignment: .center
        ) { item in
            Text(verbatim: item.name)
                .foregroundColor(.gray)
                .font(.system(size: 15).bold())
                .padding(.vertical, 5)
                .padding(.horizontal, 14)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.violet, lineWidth: 1.2)
                )
        }
        .padding(.horizontal, 10)
    }
}

struct TagListView_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            TagListView(data: [])
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}
