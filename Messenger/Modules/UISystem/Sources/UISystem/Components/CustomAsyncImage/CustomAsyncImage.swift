//
//  CustomAsyncImage.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct CustomAsyncImage<Content>: View where Content: View {
    public typealias Phase = ImageLoader.State
    
    @StateObject private var imageLoader: ImageLoader
    private let content: (Phase) -> Content
    
    public init<P>(
        url: URL?,
        cache: ImageCache = TempImageCache.shared,
        @ViewBuilder content: @escaping (Phase) -> P
    ) where Content == AnyView, P: View {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url, cache: cache))
        self.content = { phase in AnyView(content(phase)) }
    }
    
    public var body: some View {
        content(imageLoader.state)
            .transition(.opacity)
    }
}
