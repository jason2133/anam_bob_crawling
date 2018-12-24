class HomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def index
    @mon = Anambobeat.find_by_day("월")    
    @tue = Anambobeat.find_by_day("화")    
    @wed = Anambobeat.find_by_day("수")    
    @thu = Anambobeat.find_by_day("목")    
    @fri = Anambobeat.find_by_day("금")    
    @sat = Anambobeat.find_by_day("토")
  end

  def eating
    doc = Nokogiri::HTML(open("https://www.korea.ac.kr/user/restaurantMenuAllList.do?siteId=university&id=university_050402000000"))

  for i in (2..7)
    bob = Anambobeat.new

      if i == 7
          day = doc.css(".ku_restaurant//ul//li:nth-child(3)//ol:nth-child(#{i})//span.day").inner_text  
          bob.day = day
  
          date = doc.css(".ku_restaurant//ul//li:nth-child(3)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[1].inner_text  
          bob.date = date

          mornhan = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[0].inner_text
          bob.mornhan = mornhan

          mornyang = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[1].inner_text
          bob.mornyang = mornyang

          takeout = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[2].inner_text
          bob.takeout = takeout

      else
          day = doc.css(".ku_restaurant//ul//li:nth-child(3)//ol:nth-child(#{i})//span.day").inner_text  
          bob.day = day
  
          date = doc.css(".ku_restaurant//ul//li:nth-child(3)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[1].inner_text  
          bob.date = date
  
          mornhan = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[0].inner_text
          bob.mornhan = mornhan

          mornyang = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[1].inner_text
          bob.mornyang = mornyang

          takeout = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[2].inner_text
          bob.takeout = takeout
  
          lunch = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[3].inner_text
          bob.lunch = lunch
        
          dinner = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[4].inner_text
          bob.dinner = dinner
      end
      bob.save
    end
    redirect_to '/'
  end
end


