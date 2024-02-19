////
////  UserProfileView.swift
////  Acebook
////
////  Created by Fawaz Tarar on 19/02/2024.
////
//
//import Foundation
//import SwiftUI
//
//struct UserProfileView: View {
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack {
//                    ZStack(alignment: .bottomLeading) {
//                        Image("cover_photo") // Replace with your cover photo asset
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(height: 200)
//                            .clipped()
//
//                        Image("profile_photo") // Replace with your profile photo asset
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 100, height: 100)
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                            .shadow(radius: 10)
//                            .offset(x: 20, y: -50)
//                    }
//
//                    HStack {
//                        VStack(alignment: .leading, spacing: 5) {
//                            Text("Tarar Fawaz")
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//
//                            Text("1.6K followers · 3.4K following")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                        .padding(.leading, 140)
//
//                        Spacer()
//                    }
//                    .padding(.bottom, 50)
//                    .background(Color.black)
//
//                    HStack(spacing: 20) {
//                        Button(action: {}) {
//                            Text("Create reel")
//                                .foregroundColor(.white)
//                        }
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(5)
//
//                        Button(action: {}) {
//                            Text("See dashboard")
//                                .foregroundColor(.white)
//                        }
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .padding()
//                        .background(Color.gray)
//                        .cornerRadius(5)
//                    }
//                    .padding(.horizontal)
//
//                    ProfileTabsView()
//
//                    // Add additional profile content here
//                    
//                    Spacer()
//                }
//            }
//            .background(Color.black)
//            .edgesIgnoringSafeArea(.top)
//            .navigationBarTitle("Tarar Fawaz", displayMode: .inline)
//            .navigationBarItems(trailing: Button(action: {}) {
//                Image(systemName: "camera")
//                    .foregroundColor(.white)
//            })
//        }
//    }
//}
//
//struct ProfileTabsView: View {
//    var body: some View {
//        HStack {
//            Spacer()
//
//            Button("Posts") {
//                // Action
//            }
//            .foregroundColor(.white)
//
//            Spacer()
//
//            Button("About") {
//                // Action
//            }
//            .foregroundColor(.white)
//
//            Spacer()
//
//            Button("Videos") {
//                // Action
//            }
//            .foregroundColor(.white)
//
//            Spacer()
//
//            Button("More") {
//                // Action
//            }
//            .foregroundColor(.white)
//
//            Spacer()
//        }
//        .padding()
//        .background(Color(white: 0.1))
//    }
//}
//
//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
