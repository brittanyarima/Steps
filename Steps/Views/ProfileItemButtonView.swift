//
//  ProfileItemButtonView.swift
//  Steps
//
//  Created by Yashraj jadhav on 16/10/23.
//

import SwiftUI

struct ProfileItemButtonView: View {
    @State var title : String
    @State var image : String
    var action : (()->Void)

    var body: some View {
        Button{
            action()
        } label: {
            HStack{
                Image(systemName: image)
                Text(title)
            }
            .foregroundColor(.accentColor)
        }
        .padding()
        .frame(maxWidth: .infinity , alignment: .leading  )
    }
}
#Preview {
    ProfileItemButtonView(title: "Edit Image", image: "square.and.pencil"){}

}
