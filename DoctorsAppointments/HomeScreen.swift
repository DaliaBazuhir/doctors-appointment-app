//
//  HomeScreen.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 30/03/1446 AH.
//

import SwiftUI

struct HomeScreen: View {
    @State var searchedDoctor = ""
    @State var selectedSpeciality: String? = nil
    @ObservedObject var docotrviewModel = DoctorViewModel();
    @ObservedObject var reviewModel = ReviewViewModel();
    @ObservedObject var user_appointments_model = UserViewModel()
    var hospitalView = HospitalViewModel()
    var heathView = HealthTipViewModel()
    var filteredDoctors: [Doctor] {
            var filtered = docotrviewModel.docotrs
            
            // Filter by search query
            if !searchedDoctor.isEmpty {
                filtered = filtered.filter { $0.name.lowercased().contains(searchedDoctor.lowercased()) }
            }
            
            // Filter by selected category
            if let category = selectedSpeciality {
                filtered = filtered.filter {$0.speciality == category }
            }
            
            return filtered
        }
    var body: some View {
         
          NavigationView{
            ScrollView(showsIndicators: false) {
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color("color2"))
                        .frame(width: .infinity,height:200)
                    VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: "text.alignleft")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                            Spacer()
                            Text("HOME")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            NavigationLink {
                                UserView(hospital_view_model: hospitalView, user_appointments_model: user_appointments_model)
                            } label: {
                                Image(systemName: "person")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                            }
                        }.padding()
                        
                        Text("Find the best doctor")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(alignment: .leading)
                            .padding(.leading)
                        
                        HStack {
                            TextField("Search Doctors", text: $searchedDoctor)
                                .padding()
                                .background(Color.gray.opacity(0.2).cornerRadius(10)
                                    .frame(height: 40))
                            Button(action: {
                                filteredDoctors
                            }, label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                                    .foregroundColor(.white)
                            })
                        }.padding(.horizontal)
                            .padding([.top,.bottom])
                    }
                    
                }
                VStack{
                    HStack{
                        Text("Categories")
                            .font(.title2)
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            HStack {
                                Text("See All")
                                 .foregroundColor(.black)

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                        })
                    }.padding()
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            Button(action: {
                                selectedSpeciality = "Dentest"
                            }, label: {
                                Text("Dentest")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.gray)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 25)
                                    ).padding([.trailing])
                            })
                            Button(action: {
                                selectedSpeciality = "Surgery"
                            }, label: {
                                Text("Surgery")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.gray)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 25)
                                    ).padding([.trailing])
                            })
                            Button(action: {
                                selectedSpeciality = "Heart"
                            }, label: {
                                Text("Heart")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.gray)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 25)
                                    ).padding([.trailing])
                            })
                            Button(action: {
                                selectedSpeciality = "Children"
                            }, label: {
                                Text("Children")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.gray)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 25)
                                    ).padding([.trailing])
                            })
                        }.padding(.trailing)
                    }.padding()
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)){
                        ForEach(filteredDoctors){doctor in
                            NavigationLink {
                                DoctorDetailsView(selectedDoctor: doctor,user_view_model: user_appointments_model)
                            } label: {
                                DoctorCard(doctor: doctor)
                            }

                        }
                    }.padding(.horizontal)
                    
                }
             
                HStack{
                    Text("Reviews")
                        .font(.title2)
                    Spacer()

                    NavigationLink {
                        ReviewScreen( reviewViewModel: reviewModel)
                    } label: {
                        HStack {
                            Text("Add Review")
                             .foregroundColor(.black)

                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                    }

                }.padding()
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHGrid(rows: /*@START_MENU_TOKEN@*/[GridItem(.fixed(20))]/*@END_MENU_TOKEN@*/, content: {
                        ForEach(reviewModel.reviews){ review in
                            ReviewCard(review: review)
                                .padding(.leading)
                        }
                    })
                }.padding(.leading)
                
                HStack{
                    Text("Hospitals")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                       HospitalScreen(hospitalView: hospitalView)
                    } label: {
                        HStack {
                            Text("See All")
                                .foregroundColor(.black)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                        
                    }

                }.padding()
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHGrid(rows: [GridItem(.fixed(50))] ){
                        ForEach(0..<2){index in
                            NavigationLink {
                                EachHospitalView(hospital: hospitalView.hospitals[index],hospitalView: hospitalView)
                            } label: {
                                HospitalCard(hospital: hospitalView.hospitals[index]).padding(.trailing,120)
                            }

                        }
                    }.padding()
                }.padding(.leading)
                HStack{
                    Text("Health Tips")
                        .font(.title2)
                    Spacer()

                    NavigationLink {
                        AllHealthTipsView()
                    } label: {
                        HStack {
                            Text("See All")
                                .foregroundColor(.black)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                        
                    }

                }.padding()
                ForEach(0..<2){ index in
                    NavigationLink {
                   HealthTip_Full_Screen(selected_HealthTip: heathView.healthTips[index])
                          } label: {
                            HealthTipCard(healthTip: heathView.healthTips[index])
                                     }
                }
                
            }
        }
      }
    }
}

#Preview {

    HomeScreen()
}
