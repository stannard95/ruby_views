class PostsController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new { File.join(root, 'views')}

    $comments = [{
      title: "Comment 1",
      body: "This is the first comment",
      url: "youtubeUrl"
  }, {
      title: "Comment 2",
      body: "This is the second comment",
      url: "youtubeUrl"
  }, {
      title: "Comment 3",
      body: "This is the third comment",
      url: "youtubeUrl"
  }]

  # Returns all the videos with comments
  get '/comments' do
    @page_header = "All the comments"
    @comments = $comments
    erb :"comments/index"
  end


  get '/comments/:id' do
    id = params[:id].to_i #Index
    @comment = $comments[id] #Creates element, accesses it from $comments
    erb :"show" #file path for page
  end
end