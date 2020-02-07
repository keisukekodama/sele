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

user1="tech@camp45"
user2="tech@camp68"
pass="techcamp3"

name.send_keys(user1)
email.send_keys(user1)
password.send_keys(pass)
confirmation.send_keys(pass)
d.find_element(:name,"commit").click
wait.until {d.find_element(:class, "fa-cog").displayed?}


  # d.get(url+"/users/\d+\/edit").click
  d.find_element(:class, "fa-cog").click

  d.find_element(:class, "btn").click
  d.find_element(:class, "btn").click
  wait.until {d.find_element(:id, 'user_name').displayed?}
  # d.get(url+"/users/sign_up")
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
#want グループの名前ランダムで入れる。
if true
wait.until {d.find_element(:id,"group_name").displayed?}
d.find_element(:id,"group_name").send_keys('tsr')
sleep 1
d.find_element(:id, 'user-search-field').send_keys("t")
sleep 1
#want 検索のランダム化
# wait.until { d.find_element(:class, 'user-search-add').displayed? }
d.find_element(:class,"user-search-add").click
d.find_element(:name,"commit").click
sleep 1

else

puts "インクリメンタルサーチエラー"
end



# d.find_element(:xpath, "//html/body/div[2]/div/div[2]/a[3]").click
d.get(url+"/groups/1/messages")
sleep 5

d.execute_script("window.open()") #make new tab
d.switch_to.window(d.window_handles[1]) #switch new tab
d.get(url+"/groups/1/messages")


sleep 10
# want group_idの検索
# d.find_element(:id,"message_content").send_keys('test')
# d.find_element(:name,"commit").click
# what メッセージ送信
d.find_element(:id,'message_content').send_keys('tes')
d.find_element(:name,"commit").click
# element = driver.switch_to.active_element
# element.send_keys('アクティブな要素に入力', :enter)

sleep 5

# what 画像送信
d.find_element(:id,"message_image").send_keys('/Users/tech-camp/Desktop/test.jpg')
d.find_element(:name,"commit").click
sleep 5
# what 画像送信＋メッセージ送信ここで連続で押すとエラーが出るため手動で押す
d.find_element(:id,'message_content').send_keys('test')
d.find_element(:id,"message_image").send_keys('/Users/tech-camp/Desktop/test.jpg')
d.find_element(:name,"commit").click

sleep 30