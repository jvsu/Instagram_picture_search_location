
require 'json'  
require 'net/http'  #to make a GET request
require 'open-uri' #to fetch the data from the URL to then be parsed by JSON

class SearchController < ApplicationController
	# $google_uri= "http://maps.googleapis.com/maps/api/geocode/json?address=sanfranciso,ca&sensor=false" # uri for google
	

  def index
    
    #if a session id exists then do this code 
    if session[:user_id]
        @user = User.find(session[:user_id]) # get user information by the id
        @sess = session[:user_id]
      else 
        @status = false
    end

  end

  def api

  	#get data from google location API
  	google_sensor ="&sensor=false" # this is the second parameter sent to google. 
  	location_input = location_params[:location]
  	location = location_input.delete(" ")
  	$google_uri = "http://maps.googleapis.com/maps/api/geocode/json?"+"address=#{location},"+google_sensor
  	uri1 = URI.parse($google_uri)
  	http= Net::HTTP.new(uri1.host, uri1.port)
  	request = Net::HTTP::Get.new(uri1.request_uri) #request to google api
  	response = http.request(request)
  	all_google_data = response.body
  	google_data = JSON.load(all_google_data)
  	lat = google_data["results"][0]["geometry"]["location"]["lat"]
  	lng = google_data["results"][0]["geometry"]["location"]["lng"]
  	#end of google API code


    instagram_client_id = "&client_id=619ec5d205b943f88a1a96888ae361e9"
     $instagram_uri= "https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lng}&distance=1000"+instagram_client_id #uri for instagram NEED TO ADD THE KEY
    uri_insta = URI.parse($instagram_uri)
    http1= Net::HTTP.new(uri_insta.host, uri_insta.port)
    #make sure you add this code since you are dealing with https
    http1.use_ssl = true
    http1.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri_insta.request_uri)
    response = http1.request(request)
    all_insta_data = response.body
    insta = JSON.load(all_insta_data)
     insta_data = insta['data']

  # if there is a session create(the user is logged in), then send the right credentials to save pic
  if session[:user_id]
    user = User.find(session[:user_id])
    json_data = {:pic=>insta_data, :location=>location_input, :logged_in=>true, :user=>user}
    render json: json_data
  else
    json_data = {:pic=>insta_data, :location=>location_input}
    render json: json_data
  end
   


  	#instagram API
  	
  #information for the ajax response
  


  end

  private
  def location_params
  	params.require(:location).permit(:location)
  end
end
