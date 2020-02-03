

import UIKit

enum KittenImageLocation: String {
    
    case http = "http://www.kittenswhiskers.com/wp-content/uploads/sites/23/2014/02/Kitten-playing-with-yarn.jpg"
    
    case https = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kitten_in_Rizal_Park%2C_Manila.jpg/460px-Kitten_in_Rizal_Park%2C_Manila.jpg"
    
    case error = "not a url"
}


class ViewController: UIViewController {
    let imageLocation = KittenImageLocation.http.rawValue

    @IBOutlet weak var buttonClicked: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func imageButtonPressed(_ sender: Any) {
        
        guard let imageUrl = URL(string: imageLocation)
            else{
                print("can not create URL")
                return
        }
        let task = URLSession.shared.dataTask(with: imageUrl) {(data , response , error) in
            guard let data = data else {
                print("no data or there is an error")
                return
            }
            let downloadImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.buttonClicked.image = downloadImage
                }
            }
            
        task.resume()
        
    }
    
}

