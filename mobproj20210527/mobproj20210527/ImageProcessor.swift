//
//  ImageProcessor.swift
//  mobproj20210527
//
//  Created by David Whetstone on 5/27/21.
//

import Foundation
import UIKit

class ImageProcessor {
    init(filename: String) {
        let image = UIImage(named: filename)
        let data = image?.jpegData(compressionQuality: 0.5)
        
        try! data?.write(to: exportDataURL())
    }
    
    func save() {
        
    }
    
    func delete() {
        
    }
    
    func rotate() {
        
    }
    
    public func getDocumentsDirectory() -> URL {
            // find all possible documents directories for this user
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            print("The Documents Directory is \(paths)")
            // just send back the first one, which ought to be the only one
            return paths[0]
        }
    
    public func exportDataURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent("image.jpg")
    }
}
