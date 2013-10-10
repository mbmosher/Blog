class PosttagsController < ApplicationController

def new
	@posttag = Posttag.new
end

def create
	# render text: params[ :posttag ].inspect
	# @posttag = Posttag.new
	@posttag = Posttag.new(params[:posttag].permit(:post_id, :tag_id))
	@posttag.save
	redirect_to post_path(posttag.post_id)
end

def addnew
	@posttag = Posttag.new(params[:posttag].permit(:post_id, :tag_id))
	@posttag.post_id = @post.id
	@posttag.tag_id = @tag.id
	@posttag.save
	redirect_to posts_path(@posttag.post_id)
end

def index
end

end
