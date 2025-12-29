//
//  SearchHeader.swift
//  MovieDB
//
//  Created by 60156720 on 12/29/25.
//

import SwiftUI

struct SearchHeader: View {
    @Binding var text: String
    var onBack: (() -> Void)
    
    var body: some View {
        HStack {
            Button {
                onBack()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.textApp)
                    .font(.system(size: 25))
                    .shadow(radius: 5, x: 5, y: 5)
            }
            TextField(AppText.hintSearch.localized(), text: $text)
                .font(.system(size: 17))
                .foregroundColor(.textApp)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 5)
        }
        .padding()
    }
}

struct SearchHeader_Previews: PreviewProvider {
    struct ContainerView: View {
        @State private var text: String = ""
        var body: some View {
            SearchHeader(text: $text) {
                
            }
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}


