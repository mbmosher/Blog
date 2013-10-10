class PostsController < ApplicationController

# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show, :archive]

def new
	@post = Post.new
end

def create
	# render text: params[ :post ].inspect
	@post = Post.new(params[:post].permit(:title, :text))
 
  if @post.save
  	redirect_to @post
  else
  	render 'new'
  end
end

def show
	@post = Post.find(params[:id])
	@tags = Tag.all.reorder('name')
	# @posttags = Posttag.where("post_id = ?", params[@post.id])
	# @ptags = Tag.find_by id: @posttags.tag_id		
	@ptags = Tag.joins(:posttags).where(posttags: {post_id: @post.id}) 
	# @post.tags.include?( tag ) --- in show.html
end

def index
	@posts = Post.last(5).reverse
	@tags = Tag.all.reorder('name')
end

def archive
	@posts = Post.all
end

def edit
	@post = Post.find(params[:id])
end

def update
	@post = Post.find(params[:id])
	
	if @post.update(params[:post].permit(:title, :text))
		redirect_to @post
	else
		render 'edit'
	end
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to posts_path
end

def taggedposts
	@tag = Tag.find(params[:t_id])
	@posts = Post.joins(:posttags).where(posttags: {tag_id: @tag.id})
end

def addtag
	@post = Post.find(params[:id])
	@tag = Tag.find(params[:tag_id])
	@ptags = Tag.joins(:posttags).where(posttags: {post_id: @post.id}) 
	if @ptags.find_by id: @tag.id
	else
		Posttag.create(:post_id => @post.id, :tag_id => @tag.id)
	end
	redirect_to @post
end


private
def post_params
	params.require(:post).permit(:title, :text)
end

end
