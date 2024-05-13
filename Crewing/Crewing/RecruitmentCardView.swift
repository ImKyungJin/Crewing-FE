
//
//  RecruitmentCardView.swift
//  Crewing
//
//  Created by 임경진 on 5/13/24.
//

import SwiftUI

struct RecruitmentCardView: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color("gray-10"))
            
            HStack {
                
                // * 동아리 프로필 이미지
                //RoundedRectangle(cornerRadius: 10)
                Image("dummy")
                //.stroke(Color("secondary_"), lineWidth: 1) // 이미지 경계 구분을 위한 테두리 선 추가
                    .resizable()
                    .frame(width: 68, height: 68)
                    .padding(EdgeInsets(top: 14, leading: 14, bottom: 14, trailing: 0))
                
                VStack {
                    
                    // * 동아리 이름
                    HStack {
                        Text("노스페어스")
                            .font(.system(size: 12))
                            .bold()
                        
                        Spacer()
                    }
                    
                    // * 별점 및 동아리 소개글
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 9, height: 9)
                        
                        Text("3.9")
                            .font(.system(size: 9))
                        
                        Text("볼링에 진심인 사람들이 모여있는 동아리")
                            .font(.system(size: 9))
                        
                        Spacer()
                    }
                    
                    // * 관심항목 및 후기 개수
                    HStack(spacing: 3) {
                        
                        Text("스포츠")
                            .font(.system(size: 9))
                            .padding(3)
                            .background(Color.white)
                            .foregroundColor(Color("secondary_"))
                            .cornerRadius(5)
                        
                        Text("D-12")
                            .font(.system(size: 9))
                            .padding(3)
                            .background(Color.white)
                            .foregroundColor(Color("secondary_"))
                            .cornerRadius(5)
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis.message.fill")
                        
                        Text("3")
                            .font(.system(size: 10))
                        
                    }
                    
                } // VStack
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 10))
                
            } // HStack
            
        } // ZStack
        .frame(width: 350, height: 90, alignment: .leading)
        .padding(5)
        
    } // body
    
}

#Preview {
    RecruitmentCardView()
}
