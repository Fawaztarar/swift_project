//
//  CommentRow.swift
//  Acebook
//
//  Created by Fawaz Tarar on 18/02/2024.
//

import Foundation
import SwiftUI

struct CommentRow: View {
    let comment: Comment
    @State private var isLiked: Bool = false
    @State private var likeCount: Int = 0

    var body: some View {
        HStack {
            Text(comment.username)
                .font(.headline)
                .foregroundColor(.blue)
            Text(comment.content)
                .font(.body)
            Spacer()
            Button(action: {
                isLiked.toggle()
                if isLiked {
                    likeCount += 1
                } else {
                    likeCount -= 1
                }
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(isLiked ? .red : .gray)
            }
            Text("\(likeCount)")
                .font(.body)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}
