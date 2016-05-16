class Api::V1::PostsController < Api::V1::BaseController
 # #22
   before_action :authenticate_user, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]

   def index
    post = Post.all
     render json: post.to_json, status: 200
   end

   def show
    post = Post.find(params[:id])
     render json: post.to_json(include: :comments), status: 200
   end
 end
