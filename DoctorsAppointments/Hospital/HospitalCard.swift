//
//  HospitalCard.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 02/04/1446 AH.
//

import SwiftUI

struct EachHospitalView: View{
    @ObservedObject var hospital : Hospital
    @ObservedObject var hospitalView: HospitalViewModel
    @State var showHospitalNumber = false
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 20)
                .fill(Color("color2"))
            .frame(height: 500)
            VStack(alignment: .leading,  content: {
                HStack{
                    Image(hospital.hospital_Image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80,height: 100)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.black))
                        
                    Text(hospital.hospital_name).font(.title3).padding(.bottom, 2)
                }
                Text(hospital.hospital_field).padding(.bottom, 10)
            HStack(content: {
              
                Button(action: {
                   hospital.isFav.toggle()
                    hospitalView.updateFavourites()
                }, label: {
                    Image(systemName: "star.fill").resizable()
                        .frame(width: 30,height: 30)
                        .foregroundColor(hospital.isFav == true ? Color.yellow : Color.gray)
//                        .foregroundColor( hospital.isFav ? Color.yellow : Color.gray )
                    
                }).padding(.trailing,12)
                Button(action: {
                }, label: {
                    Image(systemName: "message").resizable().frame(width: 30,height: 30).foregroundColor(.black)
                }).padding(.trailing,12)
                Spacer()
                Text("\(hospital.hospital_km, specifier: "%.2f")km")
                    .font(.caption2)
                    .padding()
                    .frame(width: 90,height: 50)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    )
            }).padding(.bottom,10)
                HStack {
                            Image(systemName: "location.circle.fill").resizable().frame(width: 30,height: 30)
                    Text(hospital.hospital_address)
                        .font(.callout)
                                .foregroundColor(.black)
                }.padding(.bottom)
                HStack {
                            Image(systemName: "clock").resizable().frame(width: 30,height: 30)
                    Text("\(hospital.hospital_StartWorkingHour) - \(hospital.hospital_EndWorkingHour)")
                        .font(.callout)           // Customize text font
                                .foregroundColor(.black)
                        }.padding(.bottom)
            HStack{
               
                Button(action: {
                 
                }){
                    Text("Consultation")
                        .foregroundColor(.black)
                        .font(.headline)
                        .padding()
                }.background()
                    .clipShape(Capsule())
                .overlay(
                    Capsule().stroke(Color.black,lineWidth: 2))
                Spacer()
                
                Button(action: {
                    showHospitalNumber.toggle()
                        }) {
                            Text("Call")
                                .padding()
                                .foregroundColor(.black)
                                .font(.headline)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        }
                        .background(Color.green.opacity(0.8))
                        .clipShape(Capsule())
                        .overlay(
                            Capsule().stroke(Color.black, lineWidth: 2)
                        )
                        .alert(isPresented: $showHospitalNumber, content: {
                            CallAlert()
                        })
            }.padding([.horizontal,.bottom])
            
        }).padding()
        }.padding()
            
    }
    func CallAlert() -> Alert {
        return Alert(title: Text("Hospital Number +02011234567"))
    }
}




struct HospitalCard : View {
    @State var hospital : Hospital;
    var body: some View {
                HStack{
                    Image(hospital.hospital_Image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80,height: 80)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.black))
                    
                    VStack(alignment: .leading){ Text(hospital.hospital_name)
                            .foregroundColor(.black)
                            .font(.title3).padding(.bottom, 2)
                    Text(hospital.hospital_field)
                        .padding(.bottom, 10)
                        .foregroundColor(.black.opacity(0.6))
                }
                }.background(
                    RoundedRectangle(cornerRadius: 20)
                            .fill(Color("color2"))
                            .frame(width:UIScreen.main.bounds.width-30,height: 160))
               
       }
          
    
}



#Preview {
    HospitalCard(hospital:  Hospital(hospital_name: "Phnom Penh Hospital", hospital_field: "Specialist in Surgery", hospital_address: "#C19, Street 281, Khan Russey Keov, Phnom Penh, Cambodia", hospital_StartWorkingHour: "06:00 AM", hospital_EndWorkingHour: "10:00 PM", hospital_km: 2.36, hospital_Image: "hospital2"))
}
