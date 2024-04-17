//
//  ContentView.swift
//  Cheng'sTraineeFarmJobsFinder
//
//  Created by 允丞 on 2024/4/13.
//

import SwiftUI

struct ContentView: View {
    @State private var farmJobsData: [FarmJob] = []
    
    var body: some View {
        NavigationView {
                GeometryReader { geometry in
                    ScrollView{
                        VStack {
                            
                            Rectangle()
                                .fill(Color(red: 73/255, green: 98/255, blue: 188/255))
                                .cornerRadius(15)
                                .frame(width: geometry.size.width - 32, height: (geometry.size.width - 32) * 1.15)
                            // 使用 GeometryReader 獲取父視圖的大小，並根據比例調整高度
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)) // 添加 padding
                                .overlay(
                                    Image("home") // 添加圖片
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width - 32, height: (geometry.size.width - 32) * 0.75) // 根據 Rectangle 的大小調整圖片大小
                                        .clipShape(RoundedRectangle(cornerRadius: 15)) // 使用 clipShape 方法
                                )
                            
                            Text("根據您的需求\n找到需要的實習農場職缺")
                                .font(.system(size: 26, weight: .bold)) // 設置字體大小和粗體
                                .foregroundColor(Color(red: 51/255, green: 40/255, blue: 104/255))
                                .multilineTextAlignment(.center) // 文字置中對齊
                                .padding(.top, 16) // 添加頂部間距
                            
                            Text("尋找實習農場職缺，我們依您的需求量身打造。我們提供多樣化的機會，包括農作物種植、畜牧養殖、農業科技等領域。無論您是初學者還是有經驗的專業人士，我們都歡迎您的加入。我們注重團隊合作，提供良好的學習環境和專業指導，讓您發揮所長，實現個人和團隊目標。請即聯繫我們，探索您在農場領域的職業生涯！")
                                .font(.system(size: 14)) // 設置字體大小
                                .foregroundColor(Color(red: 123/255, green: 117/255, blue: 157/255)) // 設置字體顏色
                                .multilineTextAlignment(.center) // 文字置中對齊
                                .padding(.vertical, 5)
                                .padding(.horizontal, 20) // 添加水平間距
                                .fixedSize(horizontal: false, vertical: true) // 讓文字可以垂直擴展至所需大小
                            
                            
                            HStack {
                                Text("最新職缺")
                                    .font(.system(size: 20, weight: .bold)) // 設置字體大小和粗體
                                    .foregroundColor(Color(red: 47/255, green: 37/255, blue: 101/255)) // 設置字體顏色
                                    .padding(.leading, 16) // 左邊間距
                                
                                Spacer()
                                NavigationLink(destination: JobsPage()) {
                                    
                                    Text("查看全部")
                                        .font(.system(size: 12)) // 設置字體大小
                                        .foregroundColor(Color(red: 240/255, green: 116/255, blue: 77/255)) // 設置字體顏色
                                        .frame(width: 100, height: 40) // 設置按鈕大小
                                        .background(Color(red: 244/255, green: 235/255, blue: 235/255)) // 設置按鈕背景色
                                        .cornerRadius(20) // 設置按鈕圓角
                                        .padding(.trailing, 16) // 右邊間距
                                }
                            }
                            
                            
                            ScrollView(.horizontal) { // 設置 ScrollView 的方向為水平方向
                                HStack(spacing: 10) { // 水平排列方塊，並設置間距
                                    ForEach(farmJobsData.indices, id: \.self) { index in
                                        let item = farmJobsData[index]
                                        NavigationLink(destination: JobsDetailPage(item: item)) {
                                            
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Color.white)
                                                .shadow(radius: 5)
                                                .frame(width: 280, height: 150) // 調整方塊的大
                                                .overlay(
                                                    VStack(alignment: .leading){
                                                        Text(item.city)
                                                            .font(.system(size: 16, weight: .bold)) // 設置字體大小和粗體
                                                            .foregroundColor(Color(red: 51/255, green: 40/255, blue: 104/255)) // 設置字體顏色
                                                            .frame(width: 100, height: 40) // 設置按鈕大小
                                                            .background(Color(red: 244/255, green: 235/255, blue: 235/255)) // 設置按鈕背景色
                                                            .cornerRadius(20)
                                                        
                                                        Spacer()
                                                        
                                                        Text(item.farm_name) // 顯示資料中的 farm_name 屬性
                                                            .font(.system(size: 18, weight: .bold))
                                                            .foregroundColor(.black)
                                                        
                                                        Spacer()
                                                        
                                                        HStack {
                                                            // 左邊圓形圖片
                                                            Image("\(Int.random(in: 1...3))")
                                                                .resizable()
                                                                .frame(width: 30, height: 30)
                                                                .foregroundColor(Color(red: 202/255, green: 196/255, blue: 235/255))
                                                                .overlay(
                                                                    Circle()
                                                                        .stroke(Color(red: 202/255, green: 196/255, blue: 235/255), lineWidth: 2.5)
                                                                )
                                                            
                                                            Spacer()
                                                            
                                                            // 右邊文字
                                                            Text("\(item.demand_num)人")
                                                                .font(.system(size: 16, weight: .bold))
                                                                .foregroundColor(Color(red: 241/255, green: 145/255, blue: 75/255))
                                                        }
                                                        
                                                        
                                                        
                                                    }
                                                        .padding()
                                                )
                                        }
                                        
                                        
                                    }
                                    
                                }
                                .padding()
                            }
                        }
                    }
                }
                
            }
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)) // 添加 padding
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                // 在 ContentView 被顯示時執行 API 請求
                fetchData { data, error in
                    if let error = error {
                        print("Error fetching data: \(error)")
                        return
                    }

                    if let data = data {
                        // 將獲取到的資料存儲到 fetchedData 變數中
                        farmJobsData = data
                    }
                }
            
        }

    }
        
}

struct JobsPage: View {
    var body: some View {
        Text("Jobs Page Content")
    }
}

struct JobsDetailPage: View {
    let item: FarmJob // 傳入的資料
    @State private var showingAlert = false
    
    var body: some View {
        
        ScrollView {
            Text("職缺詳細")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color(red: 47/255, green: 37/255, blue: 101/255))
                .padding()
            
            Rectangle()
                .fill(Color(red: 73/255, green: 98/255, blue: 188/255))
                .cornerRadius(15)
                .frame(width: .infinity, height: 200)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)) // 添加 padding
                .overlay(
                    Image("jobDetail") // 添加圖片
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity, height: 200) // 根據 Rectangle 的大小調整圖片大小
                        .clipShape(RoundedRectangle(cornerRadius: 15)) // 使用 clipShape 方法
                )
            
            VStack(alignment: .leading) {
                // 在這裡添加其他內容，例如文本、圖像等
                Text(item.job_name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.black)
                
                HStack{
                    Image("\(Int.random(in: 1...3))")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(red: 202/255, green: 196/255, blue: 235/255))
                        .overlay(
                            Circle()
                                .stroke(Color(red: 202/255, green: 196/255, blue: 235/255), lineWidth: 2.5)
                        )
                    
                    VStack(alignment: .leading) {
                        Text(item.farm_name)
                            .font(.system(size: 12))
                            .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                        
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.blue)
                            Text(item.address)
                                .font(.system(size: 12))
                                .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                        }
                    }
                    
                }
                
                VStack(alignment: .leading) {
                    Text("主要商品及服務項目")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                    Text(item.service)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                    Text("負責人")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                    Text(item.manager)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                    Text("見習內容")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                    Text(item.job_intro)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                    Text("報名條件")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                    Text(item.conditions.isEmpty ? "無" : item.conditions)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                    Text("見習時段")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                    Text(item.on_work)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                }

                VStack(alignment: .leading) {
                    Text("需求人數")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                    Text("\(item.demand_num) 人")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                    Text("是否膳供應/宿供應")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                    Text("\(item.dining_offer) / \(item.dorm_offer)")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                    Text("休假制度")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                    Text(item.workfare)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 125/255, green: 138/255, blue: 148/255))
                }
                
                Button(action: {
                    showingAlert = true
                        }) {
                            Text("尚有 \(item.leave_num) 名額 點此報名")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 51/255, green: 40/255, blue: 104/255))
                                .cornerRadius(15)
                        }
                        .alert(isPresented: $showingAlert) {
                                    // 在警报中添加要显示的标题和消息
                                    Alert(title: Text("Alert"), message: Text("報名成功"), dismissButton: .default(Text("OK")))
                                }
            }
            .padding()
            

        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
