class PostsController < ApplicationController
 
  def new
    if current_user
      @post = Post.new
      render :new
    else
      flash[:error] = "Need to login to post event."
      redirect_to login_path
    end
  end

  # add new post to database
  def create
    # redirect user if already logged in
    if current_user
      post = Post.new(post_params)
      post.user_id = current_user.id
      post.event_id = Event.find(post.user_id).id
      puts "this is post image == #{post.image}"
      puts "this is post image.url == #{post.image.url}"

      if post.save
        flash[:notice] = "Successfully saved post."
        redirect_to event_path(post.event)
      else
        flash[:error] = post.errors.full_messages.join(', ')
        redirect_to events_path
      end
    else
      flash[:error] = "Need to login to create post."
      redirect_to login_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
    def post_params
      params.require(:post).permit(:body, :image, :user_id, :event_id)
    end
end
