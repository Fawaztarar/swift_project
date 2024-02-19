//
//  FacebookTopBarView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 18/02/2024.
//

import Foundation
import SwiftUI

struct FacebookTopBarView: View {
    var body: some View {
        VStack {
            HStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 44)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                        // Search action
                    }) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                    }
                    
                    Button(action: {
                        // Messenger action
                    }) {
                        Image(systemName: "message.fill")
                            .imageScale(.large)
                    }
                }
                .padding(.trailing, 10)
            }
            .padding(.horizontal)
            
            HStack {
                Image("profile4.png")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text("What's on your mind?")
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {
                    // Status action
                }) {
                    Image(systemName: "square.and.pencil")
                        .imageScale(.large)
                }
            }
            .padding()
        }
    }
}

struct FacebookTopBarView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookTopBarView()
    }
}
