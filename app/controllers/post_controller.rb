class PostController < ApplicationController
    before_action :authenticate_user!
end
