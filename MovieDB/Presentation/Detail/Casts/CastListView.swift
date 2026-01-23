//
//  CastList.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

import SwiftUI

struct CastListView: View {
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let data: [Cast]
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 20) {
                    ForEach(self.data, id: \.id) { cast in
                        CastCrewItem(data: cast)
                    }
                }
                .padding(.top, 5)
                .padding(.bottom, 10)
                .padding(.horizontal, 15)
            }
        }
    }
}

struct CastListView_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            CastListView(data: Cast.placeholder)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}
