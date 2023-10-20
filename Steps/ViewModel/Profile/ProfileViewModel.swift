//
//  ProfileViewModel.swift
//  Steps
//
//  Created by Yashraj jadhav on 16/10/23.
//

import SwiftUI
class ProfileViewModel : ObservableObject {
   
   @Published var showAlert = false
   @Published var isEditingName = false
   @Published var currentName = ""
   @Published var isEditingImage = false
   @Published var profileName : String? = UserDefaults.standard.string(forKey: "profileName")
   @Published var isSelectedImage : String? = UserDefaults.standard.string(forKey: "profileImage")
   @Published var profileImage : String? = UserDefaults.standard.string(forKey: "profileImage")
    
    var images = ["avatar 1", "avatar 2", "avatar 3", "avatar 4", "avatar 5", "avatar 6", "avatar 7", "avatar 8", "avatar 9", "avatar 10"]
    
    func presentEditName() {
        isEditingName = true
        isEditingImage = false
    }
    
    func presentEditImage() {
            isEditingName = false
            isEditingImage = true
    }
    
    func dismissEdit() {
            isEditingName = false
            isEditingImage = false
    }
    
    func setNewName() {
            profileName = currentName
            UserDefaults.standard.set(currentName, forKey: "profileName")
            self.dismissEdit()
    }
    
    func didSelectNewImage(name: String){
        isSelectedImage = name
    }
    
    func setNewImage() {
        profileImage = isSelectedImage
        UserDefaults.standard.set(isSelectedImage, forKey: "profileImage")
        self.dismissEdit()
    }
}
