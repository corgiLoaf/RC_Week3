//
//  ChatMockUp.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/06.
//

import UIKit

//temp Data
struct chat{
    var profile : String = "defaultProfile"
    var nickname: String
    var location: String
    var date : String
    var message : String
    var itemImage : String
}

var chat1 : chat = chat(nickname: "알파", location: "동선동5가", date: "1일 전", message: "네 감사합니다!", itemImage: "bag")
var chat2 : chat = chat(nickname: "베타", location: "숭인제2동", date: "1주 전", message: "지금 제가 밖이라서 나중에 보내드려도 될까요?", itemImage: "bag")
var chat3 : chat = chat(nickname: "감마", location: "안암동5가", date: "2주 전", message: "오메가님이 이모티콘을 보냈어요.", itemImage: "applePencil")
var chat4 : chat = chat(profile: "profile1", nickname: "델타", location: "종암동", date: "1달 전", message: "6출 앞입니다", itemImage: "camera")
var chat5 : chat = chat(profile: "profile2", nickname: "엡실론", location: "성북동", date: "1달 전", message: "넵!", itemImage: "applePencil")
var chat6 : chat = chat(nickname: "제타", location: "제기동", date: "1달 전", message: "네 알겠습니다", itemImage: "freitag")
var chat7 : chat = chat(profile: "profile3", nickname: "에타", location: "종암동", date: "2달 전", message: "가고 있는 중 입니다 도착하면 알려주세요", itemImage: "freitag")
var chat8 : chat = chat(nickname: "세타", location: "길음동", date: "3달 전", message: "넵 !", itemImage: "bag")
var chat9 : chat = chat(nickname: "이오타", location: "제기동", date: "5달 전", message: "모자 쓰고 있습니다", itemImage: "camera")

var chatMockUpData : [chat] = [chat1, chat2, chat3, chat4, chat5, chat6, chat7, chat8, chat9]
