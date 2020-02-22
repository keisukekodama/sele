require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 60)
d = Selenium::WebDriver.for :chrome

# 自分の
# url = "http://54.92.62.121/"
# 受講生の
url = "http://localhost:3000/" 

# サインアップ1
d.get(url+"/users/sign_up")
name = d.find_element(:id, 'user_name')
email = d.find_element(:id, 'user_email')
password = d.find_element(:id, 'user_password')
confirmation = d.find_element(:id, 'user_password_confirmation')

user1="tech@camp15"
user2="tech@camp168"
pass="techcamp3"

name.send_keys(user1)
email.send_keys(user1)
password.send_keys(pass)
confirmation.send_keys(pass)
d.find_element(:name,"commit").click
wait.until {d.find_element(:class, "fa-cog").displayed?}
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

# グループ作成
d.get(url+"/groups/new")
wait.until {d.find_element(:id,"group_name").displayed?}
d.find_element(:id,"group_name").send_keys('tsr')
sleep 1
d.find_element(:id, 'user-search-field').send_keys("t")
sleep 1
#want 検索のランダム化
d.find_element(:class,"user-search-add").click
d.find_element(:name,"commit").click
sleep 1

puts "インクリメンタルサーチ完了"

d.get(url+"/groups/1/messages")
sleep 3

d.execute_script("window.open()") #make new tab
d.switch_to.window(d.window_handles[1]) #switch new tab
d.get(url+"/groups/1/messages")


sleep 3
# what メッセージ送信
d.find_element(:id,'message_content').send_keys('tes')
d.find_element(:name,"commit").click


sleep 3

# what 画像送信
d.find_element(:id,"message_image").send_keys('/Users/tech-camp/Desktop/test.jpg')
d.find_element(:name,"commit").click
puts "非同期通信でのメッセージ送信完了"
sleep 3
# what 画像送信＋メッセージ送信ここで連続で押すとエラーが出るため手動で押す
d.find_element(:id,'message_content').send_keys('test')
d.find_element(:id,"message_image").send_keys('/Users/tech-camp/Desktop/test.jpg')
d.find_element(:name,"commit").click
puts "自動更新が確認できればLGTM"
d.save_screenshot("/Users/tech-camp/Desktop/a.png")

sleep 180