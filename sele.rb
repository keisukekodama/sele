require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 180000)
d = Selenium::WebDriver.for :chrome
d.manage.window.resize_to(800, 900)
# 自分の
# url = "http://localhost:3000/"

user1 = "tech@ca00004"
user2 = "tech@ca98984"
pass = "techcamp3"
group_name = "testgswkrop"
group_name2 = "testgswkrop2"
# 受講生のURLを記入
url = "http://18.177.194.86" 


# サインアップ1
d.get(url+"/users/sign_up")
name = d.find_element(:id, 'user_name')
email = d.find_element(:id, 'user_email')
password = d.find_element(:id, 'user_password')
confirmation = d.find_element(:id, 'user_password_confirmation')

name.send_keys(user1)
email.send_keys(user1)
password.send_keys(pass)
confirmation.send_keys(pass)
d.find_element(:name,"commit").click
# wait.until {d.find_element(:class, "fa-cog").displayed?}
# ログアウト
  d.find_element(:class, "fa-cog").click
  sleep 2
  if d.find_elements(:class, "btn").size > 0
    d.find_element(:class, "btn").click
   sleep 4
  elsif d.find_elements(:class, "Button").size > 0
  d.find_element(:class, "Button").click
  else
     puts "idが違うからエラーでてます。issueに上げましょう！"
  end
  sleep 2

  if d.find_elements(:class, "btn").size > 0
     d.find_element(:class, "btn").click
  sleep 4
  elsif d.find_elements(:class, "Button").size > 0
  d.find_element(:class, "Button").click
  else
     puts "idが違うからエラーでてます。issueに上げましょう！"
  sleep 2
  end
wait.until {d.find_element(:id, 'user_name').displayed?}
# サインアップ2
  name = d.find_element(:id, 'user_name')
  email = d.find_element(:id, 'user_email')
  password = d.find_element(:id, 'user_password')
  confirmation = d.find_element(:id, 'user_password_confirmation')

  name.send_keys(user2)
  email.send_keys(user2)
  password.send_keys(pass)
  confirmation.send_keys(pass)
  d.find_element(:name,"commit").click

  puts "ログイン済み"

  # #ログイン
  # d.get(url+"/users/sign_in")
  # email = d.find_element(:id, 'user_email')
  # password = d.find_element(:id, 'user_password')
  # email.send_keys(user1)
  # password.send_keys(pass)
  # d.find_element(:name,"commit").click
  # puts "ログイン済み"
  
# グループ作成
d.get(url+"/groups/new")
wait.until {d.find_element(:id,"group_name").displayed?}
d.find_element(:id,"group_name").send_keys(group_name)



if d.find_elements(:id, 'user-search-field').size > 0
  d.find_element(:id, 'user-search-field').send_keys("t")
sleep 4
elsif d.find_elements(:id, "UserSearch__field").size > 0
d.find_element(:id, "UserSearch__field").send_keys("t")
else
  puts "idが違うからエラーでてます。issueに上げましょう！"
sleep 2
end




sleep 2
d.save_screenshot("/Users/tech-camp/Desktop/chat-space-ss/グループ新規作成画面.png")


#want 検索のランダム化


if d.find_elements(:class,"user-search-add").size > 0
  d.find_element(:class,"user-search-add").click
sleep 4
elsif d.find_elements(:class, "ChatMember__add").size > 0
d.find_element(:class, "ChatMember__add").click
else
  puts "idが違うからエラーでてます。issueに上げましょう！"
sleep 2
end

sleep 2

if /削除/ .match(d.page_source)
  puts "インクリメンタルサーチ成功"
else
  puts "インクリメンタルサーチ失敗"
  wait
end
sleep 1
puts "" if wait.until {
  /削除/ .match(d.page_source)

}

d.find_element(:name,"commit").click

# グループ作成2
d.get(url+"/groups/new")
wait.until {d.find_element(:id,"group_name").displayed?}
d.find_element(:id,"group_name").send_keys(group_name2)



if d.find_elements(:id, 'user-search-field').size > 0
  d.find_element(:id, 'user-search-field').send_keys("t")
sleep 4
elsif d.find_elements(:id, "UserSearch__field").size > 0
d.find_element(:id, "UserSearch__field").send_keys("t")
else
  puts "idが違うからエラーでてます。issueに上げましょう！"
sleep 2
end




sleep 2
d.save_screenshot("/Users/tech-camp/Desktop/chat-space-ss/グループ新規作成画面.png")


#want 検索のランダム化


if d.find_elements(:class,"user-search-add").size > 0
  d.find_element(:class,"user-search-add").click
sleep 4
elsif d.find_elements(:class, "ChatMember__add").size > 0
d.find_element(:class, "ChatMember__add").click
else
  puts "idが違うからエラーでてます。issueに上げましょう！"
sleep 2
end

sleep 2

if /削除/ .match(d.page_source)
  puts "インクリメンタルサーチ成功"
else
  puts "インクリメンタルサーチ失敗"
  wait
end
sleep 1
puts "" if wait.until {
  /削除/ .match(d.page_source)

}

d.find_element(:name,"commit").click

d.get(url+"/groups/1/messages")
sleep 3
#make new tab
d.execute_script("window.open()") 

 #switch new tab
 d.switch_to.window(d.window_handles[1])
d.get(url+"/groups/1/messages")


sleep 1
# what メッセージ送信

if d.find_elements(:id, 'message_content').size > 0
   d.find_element(:id,'message_content').send_keys('Graphical_User_Interface')
  sleep 4
elsif d.find_elements(:id, 'message_text').size > 0
    d.find_element(:id,'message_text').send_keys('Graphical_User_Interface')
  
elsif d.find_elements(:id,'message_body').size > 0
    d.find_element(:id,'message_body').send_keys('Graphical_User_Interface')
else
    puts "idが違うからエラーでてます。issueに上げましょう！"
    
end

d.find_element(:name,"commit").click

sleep 2
if /Graphical_User_Interface/ .match(d.page_source)
  puts "非同期通信のメッセージ送信成功"
else
  puts "非同期通信のメッセージ送信失敗"
  wait
end

puts "" if wait.until {
  /Graphical_User_Interface/ .match(d.page_source)
}


 sleep 3

# what 画像送信
d.find_element(:id,"message_image").send_keys("/Users/tech-camp/Desktop/test.jpg")
d.find_element(:name,"commit").click
sleep 3
if /test.jp/ .match(d.page_source)
  puts "非同期通信の画像送信成功"
else
  puts "非同期通信の画像送信失敗"
end

puts "" if wait.until {
  /test.jpg/ .match(d.page_source)
}

sleep 1
# what 画像送信＋メッセージ送信
if d.find_elements(:id,'message_content').size > 0
  d.find_element(:id,'message_content').send_keys('HyperText_Markup_Language')
    
  elsif d.find_elements(:id,'message_text').size > 0
    d.find_element(:id,'message_text').send_keys('HyperText_Markup_Language')
  
  elsif d.find_elements(:id,'message_body').size > 0
    d.find_element(:id,'message_body').send_keys('HyperText_Markup_Language')
  else
    puts "idが違うからエラーでてます。issueに上げましょう！"
    
end
d.find_element(:id,"message_image").send_keys('/Users/tech-camp/Desktop/test.jpg')
d.find_element(:name,"commit").click

sleep 2
if /HyperText_Markup_Language/ .match(d.page_source)
  puts "非同期通信のメッセージと画像の同時送信成功" 
else
  puts "非同期通信のメッセージと画像の同時送信失敗" 
  wait
end

puts "" if wait.until {
  /HyperText_Markup_Language/ .match(d.page_source)
}


if /undefined/ .match(d.page_source)
  puts "問題あり" 
  wait
else
  puts "問題なし" 
end

sleep 2
d.save_screenshot("/Users/tech-camp/Desktop/chat-space-ss/非同期通信画面.png")

d.switch_to.window(d.window_handles[0])

sleep 4
if /HyperText_Markup_Language/ .match(d.page_source)
  puts "自動更新成功" 
else
  puts "自動更新失敗" 
  wait
end

puts "" if wait.until {
  /HyperText_Markup_Language/ .match(d.page_source)
}

d.save_screenshot("/Users/tech-camp/Desktop/chat-space-ss/自動更新画面.png")
if /undefined/ .match(d.page_source)
  puts "問題あり" 
  sleep 180
else
  puts "問題なし" 
  puts "LGTM!"
end




sleep 180