class PagesController < ApplicationController
  def index
    if current_user
      if current_user.facebook
        if current_user.twitter
          @facebook_friends = current_user.facebook.fetch.friends
          @twitter_friends = current_user.twitter.friends.users

           current_user.twitter.friends.users.each do |tf|
             @facebook_friends.reject!{ |ff| ff.name == tf.name }
           end

           current_user.facebook.fetch.friends.each do |ff|
             @twitter_friends.reject!{ |tf| tf.name == ff.name }
           end
        end
      end
    end

  end

end
