//
//  ImageLoader.swift
//

import SwiftUI
import Combine

public class ImageLoader: ObservableObject {
    @Published public private(set) var state: State = .loading
    private var cancellable: AnyCancellable?
    private var cache: ImageCache?
    
    public enum Error: Equatable {
        case dataError
        case urlError
        case taskError(URLError)
    }
    
    public enum State: Equatable {
        case loading
        case success(Image)
        case failed(Error?)
    }
    
    public init(url: URL?, cache: ImageCache?) {
        self.cache = cache
        loadImage(from: url)
    }
    
    private func loadImage(from url: URL?) {
        guard let url = url else {
            self.state = .failed(.urlError)
            return
        }
        
        if let cachedImage = cache?[url.absoluteString] {
            self.state = .success(Image(uiImage: cachedImage))
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                guard let self = self else { return }
                
                if let image = image {
                    self.cache?[url.absoluteString] = image
                    withAnimation {
                        self.state = .success(Image(uiImage: image))
                    }
                } else {
                    self.state = .failed(.dataError)
                }
            }
    }
    
    public func cancel() {
        cancellable?.cancel()
    }
}
