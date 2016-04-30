class SponsoredPostsController < ApplicationController

  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  # def number_field(object_name, method, options = {})
  # Tags::NumberField.new(object_name, method, self, options).render
  # end
  #
  # def number_field_tag(name, value = nil, options = {})
  #       options = options.stringify_keys
  #       options["type"] ||= "number"
  #       if range = options.delete("in") || options.delete("within")
  #         options.update("min" => range.min, "max" => range.max)
  #       end
  #       text_field_tag(name, value, options)
  #     end

  def create

    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])

    @sponsored_post.topic = @topic

    if @sponsored_post.save

      flash[:notice] = "Sponsored Post was saved successfully."
      redirect_to [@topic, @sponsored_post]
    else

      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

end
