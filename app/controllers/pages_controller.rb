class PagesController < ApplicationController
  def index
    @facebook_friends = current_user.facebook.fetch.friends
    @twitter_friends = current_user.twitter.friends.users

   # @facebook_friends.reject!{ |ff| ff.name == @twitter_friends.each { |tf| tf.name } }
   # @twitter_friends.reject!{ |tf| tf.name == @facebook_friends.each { |ff| ff.name } }

   current_user.twitter.friends.users.each do |tf|
     @facebook_friends.reject!{ |ff| ff.name == tf.name }
   end

   current_user.facebook.fetch.friends.each do |ff|
     @twitter_friends.reject!{ |tf| tf.name == ff.name }
   end

  end

end
