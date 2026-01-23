//
//  CastCrewItem.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

import SwiftUI

struct CastCrewItem: View {
    let data: Cast
    var body: some View {
        ZStack(alignment: .leading){
            VStack(alignment: .leading) {
                Text("\(data.name)")
                    .font(.system(size: 14).bold())
                    .foregroundColor(Color.textApp)
                    .lineLimit(1)
                
                Text("\(data.character)")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            .frame(width: (UIScreen.main.bounds.width / 1.8) - 55, alignment: .leading)
            .padding(.vertical, 6)
            .padding(.leading, 60)
            .padding(.trailing, 10)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.violet, lineWidth: 1.5)
            )
            
            AsyncImageApp(url: data.profilePath)
                .background(Color.gray)
                .frame(width: 55, height: 55)
                .clipShape(Circle())
                .overlay (
                    Circle()
                        .stroke(Color.violet, lineWidth: 2)
                )
        }
    }
}

struct CastCrewItem_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            CastCrewItem(data: Cast.placeholder[0])
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}
