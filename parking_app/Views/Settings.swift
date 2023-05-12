//
//  Settings.swift
//  parking_app
//
//  Created by Bianka B on 4/12/23.
//
//  User Settings 

import SwiftUI

struct Settings: View {
    @State var recieve = false
    @State var selection = 0
    
    private var identType = ["","Student", "Faculty/Staff"]
    @State private var type = ""
    
  var body: some View {
      Form {
          Toggle(isOn: $recieve) {
              Text("Recieve Notifications")
          }
          
          Section(header: Text("Info") ) {
              Picker(selection: $type, label: Text("Identification")) {
                  ForEach (identType, id: \.self) {activity in
                      Text(activity)
                  }
              }
              if type == "Student" {
                  Picker(selection: $selection, label: Text("Permit Type")) {
                      Text("Commuter").tag(1)
                      Text("Resident South").tag(2)
                      Text("Resident North").tag(3)
                      Text("None").tag(4)
                  }

              }
          } // section info

      }.navigationTitle("Settings")
    
  } // view body
} // view settings

