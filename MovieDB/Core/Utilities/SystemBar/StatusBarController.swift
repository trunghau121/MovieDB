//
//  StatusBarController.swift
//  MovieDB
//
//  Created by 60156720 on 12/15/25.
//

import SwiftUI

struct StatusBarController: UIViewControllerRepresentable {
    let style: UIStatusBarStyle
    
    func makeUIViewController(context: Context) -> some UIViewController {
        Controller(style: style)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        (uiViewController as? Controller)?.style = style
    }
    
    final class Controller: UIViewController {
        var style: UIStatusBarStyle {
            didSet {
                setNeedsStatusBarAppearanceUpdate()
            }
        }
        
        init(style: UIStatusBarStyle) {
            self.style = style
            super.init(nibName: nil, bundle: nil)
        }
        
        required init(coder: NSCoder) {
            fatalError()
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            style
        }
    }
}
