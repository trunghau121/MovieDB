//
//  ToastData.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

import Foundation

struct ToastData: Identifiable {
    let id = UUID()
    let message: String
    let style: ToastStyle
}
