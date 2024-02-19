//
//  TopBarView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 19/02/2024.
//

import Foundation
import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                // Implement the settings action
            }) {
                Image(systemName: "gear") // For a custom image, replace with Image("your_custom_settings_icon")
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 0)
            
            Button(action: {
                // Implement the search action
            }) {
                Image(systemName: "magnifyingglass") // For a custom image, replace with Image("your_custom_search_icon")
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 10)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(Color.black) // Adjust the color to match your design
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
            .previewLayout(.sizeThatFits)
    }
}
