//
//  SettingsView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-17.
//

import SwiftUI

struct SettingsView: View {
    
    @State var profiled: Bool = true
    
    @State var adminCode: String = ""
    
    var body: some View {
        ZStack {
            Color.darkGray
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Color.gray
                        .cornerRadius(20)
                    VStack {
                        Text("Your Profile")
                            .bold()
                            .font(.title)
                            .padding(.top)
                        HStack {
                            if profiled {
                                Image("pfp")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(50)
                                    .padding(.leading,40)
                                Spacer()
                                Button {
//                                    removePFP()
                                } label: {
                                    ZStack {
                                        Text("Remove Icon")
                                            .foregroundColor(.black)
                                            .bold()
                                            .padding()
                                    }
                                    .background(Color.darkGray)
                                    .cornerRadius(50)
                                    .padding()
                                }
                                
                                .padding(.trailing)
//                            } else {
                                Button {
//                                    addPFP()
                                } label: {
                                    ZStack {
                                        Text("Add Icon")
                                            .padding()
                                    }
                                    .background(Color.darkGray)
                                    .cornerRadius(50)
                                    .padding()
                                }
                            }
                        }
                        .padding(.top)
                        VStack {
                            Text("Administration")
                                .font(.title)
                                .bold()
                                .padding(.bottom,32)
                                .padding(.top,32)
                            HStack {
                                Text("Admin Code")
                                    .padding(
                                        EdgeInsets(
                                            top: 0,
                                            leading: 30,
                                            bottom: 0,
                                            trailing: 16
                                        )
                                    )
                                    .bold()
                                TextField("", text: $adminCode)
                                    .background(Color.darkGray
                                        .cornerRadius(5)
                                        .padding(0))
                                    .padding(.trailing,30)
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                HStack {
                    Text("MasQue")
                    Spacer()
                    Image(systemName: "checkmark")
                }
                .font(.title)
                .bold()
                .padding(
                    EdgeInsets(
                        top: 16,
                        leading: 16,
                        bottom: 0,
                        trailing: 16
                    )
                )
                
            }
            .padding(
                EdgeInsets(
                    top: 16,
                    leading: 16,
                    bottom: 0,
                    trailing: 16
                )
            )
        }
    }
}

#Preview {
    SettingsView()
}
