//
//  DataManager.swift
//  Cheng'sTraineeFarmJobsFinder
//
//  Created by 允丞 on 2024/4/13.
//

import Foundation

class DataManager: ObservableObject {
    @Published var farmJobs: [FarmJob] = []
    
    func fetchData() {
        guard let url = URL(string: "https://data.moa.gov.tw/Service/OpenData/FarmJobInfo.aspx?IsTransData=1&UnitId=B61") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([FarmJob].self, from: data)
                DispatchQueue.main.async {
                    self.farmJobs = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
