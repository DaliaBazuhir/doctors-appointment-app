//
//  ContentView.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 30/03/1446 AH.
//

import SwiftUI

struct MainScreen: View {
    @State var selectedTab = 0;
    var body: some View {
        VStack{
            TabView(selection: $selectedTab,
                    content:  {
                Text("Home")
                    .tabItem {Image(systemName: "house.fill")}.tag(1)
                Text("User Appointemnts")
                    .tabItem {Image(systemName: "calendar")}.tag(2)
                Text("User Data")
                    .tabItem {Image(systemName: "person")}.tag(2)
            })
             
        }
    }
}

#Preview {
    MainScreen()
}
