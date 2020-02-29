require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 60)
d = Selenium::WebDriver.for :chrome
d.manage.window.resize_to(800, 900)
# 自分の
# url = "http://localhost:3000/"

user1 = "tech@campfdff"
user2 = "tech@caff2ff"
pass = "techcamp3"
group_name = "testgroup"
# 受講生のURLを記入
url = "http://18.177.80.19" 


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
  d.find_element(:class, "btn").click
  d.find_element(:class, "btn").click
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

sleep 1
d.find_element(:id, 'user-search-field').send_keys("t")

if /追加/ .match(d.page_source)
  puts "インクリメンタルサーチ成功"
else
  puts "インクリメンタルサーチ失敗"
end

puts "" if wait.until {
  /追加/ .match(d.page_source)
}

sleep 2
d.save_screenshot("/Users/tech-camp/Desktop/chat-space-ss/グループ新規作成画面.png")


#want 検索のランダム化
d.find_element(:class,"user-search-add").click
d.find_element(:name,"commit").click
sleep 1


d.get(url+"/groups/1/messages")
sleep 3
#make new tab
d.execute_script("window.open()") 

 #switch new tab
 d.switch_to.window(d.window_handles[1])
d.get(url+"/groups/1/messages")


sleep 1
# what メッセージ送信
textelement = d.find_element(:id,'message_content')
sleep 1
textelement.send_keys('tes')
sleep 1
d.find_element(:name,"commit").click


if /tes/ .match(d.page_source)
  puts "非同期通信のメッセージ送信成功"
else
  puts "非同期通信のメッセージ送信失敗"
end

puts "" if wait.until {
  /tes/ .match(d.page_source)
}


 sleep 3

# what 画像送信
d.find_element(:id,"message_image").send_keys("/Users/tech-camp/Desktop/test.jpg")
d.find_element(:name,"commit").click
sleep 1
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
d.find_element(:id,'message_content').send_keys('test')
d.find_element(:id,"message_image").send_keys('/Users/tech-camp/Desktop/test.jpg')
d.find_element(:name,"commit").click


if /test/ .match(d.page_source)
  puts "非同期通信のメッセージと画像の同時送信成功" 
else
  puts "非同期通信のメッセージと画像の同時送信失敗" 
end

puts "" if wait.until {
  /test/ .match(d.page_source)
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

if /tes/ .match(d.page_source)
  puts "自動更新成功" 
else
  puts "自動更新失敗" 
end

puts "" if wait.until {
  /tes/ .match(d.page_source)
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