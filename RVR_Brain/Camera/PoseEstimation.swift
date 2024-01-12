//
//  PoseEstimation.swift
//  RVR_Brain
//
//  Created by Al on 25/08/2023.
//

import UIKit
import Vision

class PoseEstimationService {
    // Fonction pour détecter la pose humaine dans une UIImage
    func detectHumanPose(in image: UIImage, completion: @escaping ([VNHumanBodyPoseObservation]) -> Void) {
        guard let cgImage = image.cgImage else {
            print("Impossible de convertir l'image en CGImage.")
            return
        }
        
        let request = VNDetectHumanBodyPoseRequest { (request, error) in
            if let error = error {
                print("Erreur lors de la détection de la pose humaine: \(error)")
                return
            }
            
            guard let observations = request.results as? [VNHumanBodyPoseObservation] else {
                print("Aucun résultat obtenu.")
                return
            }
            
            // Renvoyer les observations de la pose humaine via le handler de complétion
            completion(observations)
        }
        
        let handler = VNImageRequestHandler(cgImage: cgImage, orientation: .up, options: [:])
        
        do {
            try handler.perform([request])
        } catch {
            print("Impossible d'effectuer la requête: \(error)")
        }
    }
}
