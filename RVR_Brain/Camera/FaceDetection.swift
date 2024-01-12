//
//  FaceDetection.swift
//  RVR_Brain
//
//  Created by Al on 25/08/2023.
//

import UIKit
import Vision

class FaceDetection {
    
    // Cette fonction prend une UIImage comme entrée et renvoie un tableau de CGRect représentant les positions des visages détectés.
    func detectFace(in image: UIImage, completion: @escaping ([CGRect]) -> Void) {
        guard let cgImage = image.cgImage else {
            print("Impossible de convertir UIImage en CGImage.")
            return
        }
        
        let request = VNDetectFaceRectanglesRequest { request, error in
            if let error = error {
                print("Erreur de détection de visage:", error)
                return
            }
            
            var faceRects: [CGRect] = []
            
            if let results = request.results as? [VNFaceObservation] {
                for faceObservation in results {
                    let boundingBox = faceObservation.boundingBox
                    let size = CGSize(width: boundingBox.width * CGFloat(cgImage.width),
                                      height: boundingBox.height * CGFloat(cgImage.height))
                    let origin = CGPoint(x: boundingBox.minX * CGFloat(cgImage.width),
                                         y: (1 - faceObservation.boundingBox.minY) * CGFloat(cgImage.height) - size.height)
                    let rect = CGRect(origin: origin, size: size)
                    faceRects.append(rect)
                }
            }
            
            // Renvoyer les rectangles du visage via le handler de complétion.
            completion(faceRects)
        }
        
        let handler = VNImageRequestHandler(cgImage: cgImage, orientation: .up, options: [:])
        
        do {
            try handler.perform([request])
        } catch {
            print("Échec de l'exécution de la requête: \(error)")
        }
    }
}
