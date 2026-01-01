//
//  Shimmer.swift
//  SimpleShimmer
//
//  Created by Ganesh on 01/01/26.
//

import SwiftUI

struct ShimmerModifire: ViewModifier {
    
    @State private var isVisible: Bool = false
    var isShowing: Bool
    
    func body(content: Content) -> some View {
        if isShowing {
            content
                .redacted(reason: .placeholder)
                .opacity(isVisible ? 1 : 0.4)
                .onAppear {
                    withAnimation(.linear(duration: 1.2).repeatForever(autoreverses: true)) {
                        isVisible.toggle()
                    }
                }
        } else {
            content
        }
    }
}

extension View {
    func shimmer(_ isShowing: Bool) -> some View {
        modifier(ShimmerModifire(isShowing: isShowing))
    }
}
