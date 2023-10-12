//
//  ProfileViewController.swift
//  IOTPROJECT
//
//  Created by prem  on 11/10/23.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        responseModel?.list[0...7].count ?? 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyWeatherViewCell", for: indexPath) as? DailyWeatherViewCell else { return UICollectionViewCell() }

        let listArray = responseModel?.list[indexPath.row]
        let maxTemp = listArray?.temp
 if let maxTemperature = maxTemp {
     cell.maxTempLabel.text = String(describing: maxTemperature)
 } else {
     cell.maxTempLabel.text = "No data"
 }


        let dateList = responseModel?.list[indexPath.row]
 if let weekDate = dateList?.dt {
     let dateFormatter = DateFormatter()
     let date = Date(timeIntervalSinceNow: TimeInterval((weekDate)))
     dateFormatter.locale = Locale(identifier: "en_US")
     dateFormatter.setLocalizedDateFormatFromTemplate("MMMd") // set template after setting locale
     print(dateFormatter.string(from: date))
     cell.dayLabel.text = dateFormatter.string(from: date)
 } else {
     cell.dayLabel.text = "No data"
 }

 return cell

    }
    

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherNowDescriptionLabel: UILabel!
    @IBOutlet weak var weatherNowLabel: UILabel!
    @IBOutlet weak var dailyWeatherTableView: UITableView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var userDescription: UILabel!
    
    
    var responseModel: Welcome9?
    var degreeSymbol = "º"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "DailyWeatherViewCell", bundle: nil), forCellWithReuseIdentifier: "DailyWeatherViewCell")
        currentWeatherRequest()
   
        updateView()
  
        //self.dailyWeatherTableView.automatic
        
    }

    
    func currentWeatherRequest() {
    let session = URLSession.shared
        let weatherURL = URL(string: "https://openweathermap.org/forecast16")!
    let dataTask = session.dataTask(with: weatherURL) { (data: Data?,response: URLResponse?,error: Error?) in
        if let error = error {
                print("Error:\n\(error)")

            } else {
                if let jsonData = data {

                    do {
                        let dataString = String(data: jsonData, encoding: String.Encoding.utf8)
              print("Daily weather data:\n\(dataString!)")
                    let decoder = JSONDecoder()

                        self.responseModel = try decoder.decode(Welcome9.self, from: jsonData)

                        DispatchQueue.main.async {
                            self.cityNameLabel.text = self.responseModel?.city.name
                           self.weatherNowLabel.text = (self.responseModel?.list[0].weather[0].main).map { $0 }
                            self.weatherNowDescriptionLabel.text = self.responseModel?.list[0].weather[0].weatherDescription
                                self.dailyWeatherTableView.reloadData()
                            self.updateView()

                        }

                    } catch let error {
                      print("Error: \(error)")
                    }
                }else {
                print("Error: did not receive data")

            }
            }
        }
        dataTask.resume()

    }

    public func updateView(){

        let temp = responseModel?.list[0].temp
   if let temperature = temp {
       self.temperatureLabel.text = "\(String(describing: temperature))\(self.degreeSymbol)"

   } else {
       self.temperatureLabel.text = "No data"

   }

   }

    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}






