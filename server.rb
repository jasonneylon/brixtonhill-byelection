# encoding: UTF-8
# Encoding.default_internal = Encoding.default_external = 'UTF-8'

require "bundler/setup"
require "sinatra"
require 'sinatra/contrib'
require "haml"
require "sass"
require "sinatra/reloader" if development?
require 'net/http'
require 'rexml/document'
require "sass/plugin/rack"

require 'bigdecimal'
require 'ostruct'
require 'json'

require File.join(File.dirname(__FILE__), *%w[lib helpers])

include Helpers

configure do
  set :haml, { :attr_wrapper => '"', :format => :html5 }

 Sass::Plugin.compiler.add_template_location("./public/sass")
 use Sass::Plugin::Rack
end

get "/" do
  candidates = [{:name=>"Timothy Peter Briggs", :party=>"Conservative Party", :postcode=>"SW4 9RJ", :lat=>"51.4592333039634", :lon=>"-0.138048550387006"}, {:name=>"Andrew James Child", :party=>"Green Party", :postcode=>"SW2 4DS", :lat=>"51.4514894", :lon=>"-0.125009524016465"}, {:name=>" Elizabeth Eirwen Jones", :party=>"UK Independence Party", :postcode=>"SW4 7HE", :lat=>"51.4647832", :lon=>"-0.1304024"}, {:name=>"Daniel Peter Lambert", :party=>"The Socialist Party", :postcode=>"BR7 5DS", :lat=>"51.4204366", :lon=>"0.0604686"}, {:name=>"Liz Maffei", :party=>"Liberal Democrats", :postcode=>"SW4 7NN", :lat=>"51.4612611", :lon=>"-0.1324097"}, {:name=>"Steve Nally", :party=>"Trade Unionist and Socialist Coalition", :postcode=>"SW8 1UA", :lat=>"51.4825139", :lon=>"-0.1184079"}, {:name=>"Martin Andreas Tiedemann", :party=>"Labour and Co-operative Party Candidate", :postcode=>" SW2 5BA", :lat=>"51.4550832", :lon=>"-0.1224233"}]
  
 	haml :index, :locals => { :candidates => candidates }
end
