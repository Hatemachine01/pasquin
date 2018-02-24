class StaticController < ApplicationController
 def homepage
 	@example_post = Post.first
 end
end
