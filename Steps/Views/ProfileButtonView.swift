//
//  ProfileButtonView.swift
//  Steps
//
//  Created by Yashraj jadhav on 16/10/23.
//

import SwiftUI

struct ProfileButtonView: View {
    @State var title : String
    @State var backgroundColor : Color
    var action : (()->Void)

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding()
                .frame(maxWidth: 200)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(backgroundColor))
        }
    }
}

#Preview {
    ProfileButtonView(title: "", backgroundColor: .red) {}
}
