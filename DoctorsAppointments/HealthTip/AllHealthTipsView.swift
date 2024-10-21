//
//  AllHealthTipsView.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 03/04/1446 AH.
//

import SwiftUI

struct AllHealthTipsView: View {
    var HealthViewModel = HealthTipViewModel()
    var body: some View {
            ScrollView(.vertical,showsIndicators: false){
                ForEach(HealthViewModel.healthTips){tip in
                    NavigationLink {
                       HealthTip_Full_Screen(selected_HealthTip: tip)
                    } label: {
                        HealthTipCard(healthTip: tip)
                    }

                    
                }
            .navigationTitle("Health Tips")
        
            
        }
    }
}

#Preview {
    AllHealthTipsView()
}
