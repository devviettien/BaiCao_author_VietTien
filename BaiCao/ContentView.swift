//
//  ContentView.swift
//  BaiCao
//
//  Created by Nhật Hoàng on 06/07/2023.
//

import SwiftUI

struct BoBai: Codable {
    var name: String
    var value: Int
}

struct ContentView: View {

    @State var quan1: String = ""
    @State var quan2: String = ""
    @State var quan3: String = ""
    
    @State var quan4: String = ""
    @State var quan5: String = ""
    @State var quan6: String = ""
    
    @State var show : Bool = false
    
    @State var bai: [BoBai] = [] // Thêm @State để sử dụng trong hàm rutbai()
    
    @State var originBai: [BoBai] = [] // Mảng để theo dõi các bài còn lại

    @State var who : String = ""
    
    var body: some View {
        VStack {
            Text("\(who)")
                .font(Font.system(size: 50))
                .foregroundColor(Color.red)
            Text("Bàn máy").font(Font.system(size: 50))
            HStack{
                Image(show ? quan1 : "up")
                    .resizable()
                    .frame(width: 150, height: 250)
                Image(show ? quan2 : "up")
                    .resizable()
                    .frame(width: 150, height: 250)
                Image(show ? quan3 : "up")
                    .resizable()
                    .frame(width: 150, height: 250)
            }
            Spacer()
            Text("Bàn bạn").font(Font.system(size: 50))
            HStack{
                Image(show ? quan4 : "up")
                    .resizable()
                    .frame(width: 150, height: 250)
                Image(show ? quan5 : "up")
                    .resizable()
                    .frame(width: 150, height: 250)
                Image(show ? quan6 : "up")
                    .resizable()
                    .frame(width: 150, height: 250)
            }
            HStack{
                Button("Rút bài"){
                    rutbai()
                }
                .font(Font.system(size: 50))
                Divider()
                Button("Chơi lại"){
                    choilai()
                }
                .font(Font.system(size: 50))
            }
        }
        .padding()
        .onAppear {
            if let url = Bundle.main.url(forResource: "Contents", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    self.bai = try JSONDecoder().decode([BoBai].self, from: data)
                    
                    self.originBai = self.bai
                    // Sử dụng biến "bai" ở đây sau khi giải mã thành công
                    

                } catch {
                    print("Không thể giải mã JSON: \(error)")
                }
            } else {
                print("Không tìm thấy URL cho tệp tin JSON")
            }
        }
    }
    
    func rutbai(){
        
        if bai.count<20 {
            bai = originBai
            print("Không đủ BÀIIIIIIII")
            return
        }
        
        var random1 = Int.random(in: 0..<bai.count)
        quan1 = bai[random1].name
        var giatri1 = bai[random1].value
        bai.remove(at: random1)
        
        var random2 = Int.random(in: 0..<bai.count)
        quan2 = bai[random2].name
        var giatri2 = bai[random2].value
        bai.remove(at: random2)
        
        var random3 = Int.random(in: 0..<bai.count)
        quan3 = bai[random3].name
        var giatri3 = bai[random3].value
        bai.remove(at: random3)
        
        var random4 = Int.random(in: 0..<bai.count)
        quan4 = bai[random4].name
        var giatri4 = bai[random4].value
        bai.remove(at: random4)
        
        var random5 = Int.random(in: 0..<bai.count)
        quan5 = bai[random5].name
        var giatri5 = bai[random5].value
        bai.remove(at: random5)
        
        var random6 = Int.random(in: 0..<bai.count)
        quan6 = bai[random6].name
        var giatri6 = bai[random6].value
        bai.remove(at: random6)
        
        show = true
        
        if((giatri1+giatri2+giatri3)>(giatri4+giatri5+giatri6)){
            print("Máy THẮNG")
            who = "MÁY"
        } else if ((giatri1+giatri2+giatri3)<(giatri4+giatri5+giatri6)){
            print("Bạn THẮNG")
            who = "BẠN"
        } else {
            print("HOÀ")
            who = "HOÀ"
        }
    }

    func choilai(){
        show = false
        bai = originBai
        // Khởi tạo lại mảng remainingBai
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
