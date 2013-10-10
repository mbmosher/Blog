class TagsController < ApplicationController

def new
	@tag = Tag.new
end

def create
	@tag = Tag.new(params[:tag].permit(:name))
	@tag.save
	redirect_to post_path(@post)
end

def destroy
	@tag = @tag.find(params[:id])
	@tag.destroy
	redirect_to post_path(@post)
end

def index
	@tags = Tag.all
end

def show
	@post = Post.find(params[:post_id])
	@tags = Post.tag.find(params[:post_id])
end

end
