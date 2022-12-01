//
//  ImageView.swift
//  MyToDos
//
//  Created by Madushan Senavirathna on 2022-12-01.
//

import SwiftUI

struct ImageView: View {
    
    @StateObject var imageFetcher = ImageFetcher()
    var body: some View {
        
        VStack {
            Text("Selct image to downloade")
            
            List(imageFetcher.urlPaths, id: \.self) { path in
                Button(action: {
                    imageFetcher.loadeImage.send(path)
                }, label: {
                    Text(path)
                })
            }
            
            ZStack {
                Color.gray
                
                if imageFetcher.image != nil {
                    Image(uiImage: imageFetcher.image!)
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
