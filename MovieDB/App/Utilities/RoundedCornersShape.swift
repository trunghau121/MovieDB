//
//  RoundedCornersShape.swift
//  MovieDB
//
//  Created by 60156720 on 12/17/25.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    var radius: CGFloat = .infinity
    var conners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: conners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
