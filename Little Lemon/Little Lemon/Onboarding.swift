//
//  Onboarding.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 18.04.2023.
//

import SwiftUI
import Foundation

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsloggedIn = "kIsloggedIn"
let kNewsletter = "newsletter key"
let kSpecialOffers = "Special offers key"
let kPasswordChanges = "Password changes key"
let kOrderStatuses = "Order Statuses key"

struct Onboarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var isLoggedIn = false
    var body: some View {
        
        NavigationStack {
            Header(isLoggedin: $isLoggedIn)
            
            HeroOnboarding()
                .frame(height: 250)

           VStack{
               
               
               VStack(alignment: .leading) {
                   Text("First Name")
                       .font(.callout)
                   TextField("First Name", text: $firstName)
                       .textFieldStyle(.roundedBorder)
                   
                   Text("Last Name")
                   TextField("Last Name", text: $lastName)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                   Text("Email")
                   TextField("Email", text: $email)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
               }
               
                    
                
                
                    Button{
                        if !(firstName.isEmpty || lastName.isEmpty || email.isEmpty){
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(true, forKey: kIsloggedIn)
                            UserDefaults.standard.set(false, forKey: kNewsletter)
                            UserDefaults.standard.set(false, forKey: kSpecialOffers)
                            UserDefaults.standard.set(false, forKey: kPasswordChanges)
                            UserDefaults.standard.set(false, forKey: kOrderStatuses)
                            isLoggedIn = true
                        }else{
                            print("Empty")
                        }
                        
                    } label: {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Primary2"))
                   
                Spacer()
            }
           .navigationDestination(isPresented: $isLoggedIn){
               Home(isLoggedin: $isLoggedIn)
           }
           .navigationBarBackButtonHidden(true)
            
            .padding()
            .onAppear{
                if UserDefaults.standard.bool(forKey: kIsloggedIn){
                    isLoggedIn = true
                }
                if isLoggedIn == false{
                    firstName = ""
                    lastName = ""
                    email = ""
                }
                
            }
        }
        
    }
        
}

//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding()
//    }
//}
