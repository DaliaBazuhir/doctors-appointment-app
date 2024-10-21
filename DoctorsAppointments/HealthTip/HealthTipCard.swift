//
//  HealthTipCard.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 03/04/1446 AH.
//

import SwiftUI


struct HealthTipCard : View{
    let healthTip: HealthTip;
    var body: some View
    {
        VStack {
            HStack{
                Image(healthTip.image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 100,height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12).stroke(Color.primary,lineWidth: 1)
                    ).padding()
                
                VStack(alignment:.leading){
                    Text(healthTip.tip_title)
                        .foregroundColor(.primary)
                        .bold()
                    Text(healthTip.tip_category)
                        .foregroundColor(.gray)
                        .font(.callout)
                    Text(healthTip.tip_hashtag)
                        .foregroundColor(.gray)
                        .font(.headline)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.2))
                               
                        )
                    Text(healthTip.tip_paragraph)
                        .foregroundColor(.black)
                      
                }
            }
            HStack{
                Image(healthTip.Image_Docotr)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60,height: 60)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding()
                Spacer()
                Text(healthTip.wrritenBy)
                    .font(.headline)
                    .foregroundColor(.primary)
                  
            }.padding([.trailing,.leading,],10)
            Divider()
        }
    }
}


struct HealthTip_Full_Screen: View {
    let selected_HealthTip: HealthTip
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading){
                Image(selected_HealthTip.image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                Text(selected_HealthTip.tip_title).font(.title).foregroundColor(.black).bold()
            Text(
                selected_HealthTip.tip_category).font(.title3).foregroundColor(.gray)
                Text("Written By : \(selected_HealthTip.wrritenBy)")
        
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et elementum arcu. Nunc eget dolor varius, iaculis ligula a, viverra augue. Vivamus lobortis luctus felis nec tincidunt. Etiam sodales diam eget sagittis dapibus. Suspendisse ut tempus velit. Nam vehicula molestie ante vel porta. Nullam nec augue erat. Curabitur facilisis, ligula id sagittis commodo, urna mauris laoreet ligula, a consectetur turpis orci vel odio. Proin facilisis viverra facilisis. Phasellus venenatis accumsan condimentum. Quisque lacinia ex urna, a auctor quam aliquam quis. Suspendisse urna purus, tincidunt at venenatis eu, congue sit amet sapien.").padding()
            
            }
        
        }.padding()
    }
}

#Preview {
    HealthTipCard(healthTip:  HealthTip(image: "hospital1", tip_title: "What if My Lung Cancer Comes Back?", tip_category: "Stay fit and healthy", tip_hashtag: "#Lung Cancer", tip_paragraph: "Some people start having symptoms of recurrence before their next surveillance scan", wrritenBy: "Dr. Jerome Bell", Image_Docotr: "1")
    )
}


//#Preview {
//    HealthTipCard(healthTip: HealthTip(image: "hospital1", tip_title: "Acai Berries 101: A Complete Guide", tip_category: "Symptom Checker", tip_hashtag: "#Diet & Nutrition", tip_paragraph: "In the last several years, you may have noticed the prevalence of acai berries and acai berry", wrritenBy: "Dr. Devon Lanel", Image_Docotr: "3"))
//}
