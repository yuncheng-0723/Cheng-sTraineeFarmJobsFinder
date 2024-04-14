//
//  FarmJob.swift
//  Cheng'sTraineeFarmJobsFinder
//
//  Created by 允丞 on 2024/4/13.
//

import Foundation

struct FarmJob:Decodable   {
    let city: String
    let farm_name: String
    let job_name: String
    let demand_num: String
    let leave_num: String
    let manager: String
    let unit_address: String
    let dining_offer: String
    let dorm_offer: String
    let on_work: String
    let job_intro: String
    let conditions: String
    let address: String
    let workfare: String
    let service: String
}

func fetchData(completion: @escaping ([FarmJob]?, Error?) -> Void) {
//    let url = "https://data.moa.gov.tw/Service/OpenData/FarmJobInfo.aspx?IsTransData=1&UnitId=B61"
    
    if let url = URL(string: "https://data.moa.gov.tw/Service/OpenData/FarmJobInfo.aspx?IsTransData=1&UnitId=B61") {
        // GET
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // 假如錯誤存在，則印出錯誤訊息（ 例如：網路斷線等等... ）
            if let error = error {
                print("Error: \(error.localizedDescription)")
              // 取得 response 和 data
            } else if let response = response as? HTTPURLResponse,let data = data {
                // 將 response 轉乘 HTTPURLResponse 可以查看 statusCode 檢查錯誤（ ex: 404 可能是網址錯誤等等... ）
                print("Status code: \(response.statusCode)")
                // 創建 JSONDecoder 實例來解析我們的 json 檔
                let decoder = JSONDecoder()
                // decode 從 json 解碼，返回一個指定類型的值，這個類型必須符合 Decodable 協議
                do {
                    // 將回傳的 JSON 資料解析為結構
                    let decodedData = try JSONDecoder().decode([FarmJob].self, from: data)
                    
                    // 成功解析，可以在這裡使用解析後的資料
                    print(decodedData)
                    completion(decodedData, nil)
                } catch {
                    // 解析失敗
                    print("Error decoding data: \(error)")
                    completion(nil, error)
                }
//                if let FarmJobs = try? decoder.decode([FarmJob].self, from: data) {
//                    print("============== FarmJobs data ==============")
//                    print(FarmJobs)
//                    print("============== FarmJobs data ==============")
//                }
            }
            }.resume()
    } else {
        print("Invalid URL.")
    }
}
