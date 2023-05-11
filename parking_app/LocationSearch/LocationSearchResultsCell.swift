//
//  LocationSearchResultsCell.swift
//  parking_app
//
//  Created by Bianka B on 4/22/23.
//

import SwiftUI

struct LocationSearchResultsCell: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack {
            Image( systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(Color("Crimson"))
                .accentColor(.white)
                .frame(width:40, height:40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultsCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultsCell(title: "starbucks", subtitle: "123 main")
    }
}
