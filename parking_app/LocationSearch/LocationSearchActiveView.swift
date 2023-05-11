//
//  LocationSearchActiveView.swift
//  parking_app
//
//  Created by Bianka B on 4/22/23.
//

import SwiftUI

struct LocationSearchActiveView: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 8,height: 8)
                .padding(.horizontal)
            Text("Where to?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64,
               height:50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: .black, radius: 6)
        )
    }
}

struct LocationSearchActiveView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActiveView()
    }
}
