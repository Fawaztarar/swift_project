//
//  CommentView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 16/02/2024.
//

import Foundation
import SwiftUI



struct CommentView: View {
    let comment: Comment

    var body: some View {
        HStack {
            Text(comment.username).bold()
            Text(comment.content)
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
