class PostsController < ApplicationController
 
  def new
    if current_user
      @post = Post.new
      render :new
    else
      flash[:error] = "Need to login to post post."
      redirect_to login_path
    end
  end

  # add new post to database
  def create
    # redirect user if already logged in
    if current_user
      post = Post.new(post_params)
      post.user_id = current_user.id
      puts "this is post event id == #{post.event_id}"

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
    if current_user 
      @post = Post.find(params[:id])
      render :edit
    else
      flash[:error] = "Need to login to create post."
      redirect_to login_path
    end
  end

  def update
    post = Post.find(params[:id])
    if current_user
       if post.update_attributes(post_params)
         redirect_to event_path(post.event_id)
         flash[:notice] = "Successfully updated post:#{post.body}!"
       else
        flash[:error] = post.errors.full_messages.join(', ')
        redirect_to edit_post_path  
       end
    else
      flash[:error] = flash[:error] = "Need to login to create post."
      redirect_to edit_post_path
    end

  end

  def destroy
    if post = Post.find(params[:id])
      if current_user
        flash[:notice] = "Successfully deleted post!"
        event_id=post.event_id
        post.delete
        redirect_to event_path(event_id)
      else
        flash[:error] = "You need to login in to delete post."
        redirect_to login_path
     end
   else
      flash[:error] = post.errors.full_messages.join(', ')
      redirect_to events_path
   end
  end


  private
    def post_params
      params.require(:post).permit(:body, :image, :user_id, :event_id)
    end
end
