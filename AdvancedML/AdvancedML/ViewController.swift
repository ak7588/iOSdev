//
//  ViewController.swift
//  AdvancedML
//
//  Created by Amina on 5/31/21.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var flowerTextLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userImage
            guard let ciimage = CIImage(image: userImage) else {
                fatalError()
            }
            detect(image: ciimage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError()
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError()
            }
            if let firstResult = results.first {
                self.navigationItem.title = firstResult.identifier
            }
        }
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    
    func requestData(flowerName: String){
        
        let parameters : [String:String] = [
                          "format" : "json",
                          "action" : "query",
                          "prop" : "extracts",
                          "exintro" : "",
                          "explaintext" : "",
                          "titles" : flowerName,
                          "indexpageids" : "",
                          "redirects" : "1",
                          ]
        
        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { response in
            if response.result.isSuccess {
                let flowerJSON:JSON = JSON(response.result.value!)
                let pageId = flowerJSON["query"]["pageid"][0].stringValue
                let flowerText = flowerJSON["query"]["pages"][pageId]["extract"].stringValue
                flowerTextLabel.text = flowerText
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

}


