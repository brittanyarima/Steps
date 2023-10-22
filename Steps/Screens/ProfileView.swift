//
//  ProfileView.swift
//  Steps
//
//  Created by Yashraj jadhav on 16/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        VStack {
            HStack(spacing: 26) {
                Image(viewModel.profileImage ?? "avatar 1")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.indigo, lineWidth: 2)
                    )
                    .shadow(radius: 4)
                    .onTapGesture {
                        withAnimation {
                            viewModel.presentEditImage()
                        }
                    }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Hello")
                        .font(.title)
                        .foregroundColor(Color.gray)
                        .minimumScaleFactor(0.5)

                    Text(viewModel.profileName ?? "Name")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                }
            }
        

        
            if viewModel.isEditingName {

                TextField("Name...", text: $viewModel.currentName)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    )
                HStack {
                    ProfileButtonView(title: "Cancel", backgroundColor: Color.gray.opacity(0.2)) {
                        withAnimation {
                            viewModel.dismissEdit()
                        }
                    }
                    .foregroundColor(Color.red)

                    ProfileButtonView(title: "Done", backgroundColor: Color.primary) {
                        if !viewModel.currentName.isEmpty {
                            withAnimation {
                                viewModel.setNewName()
                            }
                        }
                    }
                    .foregroundColor(Color(uiColor: UIColor.systemBackground))

                }
            }

            if viewModel.isEditingImage {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.images, id: \.self) { image in
                            Button {
                                withAnimation {
                                    viewModel.didSelectNewImage(name: image)
                                }
                            } label: {
                                VStack {
                                    Image(image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()

                                    if viewModel.isSelectedImage == image {
                                        Circle()
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color.primary)
                                    }

                                }
                                .padding()
                            }

                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.15)))
                
                ProfileButtonView(title: "Done", backgroundColor: Color.primary) {
                    withAnimation {
                        viewModel.setNewImage()
                    }
                }
                .foregroundColor(Color(uiColor: UIColor.systemBackground))
                .padding(.bottom)
            }

            VStack {
                ProfileItemButtonView(title: "Edit Name", image: "square.and.pencil") {
                    withAnimation {
                        viewModel.presentEditName()
                    }
                }

                ProfileItemButtonView(title: "Edit Image", image: "square.and.pencil") {
                    withAnimation {
                        viewModel.presentEditImage()
                    }

                }
            }

            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.15))
                    
            )

            VStack {

                Link(destination: URL(string: Constants.privacyURL)!) {
                    HStack {
                        Image(systemName: "doc")

                        Text("Privacy Policy")
                    }
                    .foregroundColor(Color.accentColor)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                Link(destination: URL(string: Constants.termsURL)!) {
                    HStack {
                        Image(systemName: "doc")

                        Text("Terms of Service")
                    }
                    .foregroundColor(Color.accentColor)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }

            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.15))
                   
            )

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

        .alert("Oops!", isPresented: $viewModel.showAlert) {
            Text("Ok")
        } message: {
            Text("We were unable to open your mail application. Please make sure you have one installed.")
        }
    }
}
#Preview {
    ProfileView()
}
