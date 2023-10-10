//
//  ImageStorage.swift
//  Steps
//
//  Created by Raphael on 05.10.23.
//

import SwiftUI

func saveImage(image: UIImage, key: String) {
    let path = FileManager.default.documentsDirectory()
        .appendingPathComponent(key)
        .appendingPathExtension("png")
    if let pngData = image.png() {
        try? pngData.write(to: path)
    }
}

func loadImage(key: String) -> UIImage? {
    let path = FileManager.default.documentsDirectory()
        .appendingPathComponent(key)
        .appendingPathExtension("png")
    return UIImage(contentsOfFile: path.path())
}

func deleteImage(key: String) {
    let path = FileManager.default.documentsDirectory()
        .appendingPathComponent(key)
        .appendingPathExtension("png")
    try? FileManager.default.removeItem(at: path)
}
