//
//  ImageFetcher.swift
//  MyToDos
//
//  Created by Madushan Senavirathna on 2022-12-01.
//

import Foundation
import Combine
import SwiftUI

class ImageFetcher: ObservableObject {
    
    let urlPaths = ["https://www.mercurynews.com/wp-content/uploads/2019/11/sjm-l-wedjoan-1113_70214984.jpg?w=1457",
    "https://via.placeholder.com/150/d32776",
    "https://via.placeholder.com/150/f66b97"]
    
    @Published var image: UIImage? = nil
    
    let loadeImage = CurrentValueSubject<String, Never>("")
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        
        loadeImage
            .removeDuplicates()
            .compactMap {
            URL(string:  $0)
        }
            .map { (url) in
                URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .compactMap {
                        UIImage(data: $0)
                    }
            }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("completion: \(completion)")
            } receiveValue: { [unowned self] (image) in
                self.image = image
            }.store(in: &subscription)

    }
}
