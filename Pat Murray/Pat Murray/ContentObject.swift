//
//  ContentObject.swift
//  Pat Murray
//
//  Created by Patrick Murray on 21/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit

class ContentObject: NSObject {
    
    static let sharedInstance = ContentObject() // Set up Singleton
    
    // Enumerations for Cell and Content Type
    enum CellType {
        case Header
        case Text
        case Photo
    }
    
    enum ContentType {
        case About
        case Projects
        case Education
        case Interests
    }
    
    // MARK: - Setting up arrays
    // ABOUT array
    let aboutArray : [(type: CellType, content: String)] = [(.Header, "About Me"),(.Text, "intro"), (.Photo, "Jumping"), (.Text, "intro2"), (.Photo, "map"), (.Text, "intro3"), (.Photo, "iguassu"), (.Photo, "rock")]
    
    // PROJECTS array
    let projectsArray : [(type: CellType, content: String)] = [(.Header, "Projects"), (.Text, "proj1"), (.Photo, "graph"), (.Text, "proj2"), (.Photo, "gibbs"), (.Text, "proj3"), (.Photo, "quadratic"),  (.Text, "proj4")]
    
    // EDUCATION array
    let eduArray : [(type: CellType, content: String)] = [(.Header, "Education"), (.Text, "edu1"), (.Photo, "academy"), (.Text, "edu2"), (.Photo, "school")]
    
    // INTERESTS array
    let interestsArray : [(type: CellType, content: String)] = [(.Header, "Interests"), (.Text, "interests1"), (.Photo, "bgImage1"), (.Text, "interests2"), (.Photo, "skiing"), (.Text, "interests3"), (.Photo, "lighting"), (.Text, "interests4"), (.Photo, "photography")]
    
    // Declare that the default current content is the About content
    var currentContent = ContentType.About

    
    // MARK: - Init
    override init() {
        super.init()
    }
    
    // MARK: - Functions
    // Returns touples containing array of content and header image
    func getArray() -> (array: [(type: CellType, content: String)], headerImage: String) {
        switch currentContent {
        case .About:
            return (aboutArray, "Profile")
        case .Projects:
            return (projectsArray, "AppStore")
        case .Education:
            return (eduArray, "gradHat")
        case .Interests:
            return (interestsArray, "spotlight")
        }
    }
    
    // Returns UIImage for use in menu
    func getImages(content: ContentType) -> UIImage {
        switch content {
        case .About:
            return UIImage(named: "person")!
        case .Projects:
            return UIImage(named: "AppStore")!
        case .Education:
            return UIImage(named: "gradHat")!
        case .Interests:
            return UIImage(named: "spotlight")!
        }
    }
    
    

   
}
