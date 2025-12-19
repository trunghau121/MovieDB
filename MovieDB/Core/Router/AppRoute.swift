//
//  AppRoute.swift
//  MovieDB
//
//  Created by 60156720 on 12/17/25.
//
import SwiftUI

protocol AppRoute: Identifiable, Hashable {
    associatedtype Screen: View
    @ViewBuilder func build() -> Screen
}
