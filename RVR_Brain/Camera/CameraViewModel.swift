//
//  CameraViewModel.swift
//  RVR_Brain
//
//  Created by Al on 25/08/2023.
//

import Foundation
import UIKit

class CameraViewModel: ObservableObject {
    private var cameraManager: CameraCaptureManager
    let faceDetection = FaceDetection()
    let poseEstimationService = PoseEstimationService()
    
    @Published var newImage:UIImage = UIImage()
    @Published var facesRect = [CGRect]()
    
    init() {
        cameraManager = CameraCaptureManager()
    }
    
    func detectFace(img:UIImage){
        
        faceDetection.detectFace(in: img) { faceRects in
            DispatchQueue.main.async {
                self.facesRect = faceRects
            }
        }
    }
    
    func detectPose(img:UIImage){
        
        poseEstimationService.detectHumanPose(in: img) { observations in
            for observation in observations {
                do {
                    let recognizedPoints = try observation.recognizedPoints(.all)
                    if let leftShoulder = recognizedPoints[.leftShoulder] {
                        print("Point de l'épaule gauche: \(leftShoulder.location)")
                    }
                } catch {
                    print("Erreur lors de l'obtention des points reconnus: \(error)")
                }
            }
        }
    }
    
    func start() {
        cameraManager.imageCallback = { img in
            self.detectFace(img: img)
            DispatchQueue.main.async {
                self.newImage = img
            }
        }
        cameraManager.start()
    }
}
