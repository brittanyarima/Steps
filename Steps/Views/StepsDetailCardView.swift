//
//  CardView.swift
//  Steps
//
//  Created by Mohd Wasif Raza on 13/10/23.
//

import SwiftUI



struct StepsDetailCardView: View {
    @State var title: String
    @State var  image: String
    @State var  value: String
    var body: some View {
        ZStack{
            Color(uiColor: .tertiarySystemFill)
                .cornerRadius(15)
            VStack {
                HStack(alignment: .top) {
                    Text(title)
                        .font(.system(size: 16))
                    
                    Spacer()
                    Image(systemName: image)
                        .foregroundColor(.indigo)
                }.padding()
                Text(value)
                    .font(.system(size: 24))
                
                
            }.padding()
        }
    }
}

#Preview {
    StepsDetailCardView(title: "Calories Burned", image: "flame.fill", value: "530 KCAL")
}
