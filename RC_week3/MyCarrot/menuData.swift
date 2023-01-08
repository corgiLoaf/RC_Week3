//
//  menuData.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/06.
//

import Foundation

struct menu {
    var icon : String
    var title : String
}

let menu1 : menu = menu(icon: "list.bullet.rectangle.portrait", title: "판매내역")
let menu2 : menu = menu(icon: "bag", title: "구매내역")
let menu3 : menu = menu(icon: "heart", title: "관심목록")
let menu4 : menu = menu(icon: "book.closed", title: "당근 가계부")
let menu5 : menu = menu(icon: "doc.text", title: "동네생활 글/댓글")
let menu6 : menu = menu(icon: "speaker.wave.2", title: "광고")
let menu7 : menu = menu(icon: "note.text", title: "동네홍보 글")

//let menus : [menu] = [menu1, menu2, menu3, menu4, menu5, menu5, menu6, menu7]
