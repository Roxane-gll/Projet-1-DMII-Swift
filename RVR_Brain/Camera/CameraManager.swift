//
//  CameraManager.swift
//  RVR_Brain
//
//  Created by Al on 25/08/2023.
//

import Foundation
import UIKit
import AVFoundation

class CameraCaptureManager: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    private var captureSession: AVCaptureSession?
    
    var expectedSize: CGSize = CGSize(width: 244, height: 244)
    var imageCallback:((UIImage)->())?
    var cvPixelBuffCallback:((CVPixelBuffer)->())?
    
    override init() {
        super.init()
        setupSession()
    }
    
    private func setupSession() {
        captureSession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: captureDevice) else {
            return
        }
        
        if captureSession!.canAddInput(input) {
            captureSession!.addInput(input)
        }
        
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        
        if captureSession!.canAddOutput(videoOutput) {
            captureSession!.addOutput(videoOutput)
        }
        
    }
    
    func start(){
        DispatchQueue.global(qos: .background).async {
            self.captureSession!.startRunning()
        }
        captureSession!.startRunning()
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        if var img = imageFromSampleBuffer(sampleBuffer: sampleBuffer, videoOrientation: .portrait){
            if let callback = self.imageCallback {
                img = img.resizeImageTo(size: expectedSize)!
                callback(img)
            }
            if let callback = self.cvPixelBuffCallback {
                callback(img.toCVPixelBuffer()!)
            }
        }
        
    }
    
    func imageFromSampleBuffer(
            sampleBuffer: CMSampleBuffer,
            videoOrientation: AVCaptureVideoOrientation) -> UIImage? {
            if let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
                let context = CIContext()
                var ciImage = CIImage(cvPixelBuffer: imageBuffer)

                // FIXME: - change to Switch
                if videoOrientation == .landscapeLeft {
                    ciImage = ciImage.oriented(forExifOrientation: 3)
                } else if videoOrientation == .landscapeRight {
                    ciImage = ciImage.oriented(forExifOrientation: 1)
                } else if videoOrientation == .portrait {
                    ciImage = ciImage.oriented(forExifOrientation: 6)
                } else if videoOrientation == .portraitUpsideDown {
                    ciImage = ciImage.oriented(forExifOrientation: 8)
                }

                if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }

            return nil
        }
    // clean up AVCapture
    func stopCamera(){
        captureSession?.stopRunning()
    }
}
