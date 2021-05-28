//
//  ImageProcessor.swift
//  mobproj20210527
//
//  Created by David Whetstone on 5/27/21.
//

import Foundation
import UIKit

class ImageProcessor: ObservableObject {
    @Published    
    var image: UIImage
    
    init(filename: String) {
        image = UIImage(named: filename)!
        save(image: image)
    }
    
    func save(image: UIImage) {
        let data = image.jpegData(compressionQuality: 0.5)!
        try! data.write(to: exportDataURL())
    }
    
    func delete() {
        
    }
    
    func rotate() {
        var localImage = self.image
        DispatchQueue.global().async {
            localImage = self.image.rotate(radians: CGFloat.pi/2)
            self.save(image: localImage)
            print("\(Thread.current.description)")
        }
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

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}
