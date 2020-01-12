require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 60)
d = Selenium::WebDriver.for :chrome

# 自分の
# url = "http://54.92.62.121/"
# 受講生の
url = "http://18.177.70.113" 

# # サインアップ
# d.get(url+"/users/sign_up")
# name = d.find_element(:id, 'user_name')
# email = d.find_element(:id, 'user_email')
# password = d.find_element(:id, 'user_password')
# confirmation = d.find_element(:id, 'user_password_confirmation')


# name.send_keys("tech-camp")
# email.send_keys("tech@camp")
# password.send_keys("techcamp")
# confirmation.send_keys("techcamp")
# d.find_element(:name,"commit").click

# d.get(url+"/users/sign_up")
# name = d.find_element(:id, 'user_name')
# email = d.find_element(:id, 'user_email')
# password = d.find_element(:id, 'user_password')
# confirmation = d.find_element(:id, 'user_password_confirmation')


# name.send_keys("cech-camp")
# email.send_keys("cech@camp")
# password.send_keys("techcamp")
# confirmation.send_keys("techcamp")
# d.find_element(:name,"commit").click

# サインイン
d.get(url+"/users/sign_in")
email = d.find_element(:id, 'user_email')
password = d.find_element(:id, 'user_password')
email.send_keys("tech@camp")
password.send_keys("techcamp")
d.find_element(:name,"commit").click
sleep 3

# グループ作成
d.get(url+"/groups/new")
#want グループの名前ランダムで入れる。
d.find_element(:id,"group_name").send_keys('tsr')
sleep 1
d.find_element(:id, 'user-search-field').send_keys("a")
sleep 1
#want 検索のランダム化
# wait.until { d.find_element(:class, 'user-search-add').displayed? }
d.find_element(:class,"user-search-add").click
d.find_element(:name,"commit").click
sleep 1


# d.find_element(:xpath, '//*[@href="/html/body/div[2]/div[1]/div[2]/div[1]/a"]').click
# d.get.(url+"/groups/8/messages") 
# d.find_element(:xpath, "//html/body/div[2]/div/div[2]/a[3]").click
d.get(url+"/groups/1/messages")
sleep 5

d.execute_script("window.open()") #make new tab
d.switch_to.window(d.window_handles[1]) #switch new tab
d.get(url+"/groups/1/messages")


sleep 30
# want group_idの検索
# d.find_element(:id,"message_content").send_keys('test')
# d.find_element(:name,"commit").click
# what メッセージ送信
d.find_element(:id,'message_message').send_keys('tes')
d.find_element(:name,"commit").click
# element = driver.switch_to.active_element
# element.send_keys('アクティブな要素に入力', :enter)



# what 画像送信
d.find_element(:id,"message_image").send_keys('/Users/tech-camp/Desktop/test.jpg')
d.find_element(:name,"commit").click
sleep 5
# what 画像送信＋メッセージ送信ここで連続で押すとエラーが出るため手動で押す
d.find_element(:id,'message_message').send_keys('test')
d.find_element(:id,"message_image").send_keys('/Users/tech-camp/Desktop/test.jpg')
d.find_element(:name,"commit").click

sleep 30