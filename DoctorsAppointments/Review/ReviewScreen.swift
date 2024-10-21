//
//  ReviewScreen.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 02/04/1446 AH.
//

import SwiftUI

struct ReviewScreen: View {
    @State var review : String = " "
    @State var selected_name = ""
    @ObservedObject var doctorModel = DoctorViewModel()
    @ObservedObject var reviewViewModel : ReviewViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            TextField("Enter review", text: $review)
                .multilineTextAlignment(.center)
                .frame(height: 200)
                .border(Color.gray, width: 1)
                .cornerRadius(8)
                .padding()
            HStack {
                Text("Choose Doctor")
                Picker("Pick one", selection: $selected_name) {
                    ForEach(doctorModel.docotrs) { doctor in
                        Text(doctor.name)
                    }
                }.pickerStyle(.inline)
            }.padding()
            
           
            Button(action: {
                reviewViewModel.addNewReview(userName: "Anonymous", doctorName: selected_name, review: "\(selected_name) \(review)")
                presentationMode.wrappedValue.dismiss()
            }, label: {
                       Text("Book Now")
                           .foregroundColor(.white)
                                      .background(
                                        RoundedRectangle(cornerRadius: 5)
                                      .fill(Color("color2"))
                                      .frame(width: UIScreen.main.bounds.width - 100,height: 40)
                                      )
            }).padding()
        }
    }
}

//#Preview {
//    ReviewScreen()
//}
