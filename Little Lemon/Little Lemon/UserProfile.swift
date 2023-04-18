//
//  UserProfile.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 18.04.2023.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State private var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State private var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State private var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    @State private var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @State private var orderStatus = UserDefaults.standard.bool(forKey: kOrderStatuses)
    @State private var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
    @Binding var isLoggedIn : Bool
    @State var isLoggedOut = false

    var body: some View {
        ZStack {
            HStack {
                Button{
                    presentation.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .resizable()
                        .foregroundColor(Color("Primary1"))
                        .frame(width: 30, height: 30)
                    
                }
                .padding(.leading)
                Spacer()
                
            }
            Header(isLoggedin: $isLoggedIn)
        }
        NavigationStack {
//            Header(isLoggedin: $isLoggedIn)
            VStack(alignment: .leading)  {
                Text("Personal Information")
                    .font(.headline).foregroundColor(Color("approvedGray"))
                HStack(spacing: 10) {
                    Image("Profile")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Button{
                        print("Changed")
                    }label: {
                        Text("Change")
                    }
                    .padding(10)
                    .background(Color("Primary1"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Button{
                        print("Removed")
                    }label: {
                        Text("Remove")
                    }
                    .padding(10)
                    .background(.white)
                    .foregroundColor(.gray)
                    .border(Color("Primary1"), width: 1)
                   Spacer()
                }
                Spacer()
                Section{
                    Text("First name")
                        .font(.caption)
                        .padding(.top,10)
                        .foregroundColor(Color("approvedGray"))
                    TextField("First name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                    Text("Last name")
                        .font(.caption)
                        .padding(.top,10)
                        .foregroundColor(Color("approvedGray"))
                    TextField("Last name", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                    Text("Email")
                        .font(.caption)
                        .padding(.top,10)
                        .foregroundColor(Color("approvedGray"))
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                    
                } header: {
                    Text("Personal Details")
                        .font(.headline)
                }
                .font(.subheadline).foregroundColor(Color("approvedGray"))
                Spacer()
                Section {
                    Toggle("Newsletter", isOn: $newsletter)
                    Toggle("Special Offers", isOn: $specialOffers)
                    Toggle("Order Statuses", isOn: $orderStatus)
                    Toggle("Password Changes", isOn: $passwordChanges)
                } header: {
                    Text("Email Notifications")
                        .font(.headline)
                }
                .font(.subheadline).foregroundColor(Color("approvedGray"))
                .padding(5)
                    Button{
                        UserDefaults.standard.set(false, forKey: kIsloggedIn)
                        UserDefaults.standard.set("", forKey: kFirstName)
                        UserDefaults.standard.set("", forKey: kLastName)
                        UserDefaults.standard.set("", forKey: kEmail)
                        UserDefaults.standard.set(false, forKey: kNewsletter)
                        UserDefaults.standard.set(false, forKey: kSpecialOffers)
                        UserDefaults.standard.set(false, forKey: kPasswordChanges)
                        UserDefaults.standard.set(false, forKey: kOrderStatuses)
                        isLoggedIn = false
                        isLoggedOut = true
    //                    self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("Log out")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("approvedGray"))
                    }
                    .tint(Color("Primary2"))
                    .buttonStyle(.borderedProminent)
                    
                    Spacer()
                HStack{
                    Button{
                        firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
                        lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
                        email = UserDefaults.standard.string(forKey: kEmail) ?? ""
                        newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
                        specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
                        orderStatus = UserDefaults.standard.bool(forKey: kOrderStatuses)
                        passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
                    } label: {
                        Text("Discard Changes")
                            .padding(10)
                            
                            .foregroundColor(Color("Primary1"))
                            .border(Color("Primary1"), width: 1)
                            
                            
                            
                    }
                    Spacer()
                    Button{
                        if !(firstName.isEmpty || lastName.isEmpty || email.isEmpty){
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                            UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                            UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                            UserDefaults.standard.set(orderStatus, forKey: kOrderStatuses)
                            isLoggedIn = true
                        }
                    } label: {
                        Text("Save Changes")
                            .padding(10)
                            .background(Color("Primary1"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                            
                    }
                }
                
                    
                
            }
            .padding()
            .navigationDestination(isPresented: $isLoggedOut){
                Onboarding()
            }
            .navigationBarBackButtonHidden(true)

        }
    }
}

//struct UserProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfile()
//    }
//}
