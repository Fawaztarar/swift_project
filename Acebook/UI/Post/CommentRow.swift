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
    @State private var isEditing: Bool = false
    @State private var editedContent: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(comment.username)
                    .font(.headline)
                    .foregroundColor(.blue)
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
            Text(comment.content)
                .font(.body)
                .padding(.bottom, 4)
            HStack {
                Button(action: {
                    isEditing.toggle()
                    editedContent = comment.content
                }) {
                    Image(systemName: "pencil")
                        .foregroundColor(.blue)
                }
                .padding(.trailing, 8)
                Button(action: {
                    // Handle delete action
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }
            if isEditing {
                TextField("Edit comment", text: $editedContent)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 8)
                Button(action: {
                    // Handle save edited comment action
                    isEditing.toggle()
                }) {
                    Text("Save")
                        .foregroundColor(.blue)
                }
            }
            Divider()
        }
        .padding(.horizontal)
    }
}

